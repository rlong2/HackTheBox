# Oopsie Overview

Machine Details:

| IP            | Name   | Difficulty | Machine Type |
| ------------- | ------ | ---------- | ------------ |
| 10.129.147.64 | Oopsie | Very Easy  | Linux        |

tags:
- suid
- burp
- reverse shell
- IDOR
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running a web service and ssh service. The attacker used insecure direct object reference (IDOR) to obtain cookie information that allowed access to upload files to the web server as an administrator. The target uploaded a reverse webshell and had shell access to the machine as a service account. A user's ssh credentials were discovered in plaintext on the server, and those credentials were used to log in as a user. That user was in a group that allowed calls to an executable which runs as root due to the SUID bit. The executable called the `cat` command, and directory traversal was used to obtain the root flag. The executable did not specify the full path to `cat`, so the attacker used a path hijacking attack and obtained a root shell.

## Bullet points
- nmap found ssh and a web server
- a guest login to the web server allowed partial access
- Insecure direct object reference revealed an admin name and access id
- Burpsuite was used to intercept a request to access a webpage that allows uploads.
- The admin name and access id was inserted in the cookie field, allowing the attacker to upload files.
- A reverse php shell was uploaded, giving the attacker shell access as the www-data user
- After enumeration, the attacker discovered plaintext credentials for user `robert`
- These credentials allowed the attacker to ssh as robert
- robert was part of the bugtracker group, which allowed them to execute the bugtracker executable as root.
- bugtracker executes a cat binary, the attacker made a new one to pop a root shell.