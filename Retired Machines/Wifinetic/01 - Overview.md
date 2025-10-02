# Wifinetic Overview

Machine Details:

| IP           | Name      | Difficulty | Machine Type |
| ------------ | --------- | ---------- | ------------ |
| 10.10.11.247 | Wifinetic | Easy       | Linux        |

### tags:
- anonymous FTP
- OpenWRT
- WPA
- Cracking
- reaver
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running FTP, SSH, and DNS services. Anonymous FTP is allowed, and contains files for [OpenWRT](https://openwrt.org/start) configuration along with files from `/etc/`. There are credentials for user `netadmin` in the OpenWRT config files which are also used for SSH access.

There are multiple interfaces on the target. The `reaver` tool is on the target, and allows the WPS pin on `wlan1` to be cracked.

## Bullet points
- The target is running 21, 22, and 53
- Anonymous FTP is allowed
- There are OpenWRT backup files that contain a wifi password
- User `netadmin` is discovered in the backup files
- The credentials above allow the attacker to SSH in as `netadmin`

- There are multiple interfaces on the target
- `iwlist` was used to show access points
- `reaver` is on the machine (a WPS cracker)
- WPS PIN was cracked, pulling the WPA PSK 
- The WPA PSK credential worked to SSH into the target as root