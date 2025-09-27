# Knife Overview

Machine Details:

| IP           | Name  | Difficulty | Machine Type |
| ------------ | ----- | ---------- | ------------ |
| 10.10.10.242 | Knife | Easy       | Linux        |

### tags:
- php
- remote code execution
- sudo permissions
- knife
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running SSH and HTTP on the server. The server has a version of php that is vulnerable to remote code execution, allowing the attacker to gain a shell as `james`. That user has the ability to run a `knife` binary with sudo without requiring a password, which allows the attacker to gain a root shell.
## Bullet points
- Target is running SSH and HTTP
- HTTP service is running a version of php vulnerable to remote code execution
- Attacker leveraged this to get an SSH session as `james`
- `james` can run `knife` binary as sudo without a password... root shell!