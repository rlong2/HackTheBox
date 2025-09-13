# Lame Overview

Machine Details:

| IP          | Name | Difficulty | Machine Type |
| ----------- | ---- | ---------- | ------------ |
| 10.129.1.17 | Lame | Easy       | Linux        |

### tags:
- smb
- samba
- metasploit
- cve
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running a version of Samba SMB that is vulnerable to CVE-2007-2447. The attacker leveraged this to gain a root shell and retrieve the user and root flags.

## Bullet points
- SMB exploit CVE-2007-2447