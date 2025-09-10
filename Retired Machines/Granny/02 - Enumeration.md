# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.10.10.15 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-10 09:35 MDT
Nmap scan report for 10.10.10.15
Host is up (0.057s latency).
Not shown: 65534 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 101.55 seconds
              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.10.10.15 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-10 09:37 MDT
Nmap scan report for 10.10.10.15
Host is up (0.059s latency).
Not shown: 999 filtered tcp ports (no-response)
PORT   STATE SERVICE VERSION
80/tcp open  http    Microsoft IIS httpd 6.0
| http-methods: 
|_  Potentially risky methods: TRACE DELETE COPY MOVE PROPFIND PROPPATCH SEARCH MKCOL LOCK UNLOCK PUT
| http-webdav-scan: 
|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, DELETE, COPY, MOVE, PROPFIND, PROPPATCH, SEARCH, MKCOL, LOCK, UNLOCK
|   WebDAV type: Unknown
|   Public Options: OPTIONS, TRACE, GET, HEAD, DELETE, PUT, POST, COPY, MOVE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, SEARCH
|   Server Date: Wed, 10 Sep 2025 15:37:48 GMT
|_  Server Type: Microsoft-IIS/6.0
|_http-title: Under Construction
|_http-server-header: Microsoft-IIS/6.0
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 19.58 seconds
```

# Gobuster
## gobuster - common
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u 10.10.10.15 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt           
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.15
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/Images               (Status: 301) [Size: 149] [--> http://10.10.10.15/Images/]                                                                          
/_private             (Status: 301) [Size: 153] [--> http://10.10.10.15/%5Fprivate/]                                                                      
/_vti_log             (Status: 301) [Size: 155] [--> http://10.10.10.15/%5Fvti%5Flog/]                                                                    
/_vti_bin             (Status: 301) [Size: 155] [--> http://10.10.10.15/%5Fvti%5Fbin/]                                                                    
/_vti_bin/_vti_adm/admin.dll (Status: 200) [Size: 195]
/_vti_bin/_vti_aut/author.dll (Status: 200) [Size: 195]
/_vti_bin/shtml.dll   (Status: 200) [Size: 96]
/aspnet_client        (Status: 301) [Size: 158] [--> http://10.10.10.15/aspnet%5Fclient/]                                                                 
/images               (Status: 301) [Size: 149] [--> http://10.10.10.15/images/]                                                                          
Progress: 4750 / 4750 (100.00%)
===============================================================
Finished
===============================================================
```