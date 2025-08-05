Enumerating shares on the machine:
```
┌──(kali㉿kali)-[~]
└─$ smbclient -L 10.129.1.12
Password for [WORKGROUP\kali]:

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
        WorkShares      Disk      
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to 10.129.1.12 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Unable to connect with SMB1 -- no workgroup available

```

No password was needed to list the shares.

Accessible shares with a blank username and password:
- IPC$
- WorkShares

#### Investigating IPC$
```
┌──(kali㉿kali)-[~]
└─$ smbclient //10.129.1.12/IPC$
Password for [WORKGROUP\kali]:
Try "help" to get a list of possible commands.
smb: \> cd
Current directory is \
smb: \> ls
NT_STATUS_NO_SUCH_FILE listing \*

```
IPC$ appears to be empty.
#### Investigating WorkShares
```
┌──(kali㉿kali)-[~]
└─$ smbclient //10.129.1.12/WorkShares
Password for [WORKGROUP\kali]:
Try "help" to get a list of possible commands.
smb: \> ls
  .                                   D        0  Mon Mar 29 02:22:01 2021
  ..                                  D        0  Mon Mar 29 02:22:01 2021
  Amy.J                               D        0  Mon Mar 29 03:08:24 2021
  James.P                             D        0  Thu Jun  3 02:38:03 2021

                5114111 blocks of size 4096. 1750485 blocks available
smb: \> pwd
Current directory is \\10.129.1.12\WorkShares\
smb: \> ls Amy.J\
  .                                   D        0  Mon Mar 29 03:08:24 2021
  ..                                  D        0  Mon Mar 29 03:08:24 2021
  worknotes.txt                       A       94  Fri Mar 26 05:00:37 2021

                5114111 blocks of size 4096. 1750461 blocks available
smb: \> ls James.P\
  .                                   D        0  Thu Jun  3 02:38:03 2021
  ..                                  D        0  Thu Jun  3 02:38:03 2021
  flag.txt                            A       32  Mon Mar 29 03:26:57 2021

                5114111 blocks of size 4096. 1750461 blocks available

```




Attempted usernames and passwords with no luck:

| username | password | access? |
| -------- | -------- | ------- |
|          |          | no      |
| guest    |          | no      |
