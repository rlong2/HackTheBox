# nmap
### nmap scan 1: quick, all ports 
```
└─$ nmap -T4 -Pn --open -p- 10.10.10.242    
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-26 16:52 MDT
Nmap scan report for 10.10.10.242
Host is up (0.053s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 32.37 seconds
             
```
### nmap scan 2: service version
```
└─$ nmap -T4 -sV -sC -p- 10.10.10.242
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-26 16:53 MDT
Nmap scan report for 10.10.10.242
Host is up (0.057s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 be:54:9c:a3:67:c3:15:c3:64:71:7f:6a:53:4a:4c:21 (RSA)
|   256 bf:8a:3f:d4:06:e9:2e:87:4e:c9:7e:ab:22:0e:c0:ee (ECDSA)
|_  256 1a:de:a1:cc:37:ce:53:bb:1b:fb:2b:0b:ad:b3:f6:84 (ED25519)
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title:  Emergent Medical Idea
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 54.72 seconds

```
# source code
Interesting snippet in landing page source code...
```
  // INJECT CSS
  window.CP.exitedLoop(0);var css = document.createElement("style");
  css.type = "text/css";
  css.innerHTML = ".txt-rotate > .wrap { border-right: 0.04em solid #666 }";
  document.body.appendChild(css);
};
```
# Gobuster
# gobuster - common, php
```
└─$ gobuster dir -u 10.10.10.242 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x php                      
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.242
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Extensions:              php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htpasswd            (Status: 403) [Size: 277]
/.htaccess            (Status: 403) [Size: 277]
/.hta                 (Status: 403) [Size: 277]
/index.php            (Status: 200) [Size: 5815]
/index.php            (Status: 200) [Size: 5815]
/server-status        (Status: 403) [Size: 277]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```
Vhost fuzzing doesn't find anything (topX wordlist)
# curl
```
└─$ curl -I 10.10.10.242    
HTTP/1.1 200 OK
Date: Fri, 26 Sep 2025 23:14:15 GMT
Server: Apache/2.4.41 (Ubuntu)
X-Powered-By: PHP/8.1.0-dev
Content-Type: text/html; charset=UTF-8
```


