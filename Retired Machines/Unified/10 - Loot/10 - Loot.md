
# usernames and hashed passwords
See [[04 - mogo]] for usernames, email addresses, and hashed passwords. Using mongo, the hashes can be set to a hash of your choice :)
# user flag
After obtaining a shell with log4j, the user flag is found 
```


$ ls -l /home/michael/user.txt && md5sum /home/michael/user.txt
ls -l /home/michael/user.txt && md5sum /home/michael/user.txt
-rw-r--r-- 1 root 1000 33 Dec 30  2021 /home/michael/user.txt
35ca5f2247c20a9e26589e960990269f  /home/michael/user.txt
```

# root flag
After gaining access to the administrator UniFi page, the root SSH credentials were available.
```
┌──(kali㉿kali)-[~]
└─$ ssh root@10.129.228.29                      
root@10.129.228.29's password: 
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 * Super-optimized for small spaces - read how we shrank the memory
   footprint of MicroK8s to make it the smallest full K8s around.

   https://ubuntu.com/blog/microk8s-memory-optimisation

root@unified:~# id
uid=0(root) gid=0(root) groups=0(root)
root@unified:~# whoami
root
root@unified:~# ls -l root.txt && md5sum root.txt
-rw-r--r-- 1 root root 33 Jan  2  2022 root.txt
6d13af00b34e0bf12b1a559f50768163  root.txt

```