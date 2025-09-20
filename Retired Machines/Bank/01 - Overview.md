# Bank Overview

Machine Details:

| IP          | Name | Difficulty | Machine Type |
| ----------- | ---- | ---------- | ------------ |
| 10.10.10.29 | Bank | Easy       | Linux        |

### tags:
- php webshell
- failed encryption
- SUID
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target has ports 22, 53, and 80 open. Navigating to the IP address only revealed an Apache2 Ubuntu landing page, but putting bank.htb into /etc/hosts revealed a bank login page. Enumeration with Gobuster revealed a /balance-transfer directory where the attacker had access to encrypted files. One file failed to encrypt properly, and contained credentials for user `cris` to log into the bank portal.

The portal has a support page where images can be uploaded. In the source code of this page, a comment explains that .htb files can be uploaded and rendered as php. The attacker uploaded a php webshell and elevated it to a cleaner netcat shell, becoming the `www-data` user. The attacker discovered a SUID binary that immediately granted root access when ran.

## Bullet points
- Target has ports 22, 53 and 80 open
- IP showed an apache webpage
- Putting bank.htb into /etc/hosts revealed a banking website
- discovered a /balance-transfer subdirectory
- One of the files failed to encrypt and contained creds to log into bank site
- site had support portal to upload images.
- source code on page had a comment that .htb files were allowed, and executed as php files
- uploaded a php webshell
- elevated to a nicer reverse shell via netcat
- found a suid binary that gave a root shell