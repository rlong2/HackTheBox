Anonymous access is allowed
```
┌──(kali㉿kali)-[~]
└─$ ftp anonymous@10.129.230.135
Connected to 10.129.230.135.
220 (vsFTPd 3.0.3)
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
229 Entering Extended Passive Mode (|||43351|)
150 Here comes the directory listing.
drwxr-xr-x    2 ftp      ftp          4096 Nov 28  2022 mail_backup
226 Directory send OK.
ftp> ls
229 Entering Extended Passive Mode (|||19882|)
150 Here comes the directory listing.
drwxr-xr-x    2 ftp      ftp          4096 Nov 28  2022 mail_backup
226 Directory send OK.
ftp> cd mail_backup
250 Directory successfully changed.
ftp> ls
229 Entering Extended Passive Mode (|||48189|)
150 Here comes the directory listing.
-rw-r--r--    1 ftp      ftp         58899 Nov 28  2022 password_policy.pdf
-rw-r--r--    1 ftp      ftp           713 Nov 28  2022 welcome_28112022
226 Directory send OK.
ftp> mget *
mget password_policy.pdf [anpqy?]? 
229 Entering Extended Passive Mode (|||40561|)
150 Opening BINARY mode data connection for password_policy.pdf (58899 bytes).
100% |****************************************************************************************************************| 58899      385.82 KiB/s    00:00 ETA
226 Transfer complete.
58899 bytes received in 00:00 (190.27 KiB/s)
mget welcome_28112022 [anpqy?]? 
229 Entering Extended Passive Mode (|||44239|)
150 Opening BINARY mode data connection for welcome_28112022 (713 bytes).
100% |****************************************************************************************************************|   713       15.03 KiB/s    00:00 ETA
226 Transfer complete.
713 bytes received in 00:00 (3.91 KiB/s)
ftp> exit
221 Goodbye.
```

See the [[Funnel/10 - Loot/10 - Loot|10 - Loot]] note for potential accounts and a password policy PDF.


### Check FTP access for users with default creds
- root
- optimus
- albert
- andreas
- christine
- maria
- Default password to try: funnel123#!#