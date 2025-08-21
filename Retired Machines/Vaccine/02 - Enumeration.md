# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open 10.129.95.174
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-21 15:35 MDT
Nmap scan report for 10.129.95.174
Host is up (0.075s latency).
Not shown: 997 closed tcp ports (reset)
PORT   STATE SERVICE
21/tcp open  ftp
22/tcp open  ssh
80/tcp open  http
            
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.129.95.174                         
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-21 15:35 MDT
Nmap scan report for 10.129.95.174
Host is up (0.071s latency).
Not shown: 997 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
| ftp-syst: 
|   STAT: 
| FTP server status:
|      Connected to ::ffff:10.10.16.23
|      Logged in as ftpuser
|      TYPE: ASCII
|      No session bandwidth limit
|      Session timeout in seconds is 300
|      Control connection is plain text
|      Data connections will be plain text
|      At session startup, client count was 3
|      vsFTPd 3.0.3 - secure, fast, stable
|_End of status
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_-rwxr-xr-x    1 0        0            2533 Apr 13  2021 backup.zip
22/tcp open  ssh     OpenSSH 8.0p1 Ubuntu 6ubuntu0.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 c0:ee:58:07:75:34:b0:0b:91:65:b2:59:56:95:27:a4 (RSA)
|   256 ac:6e:81:18:89:22:d7:a7:41:7d:81:4f:1b:b8:b2:51 (ECDSA)
|_  256 42:5b:c3:21:df:ef:a2:0b:c9:5e:03:42:1d:69:d0:28 (ED25519)
80/tcp open  http    Apache httpd 2.4.41 ((Ubuntu))
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-title: MegaCorp Login
|_http-server-header: Apache/2.4.41 (Ubuntu)
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 11.93 seconds

```

# Gobuster
## gobuster - dir, common php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.95.174 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x html, php 
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.95.174
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              ,html
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.hta.html            (Status: 403) [Size: 278]
/.hta.                (Status: 403) [Size: 278]
/.htaccess            (Status: 403) [Size: 278]
/.hta                 (Status: 403) [Size: 278]
/.htaccess.           (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/.htaccess.html       (Status: 403) [Size: 278]
/.htpasswd.html       (Status: 403) [Size: 278]
/.htpasswd.           (Status: 403) [Size: 278]
Progress: 2959 / 14250 (20.76%)[ERROR] Get "http://10.129.95.174/cardinal": dial tcp 10.129.95.174:80: connect: connection refused
[ERROR] Get "http://10.129.95.174/cardinal.": dial tcp 10.129.95.174:80: connect: connection refused
[ERROR] Get "http://10.129.95.174/carbuyaction.": dial tcp 10.129.95.174:80: connect: connection refused
[ERROR] Get "http://10.129.95.174/card.html": dial tcp 10.129.95.174:80: connect: connection refused
[ERROR] Get "http://10.129.95.174/card": dial tcp 10.129.95.174:80: connect: connection refused
[ERROR] Get "http://10.129.95.174/carbuyaction.html": dial tcp 10.129.95.174:80: connect: connection refused
/index.php            (Status: 200) [Size: 2312]
/server-status        (Status: 403) [Size: 278]
Progress: 14250 / 14250 (100.00%)
===============================================================
Finished
===============================================================

```

## gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://10.129.95.174 --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://10.129.95.174
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
