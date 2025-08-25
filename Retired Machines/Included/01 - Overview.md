# Included Overview

Machine Details:

| IP           | Name     | Difficulty | Machine Type |
| ------------ | -------- | ---------- | ------------ |
| 10.129.69.47 | Included | Very Easy  | Linux        |

### tags:
- LFI
- TFTP
- UDP
- reverse shell
- lxc
- lxd
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The target is running an http service on port 80. The attacker was able to read the contents of /etc/passwd due to local file inclusion and discover a `tftp` service account. A reverse shell was uploaded using trivial file transfer protocol (tftp) and the attacker got a reverse shell as the `www-data` service account. Credentials for user `mike` were found in `/var/www/html/.htpasswd`, and the user flag was obtained.

`mike` is a member of the `lxd` group, allowing access to create lxc containers. The attacker uploaded a lightweight alpine image, enabled security privileges on the container,  mounted the root filesystem, and started the container. The attacker was then able to browse the filesystem as the root user.

## Bullet points
- LFI --> read /etc/passwd
- A tftp user is there
- a php webshell was uploaded via tftp --> got a webshell as www-data
- lateral movement to `mike` user after discovering plaintext creds in .htpasswd.
- mike is in lxd group
- start an lxc container with security privileges enabled
- mount the root filesystem