# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ nmap -T4 -Pn --open -p- 10.10.10.4
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-13 09:29 MDT
Nmap scan report for 10.10.10.4
Host is up (0.050s latency).
Not shown: 65532 closed tcp ports (reset)
PORT    STATE SERVICE
135/tcp open  msrpc
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds

Nmap done: 1 IP address (1 host up) scanned in 22.87 seconds
 
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ nmap -T4 -sV -sC -p- 10.10.10.4
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-13 09:30 MDT
Nmap scan report for 10.10.10.4
Host is up (0.055s latency).
Not shown: 65532 closed tcp ports (reset)
PORT    STATE SERVICE      VERSION
135/tcp open  msrpc        Microsoft Windows RPC
139/tcp open  netbios-ssn  Microsoft Windows netbios-ssn
445/tcp open  microsoft-ds Windows XP microsoft-ds
Service Info: OSs: Windows, Windows XP; CPE: cpe:/o:microsoft:windows, cpe:/o:microsoft:windows_xp

Host script results:
|_nbstat: NetBIOS name: LEGACY, NetBIOS user: <unknown>, NetBIOS MAC: 00:50:56:b0:0b:40 (VMware)
|_smb2-time: Protocol negotiation failed (SMB2)
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
|_clock-skew: mean: 5d00h45m22s, deviation: 2h07m16s, median: 4d23h15m22s
| smb-os-discovery: 
|   OS: Windows XP (Windows 2000 LAN Manager)
|   OS CPE: cpe:/o:microsoft:windows_xp::-
|   Computer name: legacy
|   NetBIOS computer name: LEGACY\x00
|   Workgroup: HTB\x00
|_  System time: 2025-09-18T20:46:30+03:00

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 44.77 seconds

```

## nmap - smb-vuln*
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ nmap -T4 -p 445 --script=smb-vuln* 10.10.10.4
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-13 09:31 MDT
Nmap scan report for 10.10.10.4
Host is up (0.050s latency).

PORT    STATE SERVICE
445/tcp open  microsoft-ds

Host script results:
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
|       https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
|       https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/
|_      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
|_smb-vuln-ms10-061: ERROR: Script execution failed (use -d to debug)
|_smb-vuln-ms10-054: false

Nmap done: 1 IP address (1 host up) scanned in 5.84 seconds


```