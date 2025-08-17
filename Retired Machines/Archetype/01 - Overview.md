# Archetype Overview

Machine Details:

| IP           | Name      | Difficulty | Machine Type |
| ------------ | --------- | ---------- | ------------ |
| 10.129.47.24 | Archetype | Very Easy  | Windows      |

tags:
- MSSQL
- SMB
- Reverse shell payload
- misconfigured credentials
- xp_cmdshell
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline
Enumeration revealed an SMB service and MSSQL server on the target. An SMB share was able to be accessed without credentials, and the attacker discovered plaintext credentials in a configuration file. These credentials allowed an sql service account to authenticate to the MSSQL server. The attacker uploaded a reverse shell for easier enumeration, and a winPEAS payload was used to enumerate the machine further. The attacker discovered plaintext credentials for the administrator in a history file, allowing access to the root.txt on the SMB C$ share.

### Bullet points
- Access to an unauthenticated SMB share --> production configuration file
- configuration file had credentials for an sql service account
- sql service account credentials used to access the MSSQL service.
- xp_cmdshell command was enabled and used to upload reverse shell and winPEAS payloads.
- A history file was discovered to have plaintext credentials for accessing the SMB C$ administrator share.
- The credentials above were used to obtain the root flag.

