# Dancing Overview

Machine Details:

| IP          | Name    | Difficulty | Machine Type |
| ----------- | ------- | ---------- | ------------ |
| 10.129.1.12 | Dancing | Very Easy  | Windows      |

tags:
- SMB
- misconfigured credentials
- anonymous access

status: got flag

## Box Outline

Unsecured SMB shares allowed the attacker to query them and connect to multiple shares without credentials. One share contained the flag and a TODO list that included securing an ftp server.  
