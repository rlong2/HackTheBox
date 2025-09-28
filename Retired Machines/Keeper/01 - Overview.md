# Keeper Overview

Machine Details:

| IP           | Name   | Difficulty | Machine Type |
| ------------ | ------ | ---------- | ------------ |
| 10.10.11.227 | Keeper | Easy       | Linux        |

### tags:
- Request Tracker
- Default credentials
- CVE-2023-32784
- KeePass database
- dump
- danish pudding :D
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running SSH and HTTP. The web service is hosting a Request Tracker (RT) ticketing service. The default credentials for RT allowed the attacker to log in to the portal as root and obtain a password for user `lnorgaard`. This password allowed the attacker to SSH to the target as `lnorgaard` and get the user flag.

`lnorgaard` has access to a Keepass password database file and a Keepass dump file. The attacker leveraged CVE-2023-32784 and pulled a partial password from the dump file. After manual inspection, the attacker obtained the password to the database file and got the root password and private SSH key to the target. The attacker logged in via SSH as `root` using PuTTY and got the root flag.

## Bullet points
- The target is running SSH and HTTP
- The web service is hosting a Request Tracker ticketing service
- Default credentials for Request Tracker allow the attacker to log in as root
- Root left comments for user `lnorgaard` with a plaintext password
- That password allowed the attacker to SSH in to the target
- `lnorgaard` has access to a Keepass password database and a Keepass dump file
- Attacker leveraged CVE-2023-32784 to pull a password for the password db from the dump
- The password was used to open the Keepass password database, which contained a root password and SSH key