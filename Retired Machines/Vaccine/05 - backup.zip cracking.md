# Creating a hash from the file
```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ zip2john backup.zip > backup_hash.txt
ver 2.0 efh 5455 efh 7875 backup.zip/index.php PKZIP Encr: TS_chk, cmplen=1201, decmplen=2594, crc=3A41AE06 ts=5722 cs=5722 type=8
ver 2.0 efh 5455 efh 7875 backup.zip/style.css PKZIP Encr: TS_chk, cmplen=986, decmplen=3274, crc=1B1CCD6A ts=989A cs=989a type=8
NOTE: It is assumed that all files in each archive have the same password.
If that is not the case, the hash may be uncrackable. To avoid this, use
option -o to pick a file at a time.

```

The hash is a `pkzip`, but that doesn't appear to be a selectable option.
```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ less backup_hash.txt           
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ john --list=formats | grep zip  
416 formatsSalted-SHA1, SSHA512, sapb, sapg, saph, sappse, securezip, 7z, Signal, SIP, 
 (149 dynamic formats shown as just "dynamic_n" here)

```

# Cracking the hash
```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ john --wordlist=/usr/share/wordlists/rockyou.txt backup_hash.txt 
Using default input encoding: UTF-8
Loaded 1 password hash (PKZIP [32/64])
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
741852963        (backup.zip)     
1g 0:00:00:00 DONE (2025-08-21 17:52) 10.00g/s 81920p/s 81920c/s 81920C/s 123456..whitetiger
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ john --show backup_hash.txt                                     
backup.zip:741852963::backup.zip:style.css, index.php:backup.zip

1 password hash cracked, 0 left

```

backup.zip:741852963

# Successfully unzipped :)
```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ unzip backup.zip 
Archive:  backup.zip
[backup.zip] index.php password: 
  inflating: index.php               
  inflating: style.css  
```
