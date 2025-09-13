# mysql
Credentials
- root
- EXTRapHY
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

## Show databases
```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| edukate            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.12 sec)
```

## edukate
```
mysql> show tables;
+-------------------+
| Tables_in_edukate |
+-------------------+
| courses           |
| enroll            |
+-------------------+
2 rows in set (0.00 sec)

mysql> describe enroll;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int          | NO   | PRI | NULL    | auto_increment |
| full_name | varchar(255) | NO   |     | NULL    |                |
| email     | varchar(255) | NO   |     | NULL    |                |
| phone     | varchar(15)  | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

```

Not finding anything too interesting here