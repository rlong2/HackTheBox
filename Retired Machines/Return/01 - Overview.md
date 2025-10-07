# Return Overview

Machine Details:

| IP           | Name   | Difficulty | Machine Type |
| ------------ | ------ | ---------- | ------------ |
| 10.10.11.108 | Return | Easy       | Windows      |

### tags:
- Printer
- Password intercept
- netcat
- privilege escalation
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

There are many open ports on the target. The attacker found an admin page for a printer on port 80. There is a settings page where the attacker can change the IP address and send an LDAP password to the attacker's IP address. The attacker set up a netcat listener and intercepted credentials allowing a win-rm session as the `srv-printer` user.

This user has numerous permissions, and is a member of the Server Operators group. The attacker uploaded a windows netcat executable, pointed a service on the target to that payload, then restarted the service to catch a system shell.

## Bullet points
- Lots of open ports. 
- HTTP, LDAP
- The IP points to a printing admin panel
- Attacker catches the password for `srv-printer` using `nc`
- These creds can be used for evil-winrm
- got user flag

- The `srv-printer` user is in the Server Operators group
- Attacker uploaded a netcat payload and pointed it to another service.
- Restarted the service and caught the shell on the attacking machine.
- System shell :)