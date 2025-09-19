# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ nmap -T4 -Pn --open -p- 10.10.10.56 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-17 21:30 MDT
Nmap scan report for 10.10.10.56
Host is up (0.053s latency).
Not shown: 65505 closed tcp ports (reset), 28 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT     STATE SERVICE
80/tcp   open  http
2222/tcp open  EtherNetIP-1

Nmap done: 1 IP address (1 host up) scanned in 21.90 seconds
               
```

# Curl
```
┌──(kali㉿kali)-[~]
└─$ curl 10.10.10.56                                                 
 <!DOCTYPE html>
<html>
<body>

<h2>Don't Bug Me!</h2>
<img src="bug.jpg" alt="bug" style="width:450px;height:350px;">

</body>
</html> 

```
# Gobuster
## gobuster - common
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u 10.10.10.56 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.56
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta                 (Status: 403) [Size: 290]
/.htaccess            (Status: 403) [Size: 295]
/.htpasswd            (Status: 403) [Size: 295]
/cgi-bin/             (Status: 403) [Size: 294]
/index.html           (Status: 200) [Size: 137]
/server-status        (Status: 403) [Size: 299]
Progress: 4750 / 4750 (100.00%)
===============================================================
Finished
===============================================================
```

/cgi-bin/ seems relevant
https://linuxconfig.org/simple-cgi-and-apache-examples-on-ubuntu-linux

## gobuster - common /cgi-bin dir with extensions
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u 10.10.10.56/cgi-bin -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x html,php,js,sh,py,htm,pl
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.56/cgi-bin
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Extensions:              js,sh,py,htm,html,php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta.py              (Status: 403) [Size: 301]
/.hta                 (Status: 403) [Size: 298]
<SNIP>
/user.sh              (Status: 200) [Size: 118]
Progress: 33250 / 33250 (100.00%)
===============================================================
Finished
===============================================================

```