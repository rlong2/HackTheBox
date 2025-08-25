# user flag
Got user flag from creds in /var/www/html/.htpasswd
```
mike@included:~$ ls -l user.txt && md5sum user.txt
-r-------- 1 mike mike 33 Mar  9  2020 user.txt
7d13b1c07c08f6aab22e40ca6550a400  user.txt

```

# root flag
Got root flag after mounting an lxc image as root.
```
~ # ls -l /mnt/root/root/root.txt 
-r--------    1 root     root            33 Mar  9  2020 /mnt/root/root/root.txt
~ # md5sum /mnt/root/root/root.txt 
7ef07ff4703c59f103bdb88833f50666  /mnt/root/root/root.txt
```