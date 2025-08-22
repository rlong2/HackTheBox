# Vaccine Overview

Machine Details:

| IP          | Name    | Difficulty | Machine Type |
| ----------- | ------- | ---------- | ------------ |
| 10.129.1.17 | Vaccine | Very Easy  | Linux        |

### tags:
- SQL injection
- postgres
- Anonymous FTP
- cracking, hashcat, john the ripper
- gtfobins
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

FTP, SSH, and HTTP services are running on the target. Anonymous FTP allowed the attacker to download a password-protected zip file, which was cracked and extracted. One of the extracted files revealed a username and md5-hashed password to access the web login as an administrator. The md5-hashed password was cracked, allowing the attacker to log onto the web portal. A search bar on the dashboard was susceptible to command injection, and allowed the attacker to gain an os shell as the `postgres` user. The user had privileges to run `vi` with sudo, and the attacker was able to pop a root shell.

## Bullet points
- ftp, ssh, and http services running on Vaccine.
- ftp has anonymous access, got a backup.zip
- Cracked the zip password. It has a conf file that shows the md5sum of the admin password to get through the login portal
- the admin md5sum was cracked to reveal admin login creds for the http service.
- Logging in shows a search bar, which is injectable
- obtained an os shell as postgres user.
- enumerated and found plaintext ssh credentials for postgres user
- postgres is able to use vi with sudo. Popped a root shell :)