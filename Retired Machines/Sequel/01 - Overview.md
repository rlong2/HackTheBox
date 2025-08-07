# Sequel Overview

Machine Details:

| IP            | Name   | Difficulty | Machine Type |
| ------------- | ------ | ---------- | ------------ |
| 10.129.95.232 | Sequel | Very Easy  | Linux        |
tags:
- mysql
- SQL
- weak credentials
- ;

status: got root flag;
## Box Outline

Sequel was running a mysql server with weak credentials. After authenticating, the attacker found the flag inside the `htb` database.