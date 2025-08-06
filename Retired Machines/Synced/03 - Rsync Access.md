```
┌──(kali㉿kali)-[~]
└─$ rsync -av rsync://10.129.25.17 
public          Anonymous Share
```

### Grabbing files
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Synced]
└─$ rsync -av rsync://10.129.25.17/public .
receiving incremental file list
./
flag.txt

sent 50 bytes  received 161 bytes  20.10 bytes/sec
total size is 33  speedup is 0.16

```