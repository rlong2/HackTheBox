# user flag
```
ftp> get user.txt
local: user.txt remote: user.txt
229 Entering Extended Passive Mode (|||62045|)
150 Opening ASCII mode data connection.
100% |********************************|    34        0.73 KiB/s    00:00 ETA
226 Transfer complete.
34 bytes received in 00:00 (0.68 KiB/s)

┌──(kali㉿kali)-[~/Desktop/HackTheBox]
└─$ cat user.txt 
c1<SNIP>392

```

# root flag
```
PS C:\users\Administrator> cd Desktop
cd Desktop
PS C:\users\Administrator\Desktop> ls
ls


    Directory: C:\users\Administrator\Desktop


Mode                LastWriteTime         Length Name                          
----                -------------         ------ ----                          
-ar---        9/17/2025  10:41 PM             34 root.txt                      


PS C:\users\Administrator\Desktop> cat root.txt
cat root.txt
a8<SNIP>f5d

```