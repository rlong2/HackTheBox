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

