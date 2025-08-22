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

## Bonus: timing md5summer.sh compared to hashcat (or similar)

```
┌──(kali㉿kali)-[~]
└─$ time hashcat -m 0 -a 0 password_hash /usr/share/wordlists/rockyou.txt 
hashcat (v6.2.6) starting

OpenCL API (OpenCL 3.0 PoCL 6.0+debian  Linux, None+Asserts, RELOC, SPIR-V, LLVM 18.1.8, SLEEF, DISTRO, POCL_DEBUG) - Platform #1 [The pocl project]
====================================================================================================================================================
* Device #1: cpu-sandybridge-Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz, 7328/14720 MB (2048 MB allocatable), 4MCU

Minimum password length supported by kernel: 0
Maximum password length supported by kernel: 256

Hashes: 1 digests; 1 unique digests, 1 unique salts
Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates
Rules: 1

Optimizers applied:
* Zero-Byte
* Early-Skip
* Not-Salted
* Not-Iterated
* Single-Hash
* Single-Salt
* Raw-Hash

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Watchdog: Temperature abort trigger set to 90c

Host memory required for this attack: 1 MB

Dictionary cache building /usr/share/wordlists/rockyou.txt: 33553434 bytes (2Dictionary cache building /usr/share/wordlists/rockyou.txt: 100660302 bytes (Dictionary cache built:
* Filename..: /usr/share/wordlists/rockyou.txt
* Passwords.: 14344392
* Bytes.....: 139921507
* Keyspace..: 14344385
* Runtime...: 1 sec

2cb42f8734ea607eefed3b70af13bbd3:qwerty789                
                                                          
Session..........: hashcat
Status...........: Cracked
Hash.Mode........: 0 (MD5)
Hash.Target......: 2cb42f8734ea607eefed3b70af13bbd3
Time.Started.....: Fri Aug 22 15:39:35 2025 (0 secs)
Time.Estimated...: Fri Aug 22 15:39:35 2025 (0 secs)
Kernel.Feature...: Pure Kernel
Guess.Base.......: File (/usr/share/wordlists/rockyou.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#1.........:  1882.5 kH/s (0.62ms) @ Accel:1024 Loops:1 Thr:1 Vec:8
Recovered........: 1/1 (100.00%) Digests (total), 1/1 (100.00%) Digests (new)
Progress.........: 102400/14344385 (0.71%)
Rejected.........: 0/102400 (0.00%)
Restore.Point....: 98304/14344385 (0.69%)
Restore.Sub.#1...: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#1....: Dominic1 -> birth
Hardware.Mon.#1..: Util: 68%

Started: Fri Aug 22 15:39:06 2025
Stopped: Fri Aug 22 15:39:36 2025

real    30.36s
user    27.46s
sys     0.44s
cpu     91%
              
```
Hashcat found the password in ~30 seconds.
./md5summer took more than 10 times longer lol :O
```
──(kali㉿kali)-[~/…/HackTheBox/Retired Machines/Vaccine/10 - Loot]
└─$ time ./md5summer.sh    
Hashing /usr/share/wordlists/rockyou.txt to /tmp/hashes.txt
Hash found: qwerty789

real    394.56s
user    442.50s
sys     216.02s
cpu     166%

```

I created md5summer.sh and it is in [[Vaccine/10 - Loot/10 - Loot|10 - Loot]], use if you have time to kill.
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