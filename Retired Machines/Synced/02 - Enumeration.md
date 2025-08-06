# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.25.17 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 16:18 MDT
Nmap scan report for 10.129.25.17
Host is up (0.085s latency).
Not shown: 65534 closed tcp ports (reset)
PORT    STATE SERVICE
873/tcp open  rsync

Nmap done: 1 IP address (1 host up) scanned in 19.38 seconds              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 873 10.129.25.17 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 16:19 MDT
Nmap scan report for 10.129.25.17
Host is up (0.047s latency).

PORT    STATE SERVICE VERSION
873/tcp open  rsync   (protocol version 31)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.98 seconds
```

### nmap - rsync script(s)
```
┌──(kali㉿kali)-[~]
└─$ ls -l /usr/share/nmap/scripts | grep rsync
-rw-r--r-- 1 root root  3132 May 15 09:37 rsync-brute.nse
-rw-r--r-- 1 root root  1216 May 15 09:37 rsync-list-modules.nse
┌──(kali㉿kali)-[~]
└─$ nmap --script-help rsync-brute 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 16:24 MDT

rsync-brute
Categories: brute intrusive
https://nmap.org/nsedoc/scripts/rsync-brute.html
  Performs brute force password auditing against the rsync remote file syncing protocol.

### no change in results with brute module
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 873 --script=rsync-brute --script-args 'rsync-brute.module=passdb' 10.129.25.17
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-06 16:27 MDT
Nmap scan report for 10.129.25.17
Host is up (0.049s latency).

PORT    STATE SERVICE VERSION
873/tcp open  rsync   (protocol version 31)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.20 seconds
```

Luckily, rsync can be inspected without creds. See the 'Rsync access' note.