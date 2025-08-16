# Pennyworth Overview

Machine Details:

| IP             | Name       | Difficulty | Machine Type |
| -------------- | ---------- | ---------- | ------------ |
| 10.129.168.243 | Pennyworth | Very Easy  | Linux        |

tags:
- Groovy
- weak credentials
- Jenkins
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target was running a Jetty HTTP server for a Jenkins service. The login page was easily breached due to weak credentials, and the Jenkins server admin has the ability to run Groovy script. Commands were able to be executed in the browser, and the root flag was obtained. For easier access, the attacker created a reverse shell.