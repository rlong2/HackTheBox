# Grabbing available files
```
┌──(kali㉿kali)-[~]
└─$ ftp anonymous@10.129.95.174 
Connected to 10.129.95.174.
220 (vsFTPd 3.0.3)
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
229 Entering Extended Passive Mode (|||10612|)
150 Here comes the directory listing.
-rwxr-xr-x    1 0        0            2533 Apr 13  2021 backup.zip
226 Directory send OK.
ftp> get backup.zip
local: backup.zip remote: backup.zip
229 Entering Extended Passive Mode (|||10596|)
150 Opening BINARY mode data connection for backup.zip (2533 bytes).
100% |********************************|  2533       58.42 KiB/s    00:00 ETA
226 Transfer complete.
2533 bytes received in 00:00 (14.01 KiB/s)

```

# Unzipping prompts for a password
```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ unzip backup.zip 
Archive:  backup.zip
[backup.zip] index.php password: 
   skipping: index.php               incorrect password
   skipping: style.css               incorrect password

```