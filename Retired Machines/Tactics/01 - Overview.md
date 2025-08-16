# Tactics Overview

Machine Details:

| IP            | Name    | Difficulty | Machine Type |
| ------------- | ------- | ---------- | ------------ |
| 10.129.91.210 | Tactics | Very Easy  | Windows      |

tags:
- SMB
- misconfigured access
- impacket-psexec
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The Windows machine has multiple SMB shares available with no authentication necessary. `smbclient` was used to connect to the C$ share are retrieve the flag. For easier navigation, `impacket-psexec` was used to gain a shell on the target.