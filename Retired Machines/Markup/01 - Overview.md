# Markup Overview

Machine Details:

| IP            | Name   | Difficulty | Machine Type |
| ------------- | ------ | ---------- | ------------ |
| 10.129.224.59 | Markup | Very Easy  | Windows      |

### tags:
- 
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running an http(s) service and ssh. The login page had simple credentials and was easy to brute-force. A form for ordering supplies is vulnerable to XML External Entity (XXE) attack, and the attacker was able to read files on the target. A username was found on the website's source code, and the user's private ssh key was able to be read. The attacker SSH'd to the machine and got the user flag. The attacker was able to escalate privileges by finding a script that executed commands as an administrator but could be written to by the user. The attacker uploaded a netcat executable and overwrote the script to use it to gain a reverse shell and get the root flag.

## Bullet points
- simple username and password --> access to login portal
- XXE vulnerability allows attacker to read files on the box
- A user's private ssh key was discovered.
- a bat file runs as an administrator, but was modified to get a reverse shell as admin