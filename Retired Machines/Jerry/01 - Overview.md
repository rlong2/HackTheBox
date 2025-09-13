# Jerry Overview

Machine Details:

| IP          | Name  | Difficulty | Machine Type |
| ----------- | ----- | ---------- | ------------ |
| 10.10.10.95 | Jerry | Easy       | Windows      |

### tags:
- weak credentials
- Apache Tomcat
- msfvenom
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

An http proxy service was running Apache Tomcat on the target. The manager login page contained example credentials for logging in, which were unchanged and allowed the attacker to log in. The manager has  permissions to upload files (as well as start and stop services), so the attacker generated a reverse shell using msfvenom and gained a system shell to retrieve the flags. 

## Bullet points
- http proxy server running Apache Tomcat.
- Login credentials were baked into an error page for the manager.
- The tomcat manager had ability to upload files
- uploaded a .war reverse shell
- got system shell