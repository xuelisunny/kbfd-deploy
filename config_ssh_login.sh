#!/bin/bash
#
#----------------------------------------------------------
#  build the ssh connection without the password.
#             -h: help
#             -f: the file of host name
#                 hostfile only need write the host name list
#                 and the first ip is manager
#             -i: the file of key
#             -p: password
#             -u: username
#----------------------------------------------------------
grape_help(){
  echo "#----------------------------------------------------------"
  echo "#  build the ssh connection without the password."
  echo "#             -f: the file of host name"
  echo "#                 hostfile only need write the host name list"
  echo "#                 and the first host name is manager"
  echo "#             -i: the file of key"
  echo "#             -p: password"
  echo "#             -u: username"
  echo "#             -h: help"
  echo "#----------------------------------------------------------"
  exit
}
while getopts :f:i:p:u:h opts; do
  case ${opts} in
    f) HOSTFILE=${OPTARG} ;;
    i) IDENTIFYFILE=${OPTARG} ;;
    p) PASSWD=${OPTARG} ;;
    u) USERNAME=${OPTARG} ;;
    h) grape_help ;;
    ?) ;;
  esac
done
readonly HOSTFILE
readonly IDENTIFYFILE
readonly PASSWD
readonly USERNAME
# must need -f: filename and -u: username
if [[ -z "${USERNAME}" ]];then
  echo "must use -u: username"
  grape_help
  exit
fi
if [[ -z "${HOSTFILE}" ]];then
  echo "must use -f: the file of host ip"
  grape_help
  exit
else
  machine_array=($(awk '{print $1}' ./${HOSTFILE}))
fi
# ssh localhost
ssh_local=(
  'ssh-keygen -t rsa -P ""'
  'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
  'chmod 644 ~/.ssh/authorized_keys'
)
# ssh other
GET_SELF_PUB_ID='cat ~/.ssh/id_rsa.pub'
TO_OTHER_PUB_ID='cat >> ~/.ssh/authorized_keys'
# host install docker and config
# $1:the hostname
# $2:command
remote_call(){
  comm=""
  if [[ -n "${PASSWD}" ]];then
    comm="echo -e '${PASSWD}\n' | "
  fi
  if [[ "$#" -ne 1 ]];then
    comm=${comm}" sshpass "
    if [[ -n "${PASSWD}" ]];then
      comm=${comm}" -p '${PASSWD}' "
    fi
  fi
  comm=${comm}" ssh "
  if [[ -n "${IDENTIFYFILE}" ]];then
    comm=${comm}" -i ${IDENTIFYFILE} "
  fi
  if [[ -z "${USERNAME}" ]];then
    comm=${comm}" $1 '$2' "
  else
    comm=${comm}" ${USERNAME}@$1 '$2' "
  fi
  eval ${comm}
}
IFS_old=${IFS}
IFS=$'\n'
for machine in ${machine_array[*]};do
  echo -e "exit\n" | remote_call '${machine}'
done
sudo apt-get update && sudo apt-get install -y sshpass
for machine in ${machine_array[*]};do
  n=0
  ssh_local_length=${#ssh_local[@]}
  while (( $n < ${ssh_local_length} )) ; do
    comm_str="remote_call ${machine} '${ssh_local[$n]}'"
    eval ${comm_str}
    n=$(($n+1))
  done
# send machine`s self_pub to each to_machine
  for to_machine in ${machine_array[*]};do
    comm_str="remote_call ${machine} '${GET_SELF_PUB_ID}' \
      | remote_call ${to_machine}  '${TO_OTHER_PUB_ID}'"
    eval ${comm_str}
  done
done
IFS=${IFS_old}
