# Planning Overview

Machine Details:

| IP          | Name     | Difficulty | Machine Type |
| ----------- | -------- | ---------- | ------------ |
| 10.10.11.68 | Planning | Easy       | Linux        |

# Provided credentials
As is common in real life pentests, you will start the Planning box with credentials for the following account: admin / 0D5oT70Fq13EvB5r
- these credentials do not appear to work for ssh
### tags:
- grafana
- CVE
- port forwarding
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

Note: This message was included along with the machine IP: 
```
As is common in real life pentests, you will start the Planning box with credentials for the following account: admin / 0D5oT70Fq13EvB5r
```
The server is running an http service and ssh service. A grafana subdomain was discovered, and the credentials provided by HTB granted access. The grafana version is vulnerable to CVE-2024-9264, and the attacker was able to gain a reverse shell inside the grafana docker container. A user `enzo` and credentials were found inside environment variables. These credentials allowed the attacker to SSH to the machine as `enzo`.

A `crontab.db` file contained a plaintext password. After enumerating network services, the attacker discovered an http service running locally and used local port forwarding to view the web page running `Crontab UI`, and logged in using the credentials found in the `crontab.db` file. The service allowed cron jobs to be created and ran as the root user. The attacker created a cron job to add `enzo` to the sudoers group and get a root shell.

## Bullet points
- http and ssh open
- enumerating found grafana.planning.htb
- The supplied creds worked for the login panel
- The grafana version 11.0 was vulnerable to CVE-2024-9264
- The CVE allowed for a reverse shell inside the grafana docker container
- Linpeas revealed a username and credentials, which allowed ssh access as enzo.
- got user flag
- A crontab.db file lists a password in plaintext
- Several ports are listening locally, including mysql and http
- attacker used local port forwarding to connect to 127.0.0.1:8000 with a login page for a cron gui.
	- Used the crontab.db creds to authenticate
- allows cronjobs to be created and run as root
- Added enzo to sudoers and got a root shell