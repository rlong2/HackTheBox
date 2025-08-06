# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.136.187
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-05 06:13 MDT
Nmap scan report for 10.129.136.187
Host is up (0.064s latency).
Not shown: 61529 closed tcp ports (reset), 4005 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT     STATE SERVICE
6379/tcp open  redis

Nmap done: 1 IP address (1 host up) scanned in 23.24 seconds               
```

### nmap scan 2: redis service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 6379 10.129.136.187           
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-05 06:15 MDT
Nmap scan report for 10.129.136.187
Host is up (0.048s latency).

PORT     STATE SERVICE VERSION
6379/tcp open  redis   Redis key-value store 5.0.7

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.93 seconds
```