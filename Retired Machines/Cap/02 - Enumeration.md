# nmap
### nmap scan 1: quick, all ports 
```
└─$ nmap -T4 -Pn --open -p- 10.10.10.245
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-26 16:16 MDT
Nmap scan report for 10.10.10.245
Host is up (0.057s latency).
Not shown: 65532 closed tcp ports (reset)
PORT   STATE SERVICE
21/tcp open  ftp
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 30.76 seconds
            
```

### nmap scan 2: service version
```
└─$ nmap -T4 -sV -sC -p- 10.10.10.245
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-26 16:19 MDT
Nmap scan report for 10.10.10.245
Host is up (0.064s latency).
Not shown: 65532 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 fa:80:a9:b2:ca:3b:88:69:a4:28:9e:39:0d:27:d5:75 (RSA)
|   256 96:d8:f8:e3:e8:f7:71:36:c5:49:d5:9d:b6:a4:c9:0c (ECDSA)
|_  256 3f:d0:ff:91:eb:3b:f6:e1:9f:2e:8d:de:b3:de:b2:18 (ED25519)
80/tcp open  http    Gunicorn
|_http-server-header: gunicorn
|_http-title: Security Dashboard
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 44.69 seconds

```

# Gobuster
# gobuster - common
```
└─$ gobuster dir -u 10.10.10.245 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-medium.txt
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.245
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/data                 (Status: 302) [Size: 208] [--> http://10.10.10.245/]
/ip                   (Status: 200) [Size: 17458]
/netstat              (Status: 200) [Size: 28803]
/capture              (Status: 302) [Size: 220] [--> http://10.10.10.245/data/2]                                                                          
Progress: 207641 / 207641 (100.00%)
===============================================================
Finished
===============================================================

```