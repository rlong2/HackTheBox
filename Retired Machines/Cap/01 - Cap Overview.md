

Machine Details:

| IP           | Name | Difficulty | Machine Type |
| ------------ | ---- | ---------- | ------------ |
| 10.10.10.245 | Cap  | Easy       | Linux        |

### tags:
- pcap
- IDOR
- plaintext credentials
- password reuse
- SUID
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running FTP, SSH, and HTTP services. The website auto-logs in to a portal that allows the attacker to download pcap files. Using indirect object reference (IDOR), the attacker downloaded a pcap file that captured FTP login credentials for `nathan`. This credential also allowed the attacker to SSH as `nathan`. Enumeration revealed that python3.8 has the SUID bit set, and the attacker could spawn a root shell.

## Bullet points
- The target is hosting ftp, ssh, and http
- The website auto-logs in as a user
- that user has access to download pcap files
- IDOR allows hacker to download a pcap file that contains creds!
- the creds are valid for ssh and ftp
- the SUID bit is set on python3.8, got root