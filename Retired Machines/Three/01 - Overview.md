# Three Overview

Machine Details:

| IP             | Name  | Difficulty | Machine Type |
| -------------- | ----- | ---------- | ------------ |
| 10.129.166.187 | Three | Very Easy  | Linux        |

tags:
- aws
- s3
- misconfiguration
- web shell
- php
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

A web server is running on the target. Enumerating through subdirectories, the attacker  discovered an s3 bucket that did not require authentication to upload files. After uploading a php shell, the flag was discovered.