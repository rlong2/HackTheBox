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

Time to look at lxd.
