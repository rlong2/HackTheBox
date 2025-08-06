# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.11.239
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-05 17:51 MDT
Nmap scan report for 10.129.11.239
Host is up (0.067s latency).
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 19.69 seconds
              
```

### nmap scan 2: service version
- note: The box needed to be reset due to port 80 becoming undiscoverable, then filtered. That is why the IP address changed.
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 80 10.129.206.45    
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-05 17:57 MDT
Nmap scan report for 10.129.206.45
Host is up (0.045s latency).

PORT   STATE SERVICE VERSION
80/tcp open  http    nginx 1.14.2
|_http-title: Welcome to nginx!
|_http-server-header: nginx/1.14.2

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 10.07 seconds

```

# gobuster

### gobuster: medium scan
```
No results were found using the directory-list-2.3-medium.txt wordlist
```

### gobuster: medium scan, php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.206.45/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.206.45/
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/admin.php            (Status: 200) [Size: 999]
Progress: 61561 / 441122 (13.96%)^C
[!] Keyboard interrupt detected, terminating.
Progress: 61595 / 441122 (13.96%)
===============================================================
Finished
===============================================================

```