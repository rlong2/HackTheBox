# Oopsie Overview

Machine Details:

| IP            | Name   | Difficulty | Machine Type |
| ------------- | ------ | ---------- | ------------ |
| 10.129.147.64 | Oopsie | Very Easy  | Linux        |

tags:
- 
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

An outline of how the box was pwned.

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