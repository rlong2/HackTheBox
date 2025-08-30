# Base Overview

Machine Details:

| IP            | Name | Difficulty | Machine Type |
| ------------- | ---- | ---------- | ------------ |
| 10.129.95.184 | Base | Very Easy  | Linux        |

### tags:
- php
- strcmp
- directory listing vulnerability
- credential reuse
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running SSH and an http service. The web page was misconfigured and allowed the attacker to view a swap file that detailed how the login.php page worked. It used `strcmp`, which was bypassed using burpsuite by changing the types from strings to arrays, allowing access to an admin upload page. A php reverse shell was uploaded and the attacker gained access as a service user. Plaintext credentials were found on the machine and allowed access to the web login portal and SSH access as another user due to password reuse. The attacker SSH'd to the target as the user and elevated privileges to become root by taking advantage of the user's ability to run the `find` command with sudo permissions.

## Bullet points
- ssh and website
- directory listing vulnerability shows how login.php file works (using strcmp)
- attacker was able to get into login portal and access uploads page.
- uploaded a php reverse shell
- as www-data user, found credentials for 1) login page and 2) a user's ssh password
- SSH'd in as user, sudo permissions for a command allowed elevation to root.