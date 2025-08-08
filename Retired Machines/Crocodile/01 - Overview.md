# Crocodile Overview

Machine Details:

| IP          | Name      | Difficulty | Machine Type |
| ----------- | --------- | ---------- | ------------ |
| 10.129.1.15 | Crocodile | Very Easy  | Linux        |

tags:
- login
- insecure credentials
- anonymous ftp

### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

An http server is running on the machine. Enumerating with gobuster led the way to a login page. An ftp service allowing anonymous access had usernames and credentials available for download in clear text. After trying a combination of usernames and passwords, user `admin` was allowed access to http://10.129.1.15/dashboard/index.php#, which contained the flag.