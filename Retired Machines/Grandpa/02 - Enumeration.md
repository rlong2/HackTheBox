# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ nmap -T4 -Pn --open -p- 10.10.10.14
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-13 10:31 MDT
Nmap scan report for 10.10.10.14
Host is up (0.048s latency).
Not shown: 65534 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 92.36 seconds
             
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ nmap -T4 -sV -sC -p 80 10.10.10.14
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-13 10:34 MDT
Nmap scan report for 10.10.10.14
Host is up (0.050s latency).

PORT   STATE SERVICE VERSION
80/tcp open  http    Microsoft IIS httpd 6.0
| http-methods: 
|_  Potentially risky methods: TRACE COPY PROPFIND SEARCH LOCK UNLOCK DELETE PUT MOVE MKCOL PROPPATCH
|_http-title: Under Construction
|_http-server-header: Microsoft-IIS/6.0
| http-webdav-scan: 
|   Server Type: Microsoft-IIS/6.0
|   Allowed Methods: OPTIONS, TRACE, GET, HEAD, COPY, PROPFIND, SEARCH, LOCK, UNLOCK
|   WebDAV type: Unknown
|   Server Date: Sat, 13 Sep 2025 16:34:25 GMT
|_  Public Options: OPTIONS, TRACE, GET, HEAD, DELETE, PUT, POST, COPY, MOVE, MKCOL, PROPFIND, PROPPATCH, LOCK, UNLOCK, SEARCH
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.66 seconds

```

