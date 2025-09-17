# Bashed Overview

Machine Details:

| IP          | Name   | Difficulty | Machine Type |
| ----------- | ------ | ---------- | ------------ |
| 10.10.10.68 | Bashed | Easy       | Linux        |

### tags:
- reverse shell
- malicious file
- cron
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running an http server. There is a sub-directory allowing the attacker to run `phpbash`, which is a semi-interactive php shell as the `www-data` user. This user is able to run sudo commands as the `scriptmanager` user, so the attacker quickly gained a shell as the `scriptmanager` user. This user has access to a directory containing a python file that is executed every minute as the root user. The attacker overwrote the python file with a malicious reverse shell and gained a root shell on the target.

## Bullet points
- port 80 is running an http server
- Attacker finds a /dev/subdirectory and is able to get a shell as www-data user
- User `arrexel` has their flag read permissions available to all, got user flag.
- `www-data` can run sudo commands as the `scriptmanager` user.
- Attacker leverages this to gain a shell as `scriptmanager`
- A `/scripts` directory has a `test.py` file that gets ran every minute as root
- Create malicious `test.py` to get a reverse shell as `root`