# Funnel Overview

Machine Details:

| IP             | Name   | Difficulty | Machine Type |
| -------------- | ------ | ---------- | ------------ |
| 10.129.228.195 | Funnel | Very Easy  | Linux        |

tags:
- 
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

FTP and SSH are running on the target. FTP had anonymous login enabled, and the attacker found documents that included information on default passwords and user accounts. This information was used to gain SSH access to the target. Postgresql is running locally on the target, but the user did not have the ability to run `psql` and enumerate the database. The attacker used local port forwarding to use their `psql` binary, enumerate the postgresql database, and retrieve the flag contents.