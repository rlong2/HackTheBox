# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.1.17                        
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-04 20:34 MDT
Nmap scan report for 10.129.1.17
Host is up (0.052s latency).
Not shown: 65340 closed tcp ports (reset), 194 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT   STATE SERVICE
23/tcp open  telnet

Nmap done: 1 IP address (1 host up) scanned in 20.32 seconds
```

### nmap scan 2: telnet version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 23 10.129.1.17
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-04 20:35 MDT
Nmap scan report for 10.129.1.17
Host is up (0.046s latency).

PORT   STATE SERVICE VERSION
23/tcp open  telnet  Linux telnetd
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 21.85 seconds

```