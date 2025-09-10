# Granny Overview

Machine Details:

| IP          | Name   | Difficulty | Machine Type |
| ----------- | ------ | ---------- | ------------ |
| 10.10.10.15 | Granny | Easy       | Windows      |

### tags:
- IIS
- Metasploit
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

Granny is running an outdated http service (IIS 6.0) that has multiple CVE vulnerabilities. The attacker used CVE-2017-7269 (Exploding Can) to gain access as a network service, then enumerated for further vulnerabilities and gained a system shell by exploiting CVE-2015-1701 .

## Bullet points
- http running IIS 6.0
- Vulnerable to multiple CVEs
- CVE-2017-7269 (Exploding Can) used to gain access as a network service
- more enumeration
- CVE-2015-1701 used to gain system access and root flag