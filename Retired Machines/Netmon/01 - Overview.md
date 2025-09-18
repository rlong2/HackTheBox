# Netmon Overview

Machine Details:

| IP           | Name   | Difficulty | Machine Type |
| ------------ | ------ | ---------- | ------------ |
| 10.10.10.152 | Netmon | Easy       | Windows      |

### tags:
- CVE
- anonymous FTP
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running a handful of services, the most important are http and ftp. The http service is running a network monitoring tool called Netmon. The FTP server allows for anonymous access and contains old credentials for the `prtgadmin` user. The attacker iterated on the discovered passwords and found valid credentials for the user to log into the web portal. THe target is vulnerable to CVE-2018-9276, and the attacker gained a root shell.

## Bullet points
- Lots of services running
- http and ftp are useful
- Netmon running on 80
- FTP has anonymous access and contains an old password for user `prtgadmin`
- Iterated on the password to get valid credentials.
- Vulnerable to CVE-2018-9276
- root shell!