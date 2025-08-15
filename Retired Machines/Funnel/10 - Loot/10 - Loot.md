
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Funnel]
└─$ cat 10\ -\ Loot/welcome_28112022                
Frome: root@funnel.htb
To: optimus@funnel.htb albert@funnel.htb andreas@funnel.htb christine@funnel.htb maria@funnel.htb
Subject:Welcome to the team!

Hello everyone,
We would like to welcome you to our team. 
We think you’ll be a great asset to the "Funnel" team and want to make sure you get settled in as smoothly as possible.
We have set up your accounts that you will need to access our internal infrastracture. Please, read through the attached password policy with extreme care.
All the steps mentioned there should be completed as soon as possible. If you have any questions or concerns feel free to reach directly to your manager. 
We hope that you will have an amazing time with us,
The funnel team. 
```

## Potential users
- root@funnel.htb
- optimus@funnel.htb
- albert@funnel.htb 
- andreas@funnel.htb
- christine@funnel.htb
- maria@funnel.htb

### Default password (from PDF)
- the default password of “funnel123#!#” must
be changed immediately.

# flag.txt
```
christine=# \c secrets
psql (17.5 (Debian 17.5-1), server 15.1 (Debian 15.1-1.pgdg110+1))
You are now connected to database "secrets" as user "christine".
secrets=# \dt
         List of relations
 Schema | Name | Type  |   Owner   
--------+------+-------+-----------
 public | flag | table | christine
(1 row)

secrets=# TABLE flag;
              value               
----------------------------------
 cf277664b1771217d7006acdea006db1
(1 row)



```