# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.10.10.29                                      
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-18 13:10 MDT
Nmap scan report for 10.10.10.29
Host is up (0.057s latency).
Not shown: 65532 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
53/tcp open  domain
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 20.51 seconds             
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p- 10.10.10.29 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-18 13:11 MDT
Nmap scan report for 10.10.10.29
Host is up (0.049s latency).
Not shown: 65532 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.8 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   1024 08:ee:d0:30:d5:45:e4:59:db:4d:54:a8:dc:5c:ef:15 (DSA)
|   2048 b8:e0:15:48:2d:0d:f0:f1:73:33:b7:81:64:08:4a:91 (RSA)
|   256 a0:4c:94:d1:7b:6e:a8:fd:07:fe:11:eb:88:d5:16:65 (ECDSA)
|_  256 2d:79:44:30:c8:bb:5e:8f:07:cf:5b:72:ef:a1:6d:67 (ED25519)
53/tcp open  domain  ISC BIND 9.9.5-3ubuntu0.14 (Ubuntu Linux)
| dns-nsid: 
|_  bind.version: 9.9.5-3ubuntu0.14-Ubuntu
80/tcp open  http    Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 49.62 seconds
```

Appending /etc/hosts:
```
┌──(kali㉿kali)-[~]
└─$ cat /etc/hosts | grep bank
10.10.10.29      bank.htb

```
# Gobuster
## gobuster - common
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u bank.htb -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt                                
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://bank.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htpasswd            (Status: 403) [Size: 284]
/.htaccess            (Status: 403) [Size: 284]
/.hta                 (Status: 403) [Size: 279]
/assets               (Status: 301) [Size: 304] [--> http://bank.htb/assets/]
/inc                  (Status: 301) [Size: 301] [--> http://bank.htb/inc/]
/index.php            (Status: 302) [Size: 7322] [--> login.php]
/server-status        (Status: 403) [Size: 288]
/uploads              (Status: 301) [Size: 305] [--> http://bank.htb/uploads/]                                                                            
Progress: 4750 / 4750 (100.00%)
===============================================================
Finished
===============================================================

```

## gobuster - 2.3 medium
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u bank.htb -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-medium.txt 
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://bank.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/uploads              (Status: 301) [Size: 305] [--> http://bank.htb/uploads/]
/assets               (Status: 301) [Size: 304] [--> http://bank.htb/assets/]
/inc                  (Status: 301) [Size: 301] [--> http://bank.htb/inc/]
/server-status        (Status: 403) [Size: 288]
/balance-transfer     (Status: 301) [Size: 314] [--> http://bank.htb/balance-transfer/]                                                                   
Progress: 207641 / 207641 (100.00%)
===============================================================              
Finished                                                                     
===============================================================
```
