Anonymous access is allowed

```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ ftp 10.10.10.152        
Connected to 10.10.10.152.
220 Microsoft FTP Service
Name (10.10.10.152:kali): anonymous
331 Anonymous access allowed, send identity (e-mail name) as password.
Password: 
230 User logged in.
Remote system type is Windows_NT.
ftp> ls
229 Entering Extended Passive Mode (|||61987|)
125 Data connection already open; Transfer starting.
02-03-19  12:18AM                 1024 .rnd
02-25-19  10:15PM       <DIR>          inetpub
07-16-16  09:18AM       <DIR>          PerfLogs
02-25-19  10:56PM       <DIR>          Program Files
02-03-19  12:28AM       <DIR>          Program Files (x86)
02-03-19  08:08AM       <DIR>          Users
11-10-23  10:20AM       <DIR>          Windows
226 Transfer complete.

<SNIP>

ftp> ls
229 Entering Extended Passive Mode (|||62006|)
150 Opening ASCII mode data connection.
01-15-24  11:03AM       <DIR>          Desktop
02-03-19  08:05AM       <DIR>          Documents
07-16-16  09:18AM       <DIR>          Downloads
07-16-16  09:18AM       <DIR>          Music
07-16-16  09:18AM       <DIR>          Pictures
09-16-25  10:08AM                   96 tester.txt
07-16-16  09:18AM       <DIR>          Videos
226 Transfer complete.
ftp> get tester.txt
local: tester.txt remote: tester.txt
229 Entering Extended Passive Mode (|||62008|)
150 Opening ASCII mode data connection.
100% |********************************|    96        2.04 KiB/s    00:00 ETA
226 Transfer complete.
WARNING! 4 bare linefeeds received in ASCII mode.
File may not have transferred correctly.
96 bytes received in 00:00 (1.97 KiB/s)

```

```
ftp> cd Desktop
250 CWD command successful.
ftp> ls
229 Entering Extended Passive Mode (|||62104|)
150 Opening ASCII mode data connection.
02-03-19  12:18AM                 1195 PRTG Enterprise Console.lnk
02-03-19  12:18AM                 1160 PRTG Network Monitor.lnk
09-16-25  09:21AM                   34 user.txt

```

public User has lnk files that show a network monitoring service on the target.

# Searching for vulnerabilities
## metasploit
```
msf > search PRTG

Matching Modules
================

   #  Name                                                        Disclosure Date  Rank       Check  Description
   -  ----                                                        ---------------  ----       -----  -----------
   0  exploit/windows/http/prtg_authenticated_rce_cve_2023_32781  2023-08-09       excellent  Yes    PRTG CVE-2023-32781 Authenticated RCE
   1    \_ target: Windows_Fetch                                  .                .          .      .
   2    \_ target: Windows_CMDStager                              .                .          .      .
   3  exploit/windows/http/prtg_authenticated_rce                 2018-06-25       excellent  Yes    PRTG Network Monitor Authenticated RCE


```