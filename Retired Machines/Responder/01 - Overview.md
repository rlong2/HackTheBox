# Responder Overview

Machine Details:

| IP           | Name      | Difficulty | Machine Type |
| ------------ | --------- | ---------- | ------------ |
| 10.129.81.78 | Responder | Very Easy  | Windows      |

tags:
- NTLM
- Responder
- john the ripper
- LFI
- WinRM
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag

#### Note
- The machine was reset multiple times, so the IP address changes throughout scan output.
## Box Outline

An http server is running on the target, along with a wsman service. The website allowed for local file inclusion. Since the path of the flag.txt was not known, the attacker proceeded to gain further access by using the Responder tool to intercept the Administrator's NTLMv2 hash. The hash was cracked by John the Ripper, and these credentials were used to authenticate over WinRM and get the flag. 