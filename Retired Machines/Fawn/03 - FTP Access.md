Anonymous FTP access is allowed.

```
┌──(kali㉿kali)-[~]
└─$ ftp anonymous@10.129.1.14         
Connected to 10.129.1.14.
220 (vsFTPd 3.0.3)
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp>
```

### Exploring the FTP server
```
ftp> ls
229 Entering Extended Passive Mode (|||38719|)
150 Here comes the directory listing.
-rw-r--r--    1 0        0              32 Jun 04  2021 flag.txt
226 Directory send OK.
ftp> get flag.txt
local: flag.txt remote: flag.txt
229 Entering Extended Passive Mode (|||45744|)
150 Opening BINARY mode data connection for flag.txt (32 bytes).
100% |********************************|    32      236.74 KiB/s    00:00 ETA
226 Transfer complete.
32 bytes received in 00:00 (0.65 KiB/s)
ftp> exit
221 Goodbye.
```