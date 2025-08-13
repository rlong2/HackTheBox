# Bike Overview

Machine Details:

| IP             | Name | Difficulty | Machine Type |
| -------------- | ---- | ---------- | ------------ |
| 10.129.147.200 | Bike | Very Easy  | Linux        |

tags:
- http
- burpsuite
- Server side template injection
- SSTI
- nodejs
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The machine is running an Express web server with node.js. It is using a Handlebars template that is succeptible to server-side template injection. Using burpsuite to intercept a request submitted in a form, a payload was used to reveal the flag.