### Check SSH access for users with default creds
- root
- optimus
- albert
- andreas
- christine
- maria
- Default password to try: funnel123#!#
- Likely christine based on their default ftp password
- funnel123#!#

SSH: christine funnel123#!#

```
christine@funnel:~$ id
uid=1000(christine) gid=1000(christine) groups=1000(christine)

christine@funnel:~$ sudo -l
[sudo] password for christine: 
Sorry, user christine may not run sudo on funnel.
```