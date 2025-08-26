After leveraging the XXE vulnerability (see [[04 - XXE]]), daniel's ssh key is exposed.

```
┌──(kali㉿kali)-[~]
└─$ ssh -i ~/.ssh/markup_daniel_key daniel@10.129.95.192
< ENTER >

Microsoft Windows [Version 10.0.17763.107]
(c) 2018 Microsoft Corporation. All rights reserved.

daniel@MARKUP C:\Users\daniel>

```

## Snooping around
```
daniel@MARKUP C:\Users\daniel>whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                    State
============================= ============================== =======
SeChangeNotifyPrivilege       Bypass traverse checking       Enabled
SeIncreaseWorkingSetPrivilege Increase a process working set Enabled
```

# TODO: upload winpeas