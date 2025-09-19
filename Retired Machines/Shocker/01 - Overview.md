# Shocker Overview

Machine Details:

| IP          | Name    | Difficulty | Machine Type |
| ----------- | ------- | ---------- | ------------ |
| 10.10.10.56 | Shocker | Easy       | Linux        |

### tags:
- shellshock
- cve
- perl
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running http and an EtherNetIP service. After some enumeration, the attacker discovered a bash script running in a cig-bin directory. The target is vulnerable to shellshock, and the attacker was able to get a shell as `shelly`. `shelly` has sudo permissions for any perl command, so the attacker executed a reverse perl shell and became root on the target.

## Bullet points
- http and EtherNetIP service running
- There is a bash script running on IP/cgi-bin/
- This box is vulnerable to shellshock!
- Got a shell as `shelly` :)
- `shelly` can run perl commands as root
- Executed a reverse perl shell, got root access