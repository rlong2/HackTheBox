# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open 10.129.145.73                           
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-12 16:17 MDT
Nmap scan report for 10.129.145.73
Host is up (0.054s latency).
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 1.18 seconds
             
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.129.145.73  
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-12 16:17 MDT
Nmap scan report for 10.129.145.73
Host is up (0.054s latency).
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 48:ad:d5:b8:3a:9f:bc:be:f7:e8:20:1e:f6:bf:de:ae (RSA)
|   256 b7:89:6c:0b:20:ed:49:b2:c1:86:7c:29:92:74:1c:1f (ECDSA)
|_  256 18:cd:9d:08:a6:21:a8:b8:b6:f7:9f:8d:40:51:54:fb (ED25519)
80/tcp open  http    Node.js (Express middleware)
|_http-title:  Bike 
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.14 seconds

```

# Gobuster
### gobuster - common (js, php)
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.145.73 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x js,php        
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.145.73
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              js,php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/css                  (Status: 301) [Size: 173] [--> /css/]
Progress: 6164 / 14250 (43.26%)[ERROR] Get "http://10.129.145.73/harming.php": dial tcp 10.129.145.73:80: connect: connection refused
<SNIP>
[ERROR] Get "http://10.129.145.73/hosted": dial tcp 10.129.145.73:80: connect: connection refused
/images               (Status: 301) [Size: 179] [--> /images/]
/js                   (Status: 301) [Size: 171] [--> /js/]
Progress: 14250 / 14250 (100.00%)
===============================================================
Finished
===============================================================
```

### gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://10.129.145.73 --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt

All connection refused messages.
```


