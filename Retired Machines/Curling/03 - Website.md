- http://10.10.10.150/ - a curling forum
- `cewl` may be a reference to https://www.kali.org/tools/cewl/
- Login form present on landing page
- forgot password?
	- http://10.10.10.150/index.php/component/users/?view=remind&Itemid=101
- forgot username?
	- http://10.10.10.150/index.php/component/users/?view=remind&Itemid=101
- http://10.10.10.150/configuration.php
- http://10.10.10.150/secret.txt - contains a secret
	- Doesn't work with floris on login page or ssh
- http://10.10.10.150/administrator/ - accessible after logging into the main pgae with creds.

### Potential users
- Floris
- Super User

### appalyzer
- joomla
- php

### Posts
- One post by Floris has `curling2018` in the body.

## Cewl
```
┌──(kali㉿kali)-[~]
└─$ cewl -d 2 -m 5 --with-numbers -w curling_words.txt http://10.10.10.150
CeWL 6.2.1 (More Fixes) Robin Wood (robin@digi.ninja) (https://digi.ninja/)
                                                                             
┌──(kali㉿kali)-[~]
└─$ wc -l curling_words.txt                                               
124 curling_words.txt

```

## Burpsuite intruder
Using variations of an interesting word found by `cewl`, a password was found.
![[curlingFlorisLogin.png]]

Those credentials log floris in as a superuser, but there isn't much to see on the page.
![[curlingFlorisSuperAdmin.png]]

Floris can edit the modules, and now can access the Joomla page:
http://10.10.10.150/administrator/