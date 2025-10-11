# Sau Overview

Machine Details:

| IP           | Name | Difficulty | Machine Type |
| ------------ | ---- | ---------- | ------------ |
| 10.10.11.224 | Sau  | Easy       | Linux        |

### tags:
- SSRF
- CVE-2023–27163
- Maltrail
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running an ssh service and http services. The web service is running `request-baskets`, and the version is vulnerable to server-side request forgery (SSRF). The attacker exploits this and can access port 80, which is running locally on the target and powered by Maltrail. This version of Maltrail allows the attacker to inject OS commands, and the attacker gains a shell as user `puma`.

`puma` has privileges to run a `systemctl` command with sudo. When ran, the status gets output to `less`, and the attacker is able to spawn a root shell from the`less` pager.

## Bullet points
- Target has an ssh service and http server running request-baskets
- The request-baskets version is vulnerable to server-side request forgery
- The attacker exploited CVE-2023-27163 and accessed port 80 running locally on the target
- port 80 is running Maltrail
- The version of Maltrail allows attackers to inject os commands
- Attacker gets a shell as user `puma`

- `puma` can run `systemctl status trail.service` as root
- This command outputs to `less`, which the attacker spawned a root shell from