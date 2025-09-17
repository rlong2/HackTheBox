# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.10.10.75
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-17 16:32 MDT
Nmap scan report for 10.10.10.75
Host is up (0.065s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 20.15 seconds
              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p- 10.10.10.75
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-17 16:33 MDT
Nmap scan report for 10.10.10.75
Host is up (0.045s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 c4:f8:ad:e8:f8:04:77:de:cf:15:0d:63:0a:18:7e:49 (RSA)
|   256 22:8f:b1:97:bf:0f:17:08:fc:7e:2c:8f:e9:77:3a:48 (ECDSA)
|_  256 e6:ac:27:a3:b5:a9:f1:12:3c:34:a5:5d:5b:eb:3d:e9 (ED25519)
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
|_http-title: Site doesn't have a title (text/html).
|_http-server-header: Apache/2.4.18 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 35.56 seconds
```

# Curl
Shows a nibbleblog directory, lol
```
┌──(kali㉿kali)-[~]
└─$ curl 10.10.10.75                                                 
<b>Hello world!</b>














<!-- /nibbleblog/ directory. Nothing interesting here! -->

```
# Gobuster
## gobuster - common, php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u 10.10.10.75/nibbleblog -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x php
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.75/nibbleblog
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
/.hta.php             (Status: 403) [Size: 305]
/.htpasswd            (Status: 403) [Size: 306]
/.htaccess.php        (Status: 403) [Size: 310]
/.hta                 (Status: 403) [Size: 301]
/.htaccess            (Status: 403) [Size: 306]
/.htpasswd.php        (Status: 403) [Size: 310]
/README               (Status: 200) [Size: 4628]
/admin                (Status: 301) [Size: 321] [--> http://10.10.10.75/nibbleblog/admin/]                                                                
/admin.php            (Status: 200) [Size: 1401]
/admin.php            (Status: 200) [Size: 1401]
/content              (Status: 301) [Size: 323] [--> http://10.10.10.75/nibbleblog/content/]                                                              
/feed.php             (Status: 200) [Size: 302]
/index.php            (Status: 200) [Size: 2987]
/index.php            (Status: 200) [Size: 2987]
/install.php          (Status: 200) [Size: 78]
/languages            (Status: 301) [Size: 325] [--> http://10.10.10.75/nibbleblog/languages/]                                                            
/plugins              (Status: 301) [Size: 323] [--> http://10.10.10.75/nibbleblog/plugins/]                                                              
/sitemap.php          (Status: 200) [Size: 402]
/themes               (Status: 301) [Size: 322] [--> http://10.10.10.75/nibbleblog/themes/]                                                               
/update.php           (Status: 200) [Size: 1622]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```


