# Downloading txt files from WorkShares share
# ### flag.txt and worknotes.txt
```
smb: \> get James.P\flag.txt
getting file \James.P\flag.txt of size 32 as James.P\flag.txt (0.1 KiloBytes/sec) (average 0.1 KiloBytes/sec)
smb: \> get Amy.J\worknotes.txt 
getting file \Amy.J\worknotes.txt of size 94 as Amy.J\worknotes.txt (0.5 KiloBytes/sec) (average 0.3 KiloBytes/sec)

```

worknotes.txt says to secure the ftp server
```
┌──(kali㉿kali)-[~]
└─$ cat Amy.J\\worknotes.txt                  
- start apache server on the linux machine
- secure the ftp server
- setup winrm on dancing 
```
Based on the nmap scans, I don't see an ftp server on that machine. I tried to access the unknown ports over ftp as anonymous/james/amy, but didn't get anywhere.
```
┌──(kali㉿kali)-[~]
└─$ ftp anonymous@10.129.1.12 -P 49664
                                                                             
┌──(kali㉿kali)-[~]
└─$ timeout 5 ftp anonymous@10.129.1.12 -P 49664
Connected to 10.129.1.12.
                                                                             
┌──(kali㉿kali)-[~]
└─$ for port in {49664..49669}; do timeout 5 ftp anonymous@10.129.1.12 $port; done

Connected to 10.129.1.12.
Connected to 10.129.1.12.
<SNIP>
```


flag.txt
```
┌──(kali㉿kali)-[~]
└─$ ls -l James.P\\flag.txt&& md5sum James.P\\flag.txt 
-rw-r--r-- 1 kali kali 32 Aug  4 21:23 'James.P\flag.txt'
\f243c8dc1716482cd45f31a591950365  James.P\\flag.txt

```