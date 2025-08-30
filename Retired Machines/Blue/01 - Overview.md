# Blue Overview

Machine Details:

| IP          | Name | Difficulty | Machine Type |
| ----------- | ---- | ---------- | ------------ |
| 10.10.10.40 | Blue | Easy       | Windows      |

### tags:
- SMB
- metasploit
- eternal blue
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running Windows 7 with SMB, and is vulnerable to CVE-2017-0143 (Eternal Blue). The attacker was able to use this exploit and gain root access.

## Bullet points
- nmap shows Windows 7
- nmap script shows the target is vulnerable to eternal blue
- exploit!