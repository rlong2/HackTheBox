# Ignition Overview

Machine Details:

| IP            | Name     | Difficulty | Machine Type |
| ------------- | -------- | ---------- | ------------ |
| 10.129.213.34 | Ignition | Very Easy  | Linux        |

tags:
- gobuster
- weak credentials
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

A web server is running on the target for an e-commerce platform. Enumerating with gobuster revealed an admin login page. The portal had weak credentials, and the attacker was able to log in and obtain the flag.