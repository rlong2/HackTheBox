# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.129.95.184
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-29 19:10 MDT
Nmap scan report for 10.129.95.184
Host is up (0.078s latency).
Not shown: 65527 closed tcp ports (reset), 6 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 20.76 seconds
             
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.129.95.184             
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-29 19:11 MDT
Nmap scan report for 10.129.95.184
Host is up (0.057s latency).
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.7 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 f6:5c:9b:38:ec:a7:5c:79:1c:1f:18:1c:52:46:f7:0b (RSA)
|   256 65:0c:f7:db:42:03:46:07:f2:12:89:fe:11:20:2c:53 (ECDSA)
|_  256 b8:65:cd:3f:34:d8:02:6a:e3:18:23:3e:77:dd:87:40 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-title: Welcome to Base
|_http-server-header: Apache/2.4.29 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 10.89 seconds
```

# Gobuster
## gobuster - common, js
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.95.184 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x js               
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.95.184
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              js
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta.js              (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/.htaccess            (Status: 403) [Size: 278]
/.htaccess.js         (Status: 403) [Size: 278]
/.hta                 (Status: 403) [Size: 278]
/.htpasswd.js         (Status: 403) [Size: 278]
/assets               (Status: 301) [Size: 315] [--> http://10.129.95.184/assets/]                                                                        
/forms                (Status: 301) [Size: 314] [--> http://10.129.95.184/forms/]                                                                         
/index.html           (Status: 200) [Size: 39344]
/login                (Status: 301) [Size: 314] [--> http://10.129.95.184/login/]                                                                         
/server-status        (Status: 403) [Size: 278]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```

## gobuster - common, php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.95.184 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.95.184
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
/.hta                 (Status: 403) [Size: 278]
/.hta.php             (Status: 403) [Size: 278]
/.htaccess.php        (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/.htaccess            (Status: 403) [Size: 278]
/.htpasswd.php        (Status: 403) [Size: 278]
/assets               (Status: 301) [Size: 315] [--> http://10.129.95.184/assets/]                                                                        
/forms                (Status: 301) [Size: 314] [--> http://10.129.95.184/forms/]                                                                         
/index.html           (Status: 200) [Size: 39344]
/login                (Status: 301) [Size: 314] [--> http://10.129.95.184/login/]                                                                         
/logout.php           (Status: 302) [Size: 0] [--> /login.php]
/server-status        (Status: 403) [Size: 278]
/upload.php           (Status: 302) [Size: 0] [--> /login/login.php]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```
## gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://10.129.95.184/ --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt 
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://10.129.95.184/
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