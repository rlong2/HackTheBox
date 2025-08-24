# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.129.69.47                        
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-23 17:53 MDT
Stats: 0:02:30 elapsed; 0 hosts completed (1 up), 1 undergoing SYN Stealth Scan
SYN Stealth Scan Timing: About 99.99% done; ETC: 17:55 (0:00:00 remaining)
Nmap scan report for 10.129.69.47
Host is up (0.056s latency).
Not shown: 38719 closed tcp ports (reset), 26815 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 157.47 seconds

              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 80 10.129.69.47    
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-23 17:34 MDT
Nmap scan report for 10.129.69.47
Host is up (1.1s latency).

PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
| http-title: Site doesn't have a title (text/html; charset=UTF-8).
|_Requested resource was http://10.129.69.47/?file=home.php

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 20.36 seconds

```

## nmap - UDP, quick
```
┌──(kali㉿kali)-[~]
└─$ nmap -T5 -Pn -p- --max-retries 0 --min-rate 400 -sU --open 10.129.69.47
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-23 21:00 MDT
Warning: 10.129.69.47 giving up on port because retransmission cap hit (0).
Nmap scan report for 10.129.69.47
Host is up (0.046s latency).
All 65535 scanned ports on 10.129.69.47 are in ignored states.
Not shown: 65464 open|filtered udp ports (no-response), 71 closed udp ports (port-unreach)

Nmap done: 1 IP address (1 host up) scanned in 72.82 seconds


```

# Gobuster
## gobuster - common, php
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.69.47 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x php   
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.69.47
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
/.git/index.php       (Status: 301) [Size: 311] [--> http://10.129.69.47/.git/]
/.htaccess            (Status: 403) [Size: 277]
/.htaccess.php        (Status: 403) [Size: 277]
/.hta                 (Status: 403) [Size: 277]
/.hta.php             (Status: 403) [Size: 277]
/.htpasswd.php        (Status: 403) [Size: 277]
/.htpasswd            (Status: 403) [Size: 277]
/admin_index.php      (Status: 301) [Size: 312] [--> http://10.129.69.47/admin_]
/blogindex.php        (Status: 301) [Size: 310] [--> http://10.129.69.47/blog]
/fonts                (Status: 301) [Size: 312] [--> http://10.129.69.47/fonts/]
/home.php             (Status: 200) [Size: 3704]
/images               (Status: 301) [Size: 313] [--> http://10.129.69.47/images/]
/index.php            (Status: 301) [Size: 306] [--> http://10.129.69.47/]
/index.php            (Status: 301) [Size: 306] [--> http://10.129.69.47/]
/index.php.php        (Status: 301) [Size: 310] [--> http://10.129.69.47/.php]                                                                            
/no-index.php         (Status: 301) [Size: 309] [--> http://10.129.69.47/no-]
/noindex.php          (Status: 301) [Size: 308] [--> http://10.129.69.47/no]
/rorindex.php         (Status: 301) [Size: 309] [--> http://10.129.69.47/ror]
/server-status        (Status: 403) [Size: 277]
Progress: 9500 / 9500 (100.00%)
===============================================================
Finished
===============================================================
```
## gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://10.129.69.47 --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://10.129.69.47
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

# Ffuf
Fuzzing doesn't work well because every result sends back a 200
```
┌──(kali㉿kali)-[/usr/…/wordlists/SecLists/Discovery/Web-Content]
└─$ ffuf -u http://10.129.69.47/?file=FUZZ -w raft-small-files-lowercase-php.txt

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://10.129.69.47/?file=FUZZ
 :: Wordlist         : FUZZ: /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-small-files-lowercase-php.txt
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200-299,301,302,307,401,403,405,500
________________________________________________

:: Progress: [1/4202] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Errprofile.php             [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 47ms]
:: Progress: [40/4202] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Ermember.php              [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 48ms]
:: Progress: [41/4202] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Erinstall.php             [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 47ms]
:: Progress: [42/4202] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Erregister.php            [Status: 200, Size: 0, Words: 1, Lines: 1, Duration: 48ms]

<SNIP>
```
