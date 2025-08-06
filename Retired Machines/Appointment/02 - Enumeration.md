# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.79.243
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 16:55 MDT
Nmap scan report for 10.129.79.243
Host is up (0.069s latency).
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 20.59 seconds
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 80 10.129.79.243                          
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 16:57 MDT
Nmap scan report for 10.129.79.243
Host is up (0.045s latency).

PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.38 ((Debian))
|_http-title: Login
|_http-server-header: Apache/2.4.38 (Debian)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 9.70 seconds

```

# gobuster
### gobuster - quick scan, js files
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.79.243 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x js 
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.79.243
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
/.htaccess.js         (Status: 403) [Size: 278]
/.hta                 (Status: 403) [Size: 278]
/.htaccess            (Status: 403) [Size: 278]
/.htpasswd            (Status: 403) [Size: 278]
/.htpasswd.js         (Status: 403) [Size: 278]
/css                  (Status: 301) [Size: 312] [--> http://10.129.79.243/css/]                                                                           
/fonts                (Status: 301) [Size: 314] [--> http://10.129.79.243/fonts/]                                                                         
/images               (Status: 301) [Size: 315] [--> http://10.129.79.243/images/]                                                                        
/index.php            (Status: 200) [Size: 4896]
/js                   (Status: 301) [Size: 311] [--> http://10.129.79.243/js/]                                                                            
/server-status        (Status: 403) [Size: 278]
Progress: 7751 / 9500 (81.59%)[ERROR] Get "http://10.129.79.243/sling": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
[ERROR] Get "http://10.129.79.243/small.js": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
/vendor               (Status: 301) [Size: 315] [--> http://10.129.79.243/vendor/]                                                                        
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```

### gobuster - small scan, directories
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.79.243 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt         
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.79.243
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/images               (Status: 301) [Size: 315] [--> http://10.129.79.243/images/]                                                                        
/css                  (Status: 301) [Size: 312] [--> http://10.129.79.243/css/]                                                                           
/js                   (Status: 301) [Size: 311] [--> http://10.129.79.243/js/]                                                                            
/vendor               (Status: 301) [Size: 315] [--> http://10.129.79.243/vendor/]                                                                        
/fonts                (Status: 301) [Size: 314] [--> http://10.129.79.243/fonts/]                                                                         
Progress: 27269 / 87665 (31.11%)^C
[!] Keyboard interrupt detected, terminating.
Progress: 27317 / 87665 (31.16%)
===============================================================
Finished
===============================================================
```