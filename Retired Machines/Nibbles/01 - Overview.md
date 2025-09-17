# Nibbles Overview

Machine Details:

| IP          | Name    | Difficulty | Machine Type |
| ----------- | ------- | ---------- | ------------ |
| 10.10.10.75 | Nibbles | Easy       | Linux        |

### tags:
- CVE
- malicious file
- weak credentials
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running an http service powered by Nibbleblog. The Nibbleblog version running is vulnerable to CVE-2015-6967.  This CVE required a username and password, which were easily discovered. The attacker leveraged this to gain a shell as `nibbler`. `nibbler` has sudo permissions to run a bash script, so the attacker modified the script to add nibbler to sudoers. After running the script with sudo, the attacker gained a root shell.

## Bullet points
- The target is running an http service powered by Nibbleblog.
- The version of Nibbleblog is vulnerable to CVE-2015-6967
- Attacker got a shell as `nibbler`
- `nibbler` has permissions to run a shell script with sudo
- Attacker uploaded a malicious bash script to add `nibbler` to sudoers
- root shell!