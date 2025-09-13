# Legacy Overview

Machine Details:

| IP         | Name   | Difficulty | Machine Type |
| ---------- | ------ | ---------- | ------------ |
| 10.10.10.4 | Legacy | Easy       | Windows      |

### tags:
- SMB
- CVE
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running Windows XP with a version of SMB that is vulnerable to CVE-2008-4250 (ECLIPSEDWING). The attacker was able to leverage this and retrieve the user and root flags.

## Bullet points
- Vulnerable to CVE-2008-4250