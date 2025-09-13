# Jerry Overview

Machine Details:

| IP          | Name  | Difficulty | Machine Type |
| ----------- | ----- | ---------- | ------------ |
| 10.10.10.95 | Jerry | Easy       | Windows      |

### tags:
- weak credentials
- Apache Tomcat
- 
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

An outline of how the box was pwned.

## Bullet points
- http proxy server running Apache Tomcat.
- Login credentials were baked into an error page for the manager.
- The tomcat manager had ability to upload files
- uploaded a .war reverse shell
- 