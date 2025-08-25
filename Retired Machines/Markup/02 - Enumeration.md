### Note: IP address changes are due to the box being reset
# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.129.95.192                                                               
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-25 15:49 MDT
Stats: 0:00:31 elapsed; 0 hosts completed (1 up), 1 undergoing SYN Stealth Scan
SYN Stealth Scan Timing: About 22.79% done; ETC: 15:51 (0:01:45 remaining)
Nmap scan report for 10.129.95.192
Host is up (0.051s latency).
Not shown: 65532 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
443/tcp open  https

Nmap done: 1 IP address (1 host up) scanned in 113.94 seconds
              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 22,80,443 10.129.224.59              
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-25 16:07 MDT
Nmap scan report for 10.129.224.59
Host is up (0.049s latency).

PORT    STATE SERVICE  VERSION
22/tcp  open  ssh      OpenSSH for_Windows_8.1 (protocol 2.0)
| ssh-hostkey: 
|   3072 9f:a0:f7:8c:c6:e2:a4:bd:71:87:68:82:3e:5d:b7:9f (RSA)
|   256 90:7d:96:a9:6e:9e:4d:40:94:e7:bb:55:eb:b3:0b:97 (ECDSA)
|_  256 f9:10:eb:76:d4:6d:4f:3e:17:f3:93:d6:0b:8c:4b:81 (ED25519)
80/tcp  open  http     Apache httpd 2.4.41 ((Win64) OpenSSL/1.1.1c PHP/7.2.28)
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-title: MegaShopping
|_http-server-header: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
443/tcp open  ssl/http Apache httpd 2.4.41 ((Win64) OpenSSL/1.1.1c PHP/7.2.28)
| tls-alpn: 
|_  http/1.1
| http-cookie-flags: 
|   /: 
|     PHPSESSID: 
|_      httponly flag not set
|_http-server-header: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
|_http-title: MegaShopping
| ssl-cert: Subject: commonName=localhost
| Not valid before: 2009-11-10T23:48:47
|_Not valid after:  2019-11-08T23:48:47
|_ssl-date: TLS randomness does not represent time

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 21.93 seconds

```


# Curl
```
┌──(kali㉿kali)-[~]
└─$ curl -I 10.129.95.192                                 
HTTP/1.1 200 OK
Date: Mon, 25 Aug 2025 21:50:10 GMT
Server: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
X-Powered-By: PHP/7.2.28
Set-Cookie: PHPSESSID=se003q8s0atk8pd9ham9bipf8a; path=/
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Type: text/html; charset=UTF-8

```

# Gobuster
## gobuster - common, php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.95.192 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x php | grep -v 403
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.95.192
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
/About.php            (Status: 302) [Size: 108] [--> /index.php]
/Contact.php          (Status: 302) [Size: 110] [--> /index.php]
/DB.php               (Status: 200) [Size: 0]
/Home.php             (Status: 302) [Size: 107] [--> /index.php]
/Images               (Status: 301) [Size: 340] [--> http://10.129.95.192/Images/]
/Index.php            (Status: 200) [Size: 12100]
/Products.php         (Status: 302) [Size: 111] [--> /index.php]
/Services.php         (Status: 302) [Size: 111] [--> /index.php]
/about.php            (Status: 302) [Size: 108] [--> /index.php]
/contact.php          (Status: 302) [Size: 110] [--> /index.php]
/db.php               (Status: 200) [Size: 0]
/examples             (Status: 503) [Size: 1060]
/home.php             (Status: 302) [Size: 107] [--> /index.php]
/images               (Status: 301) [Size: 340] [--> http://10.129.95.192/images/]
/index.php            (Status: 200) [Size: 12100]
/index.php            (Status: 200) [Size: 12100]
/process.php          (Status: 302) [Size: 110] [--> /index.php]
/products.php         (Status: 302) [Size: 111] [--> /index.php]
/services.php         (Status: 302) [Size: 111] [--> /index.php]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================

```

## gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://10.129.95.192 --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://10.129.95.192
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