#! /usr/bin/env python
import threading
import subprocess
import traceback
import shlex
import sys,os,time,datetime
from subprocess import Popen, PIPE

ISOTIMEFORMAT="%Y-%m-%d %X"
def time2String( s ):

	#time format to string
	return time.strftime( ISOTIMEFORMAT, time.localtime( float(s)) )

partition = [4,8,12,16,20];


originalGraphName = "pokec-social-all.dat";
programFolder = "/home/yecol/Dataset/social-pokec/";

partitionProgram = "/home/yecol/repo/metis-5.1.0/build/Linux-x86_64/programs/gpartition";

logFilename = "./autorun.log";

logFile = open(logFilename,"w");


class Command(object):

	command = None
	process = None
	status = None
	output, error = '', ''

	def __init__(self, command):
		if isinstance(command, basestring):
			command = shlex.split(command)
		self.command = command

	def run(self, timeout=None, **kwargs):
		""" Run a command then return: (status, output, error). """
		def target(**kwargs):
			try:
				self.process = subprocess.Popen(self.command, **kwargs)
				self.output, self.error = self.process.communicate()
				self.status = self.process.returncode
			except:
				self.error = traceback.format_exc()
				self.status = -1
		# default stdout and stderr
		if 'stdout' not in kwargs:
			kwargs['stdout'] = subprocess.PIPE
		if 'stderr' not in kwargs:
			kwargs['stderr'] = subprocess.PIPE
		# thread
		thread = threading.Thread(target=target, kwargs=kwargs)
		thread.start()
		thread.join(timeout)
		if thread.is_alive():
			self.process.terminate()
			thread.join()
		return self.status, self.output, self.error

for p in partition: 

	# if not os.path.exists(str(p)):
	# 	os.makedirs(str(p));

	# cmm = "cp " + originalGraphName + " " + str(p);
	# print "cmm:" + cmm;
	# command = Command(cmm);
	# command.run()

	# cmm = partitionProgram + " ./" + str(p) + "/"+originalGraphName + " " + str(p)+"/";
	# print "cmm:" + cmm;
	# command = Command(cmm);
	# command.run()

	i = 0;
	while i < p:
		
		cmm = programFolder + "p-getpartitionedvlmv ./"+str(p)+"/pokec-social-all.dat - pokec.edges pokec.prop " + str(i);
		print "cmm:" + cmm;
		# command = Command(cmm);
		# command.run();

		print subprocess.Popen(cmm, shell=True, stdout=PIPE).stdout.read()

		cmm = programFolder + "p-formatvlmv2ve ./"+str(p)+"/graph-"+str(i)+".dat";
		print "cmm:" + cmm;
		# command = Command(cmm);
		# command.run()
		

		print subprocess.Popen(cmm, shell=True, stdout=PIPE).stdout.read()
		i = i+1;

