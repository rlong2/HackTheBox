# nmap
### nmap scan 1: quick, all ports 
```
└─$ nmap -T4 -Pn --open -p- 10.10.11.227 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-27 12:41 MDT
Nmap scan report for 10.10.11.227
Host is up (0.068s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 19.43 seconds              
```

### nmap scan 2: service version
```
└─$ nmap -T4 -sV -sC -p- 10.10.11.227
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-27 12:42 MDT
Nmap scan report for 10.10.11.227
Host is up (0.050s latency).
Not shown: 65533 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.9p1 Ubuntu 3ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 35:39:d4:39:40:4b:1f:61:86:dd:7c:37:bb:4b:98:9e (ECDSA)
|_  256 1a:e9:72:be:8b:b1:05:d5:ef:fe:dd:80:d8:ef:c0:66 (ED25519)
80/tcp open  http    nginx 1.18.0 (Ubuntu)
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 33.70 seconds

```

# Gobuster
## gobuster - vhost fuzzing
```
└─$ gobuster vhost -u keeper.htb --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                       http://keeper.htb
[+] Method:                    GET
[+] Threads:                   10
[+] Wordlist:                  /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
[+] User Agent:                gobuster/3.8
[+] Timeout:                   10s
[+] Append Domain:             true
[+] Exclude Hostname Length:   false
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
tickets.keeper.htb Status: 200 [Size: 4236]
Progress: 4989 / 4989 (100.00%)
===============================================================
Finished
===============================================================

```