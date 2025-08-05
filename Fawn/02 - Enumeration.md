# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.1.14  
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-04 17:53 MDT
Nmap scan report for 10.129.1.14
Host is up (0.048s latency).
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE
21/tcp open  ftp

Nmap done: 1 IP address (1 host up) scanned in 20.47 seconds
```

### nmap scan 2: ftp version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 21 10.129.1.14 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-04 17:54 MDT
Nmap scan report for 10.129.1.14
Host is up (0.051s latency).

PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
| ftp-syst: 
|   STAT: 
| FTP server status:
|      Connected to ::ffff:10.10.14.10
|      Logged in as ftp
|      TYPE: ASCII
|      No session bandwidth limit
|      Session timeout in seconds is 300
|      Control connection is plain text
|      Data connections will be plain text
|      At session startup, client count was 4
|      vsFTPd 3.0.3 - secure, fast, stable
|_End of status
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_-rw-r--r--    1 0        0              32 Jun 04  2021 flag.txt
Service Info: OS: Unix

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 3.53 seconds

```