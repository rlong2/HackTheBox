# Unified Overview

Machine Details:

| IP            | Name    | Difficulty | Machine Type |
| ------------- | ------- | ---------- | ------------ |
| 10.129.96.149 | Unified | Very Easy  | Linux        |

### tags:
- log4j
- metasploit
- mongo
- hashed passwords
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target was running an outdated version of the UniFi Network panel, which was vulnerable to log4j. The attacker was able to get a shell as a user. There is a mongdb service running on the target, and the attacker was able to query usernames, email addresses, and hashed passwords. The attacker used mongo to update an administrator's hashed password to a password the attacker hashed. After updating the database, the attaker was able to log into the UniFi Network portal with Super Administrator privileges. The attacker navigated through the page and retrieved the SSH password for root. root login was already enabled, so the attacker quickly got the root flag.

## Bullet points
- UniFi Network page vulnerable to log4j.
- Popped a shell and found mongodb running
- mongo was used to update the administrator hash to a known hash
- attacker logged onto the UniFi page as the administrator
- The page had SSH credentials for root