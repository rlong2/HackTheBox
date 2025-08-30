# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.10.10.40                                      
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-30 09:50 MDT
Nmap scan report for 10.10.10.40
Host is up (0.048s latency).
Not shown: 65310 closed tcp ports (reset), 216 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49156/tcp open  unknown
49157/tcp open  unknown

Nmap done: 1 IP address (1 host up) scanned in 21.78 seconds              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.10.10.40                           
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-30 09:51 MDT
Stats: 0:01:11 elapsed; 0 hosts completed (1 up), 1 undergoing Script Scan
NSE Timing: About 98.49% done; ETC: 09:52 (0:00:00 remaining)
Nmap scan report for 10.10.10.40
Host is up (0.052s latency).
Not shown: 991 closed tcp ports (reset)
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
Service Info: Host: HARIS-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_clock-skew: mean: -19m56s, deviation: 34m35s, median: 1s
| smb-os-discovery: 
|   OS: Windows 7 Professional 7601 Service Pack 1 (Windows 7 Professional 6.1)
|   OS CPE: cpe:/o:microsoft:windows_7::sp1:professional
|   Computer name: haris-PC
|   NetBIOS computer name: HARIS-PC\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2025-08-30T16:52:15+01:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2:1:0: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2025-08-30T15:52:12
|_  start_date: 2025-08-30T15:42:04

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 73.58 seconds

```

## nmap - listing available smb scripts
```
                                                                             
┌──(kali㉿kali)-[~]
└─$ ls -l /usr/share/nmap/scripts | grep smb
-rw-r--r-- 1 root root  3753 May 15 09:37 smb2-capabilities.nse
-rw-r--r-- 1 root root  2689 May 15 09:37 smb2-security-mode.nse
-rw-r--r-- 1 root root  1408 May 15 09:37 smb2-time.nse
-rw-r--r-- 1 root root  5269 May 15 09:37 smb2-vuln-uptime.nse
-rw-r--r-- 1 root root 45061 May 15 09:37 smb-brute.nse
-rw-r--r-- 1 root root  5289 May 15 09:37 smb-double-pulsar-backdoor.nse
-rw-r--r-- 1 root root  4840 May 15 09:37 smb-enum-domains.nse
-rw-r--r-- 1 root root  5971 May 15 09:37 smb-enum-groups.nse
-rw-r--r-- 1 root root  8043 May 15 09:37 smb-enum-processes.nse
-rw-r--r-- 1 root root 27274 May 15 09:37 smb-enum-services.nse
-rw-r--r-- 1 root root 12017 May 15 09:37 smb-enum-sessions.nse
-rw-r--r-- 1 root root  6923 May 15 09:37 smb-enum-shares.nse
-rw-r--r-- 1 root root 12527 May 15 09:37 smb-enum-users.nse
-rw-r--r-- 1 root root  4418 May 15 09:37 smb-flood.nse
-rw-r--r-- 1 root root  7471 May 15 09:37 smb-ls.nse
-rw-r--r-- 1 root root  8758 May 15 09:37 smb-mbenum.nse
-rw-r--r-- 1 root root  8220 May 15 09:37 smb-os-discovery.nse
-rw-r--r-- 1 root root  4982 May 15 09:37 smb-print-text.nse
-rw-r--r-- 1 root root  1833 May 15 09:37 smb-protocols.nse
-rw-r--r-- 1 root root 63596 May 15 09:37 smb-psexec.nse
-rw-r--r-- 1 root root  5190 May 15 09:37 smb-security-mode.nse
-rw-r--r-- 1 root root  2424 May 15 09:37 smb-server-stats.nse
-rw-r--r-- 1 root root 14159 May 15 09:37 smb-system-info.nse
-rw-r--r-- 1 root root  7524 May 15 09:37 smb-vuln-conficker.nse
-rw-r--r-- 1 root root  6402 May 15 09:37 smb-vuln-cve2009-3103.nse
-rw-r--r-- 1 root root 23154 May 15 09:37 smb-vuln-cve-2017-7494.nse
-rw-r--r-- 1 root root  6545 May 15 09:37 smb-vuln-ms06-025.nse
-rw-r--r-- 1 root root  5386 May 15 09:37 smb-vuln-ms07-029.nse
-rw-r--r-- 1 root root  5688 May 15 09:37 smb-vuln-ms08-067.nse
-rw-r--r-- 1 root root  5647 May 15 09:37 smb-vuln-ms10-054.nse
-rw-r--r-- 1 root root  7214 May 15 09:37 smb-vuln-ms10-061.nse
-rw-r--r-- 1 root root  7344 May 15 09:37 smb-vuln-ms17-010.nse
-rw-r--r-- 1 root root  4400 May 15 09:37 smb-vuln-regsvc-dos.nse
-rw-r--r-- 1 root root  6586 May 15 09:37 smb-vuln-webexec.nse
-rw-r--r-- 1 root root  5084 May 15 09:37 smb-webexec-exploit.nse

```

## nmap - running smb-vuln scripts
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC --script=smb-vuln* 10.10.10.40  
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-30 09:55 MDT
Nmap scan report for 10.10.10.40
Host is up (0.049s latency).
Not shown: 991 closed tcp ports (reset)
PORT      STATE SERVICE      VERSION
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
Service Info: Host: HARIS-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
|_smb-vuln-ms10-054: false
|_smb-vuln-ms10-061: NT_STATUS_OBJECT_NAME_NOT_FOUND
| smb-vuln-ms17-010: 
|   VULNERABLE:
|   Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
|     State: VULNERABLE
|     IDs:  CVE:CVE-2017-0143
|     Risk factor: HIGH
|       A critical remote code execution vulnerability exists in Microsoft SMBv1
|        servers (ms17-010).
|           
|     Disclosure date: 2017-03-14
|     References:
|       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
|       https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/
|_      https://technet.microsoft.com/en-us/library/security/ms17-010.aspx

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 75.79 seconds

```

Looks like this target is vulnerable to eternal blue!