The backup.zip contains an index.php that appears to show the md5sum of the password value.
```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ head -n 7 index.php
<!DOCTYPE html>
<?php
session_start();
  if(isset($_POST['username']) && isset($_POST['password'])) {
    if($_POST['username'] === 'admin' && md5($_POST['password']) === "2cb42f8734ea607eefed3b70af13bbd3") {
      $_SESSION['login'] = "true";
      header("Location: dashboard.php");
```

If the md5sum can be brute forced, the attacker will likely have access to log in to the login portal.

I created md5summer.sh and it is in [[Vaccine/10 - Loot/10 - Loot|10 - Loot]]
It cracked the md5sum!

```
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ ./md5summer.sh  
Hashing /usr/share/wordlists/rockyou.txt to /tmp/hashes.txt
Hash found: qwerty789

```

- admin
- qwerty789

These credentials don't appear to work for FTP or SSH :/... but they work for the web login panel!