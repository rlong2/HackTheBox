# Irked Overview

Machine Details:

| IP           | Name  | Difficulty | Machine Type |
| ------------ | ----- | ---------- | ------------ |
| 10.10.10.117 | Irked | Easy       | Linux        |

### tags:
- irc
- cve
- steganography
- suid
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

An outline of how the box was pwned.

## Bullet points
- target hosting http and irc channel.
- The IRC version is vulnerable to CVE-2010-2075
- popped a shell as ircd user
- found a file with a steganography password
- The password was used on a image on irked's webpage to extract SSH creds for user djmardov
- There is a `viewuser` binary with a SUID bit that allows the binary to execute as root
- The binary executes commands from a specific file
- Attacker created that file and catted the root flag