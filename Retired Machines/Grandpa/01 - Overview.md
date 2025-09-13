# Grandpa Overview

Machine Details:

| IP          | Name    | Difficulty | Machine Type |
| ----------- | ------- | ---------- | ------------ |
| 10.10.10.14 | Grandpa | Easy       | Windows      |

### tags:
- IIS 6.0
- CVE
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running an http service with IIS 6.0, which is vulnerable to multiple CVEs. The attacker gained a network service shell with  CVE-2017-7269 (ExplodingCan), then elevated the shell to a system shell with CVE-2014-4113.

## Bullet points
- IIS 6.0 vulnerable to ExplodingCan CVE-2017-7269, got a network service shell
- Shell was elevated with CVE-2014-4113 to a system shell.