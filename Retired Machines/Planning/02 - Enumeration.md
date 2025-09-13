# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.10.11.68                                   
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-31 13:19 MDT
Nmap scan report for 10.10.11.68
Host is up (0.049s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 19.55 seconds
              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.10.11.68
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-31 13:20 MDT
Nmap scan report for 10.10.11.68
Host is up (0.072s latency).
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 9.6p1 Ubuntu 3ubuntu13.11 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 62:ff:f6:d4:57:88:05:ad:f4:d3:de:5b:9b:f8:50:f1 (ECDSA)
|_  256 4c:ce:7d:5c:fb:2d:a0:9e:9f:bd:f5:5c:5e:61:50:8a (ED25519)
80/tcp open  http    nginx 1.24.0 (Ubuntu)
|_http-title: Did not follow redirect to http://planning.htb/
|_http-server-header: nginx/1.24.0 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 10.54 seconds
```

Popped host into /etc/hosts
```
┌──(kali㉿kali)-[~]
└─$ cat /etc/hosts | grep planning    
10.10.11.68      planning.htb

```

# Gobuster
## gobuster - raft, js, php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://planning.htb -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-words-lowercase.txt -x js, php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://planning.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-medium-words-lowercase.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              js,
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/js                   (Status: 301) [Size: 178] [--> http://planning.htb/js/]
/css                  (Status: 301) [Size: 178] [--> http://planning.htb/css/]                                                                            
/img                  (Status: 301) [Size: 178] [--> http://planning.htb/img/]                                                                            
/lib                  (Status: 301) [Size: 178] [--> http://planning.htb/lib/]                                                                            
/..                   (Status: 400) [Size: 166]
/.                    (Status: 200) [Size: 23914]
Progress: 168879 / 168882 (100.00%)
===============================================================
Finished
===============================================================

```

## gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://planning.htb --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://planning.htb
[+] Method:          GET
[+] Threads:         10
[+] Wordlist:        /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Progress: 4989 / 4990 (99.98%)
===============================================================
Finished
===============================================================

```

```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://planning.htb --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/services-names.txt 
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://planning.htb
[+] Method:          GET
[+] Threads:         10
[+] Wordlist:        /usr/share/wordlists/SecLists/Discovery/DNS/services-names.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: grafana.planning.htb Status: 302 [Size: 29] [--> /login]
Progress: 1419 / 1420 (99.93%)
===============================================================
Finished
===============================================================
```

## Nikto
```
┌──(kali㉿kali)-[~]
└─$ nikto -host http://planning.htb  
- Nikto v2.5.0
---------------------------------------------------------------------------
+ Target IP:          10.10.11.68
+ Target Hostname:    planning.htb
+ Target Port:        80
+ Start Time:         2025-08-31 13:29:54 (GMT-6)
---------------------------------------------------------------------------
+ Server: nginx/1.24.0 (Ubuntu)
+ /: The anti-clickjacking X-Frame-Options header is not present. See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
+ /: The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type. See: https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/
+ No CGI Directories found (use '-C all' to force check all possible dirs)
+ /#wp-config.php#: #wp-config.php# file found. This file contains the credentials.
+ 7962 requests: 0 error(s) and 3 item(s) reported on remote host
+ End Time:           2025-08-31 13:37:15 (GMT-6) (441 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested


      *********************************************************************
      Portions of the server's headers (nginx/1.24.0) are not in
      the Nikto 2.5.0 database or are newer than the known string. Would you like
      to submit this information (*no server specific data*) to CIRT.net
      for a Nikto update (or you may email to sullo@cirt.net) (y/n)? n

                                                         
```