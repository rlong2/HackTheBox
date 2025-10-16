Inspecting the file
```
└─$ pwd    
/home/kali/Desktop/HackTheBox/Retired Challenges/SpookyPass/rev_spookypass
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Challenges/SpookyPass/rev_spookypass]
└─$ ls -la      
total 24
drwxr-xr-x 2 kali kali  4096 Oct  4  2024 .
drwxrwxr-x 3 kali kali  4096 Oct 16 11:17 ..
-rwxr-xr-x 1 kali kali 15912 Oct  4  2024 pass
                                                                             
┌──(kali㉿kali)-[~/…/HackTheBox/Retired Challenges/SpookyPass/rev_spookypass]
└─$ file pass 
pass: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=3008217772cc2426c643d69b80a96c715490dd91, for GNU/Linux 4.4.0, not stripped
```

Running strings
```
└─$ strings pass                                  
/lib64/ld-linux-x86-64.so.2
fgets
stdin
<SNIP>
Welcome to the 
[1;3mSPOOKIEST
[0m party of the year.
Before we let you in, you'll need to give us the password: 
s3cr3t_p455_f0r_gh05t5_4nd_gh0ul5
Welcome inside!
You're not a real ghost; clear off!
<SNIP>
.comment
```

Looks like the password above can be used to step through the program via stdin
```
└─$ ./pass                                             
Welcome to the SPOOKIEST party of the year.
Before we let you in, you'll need to give us the password: s3cr3t_p455_f0r_gh05t5_4nd_gh0ul5
Welcome inside!
HTB{un0bfu5c4t3d_5tr1ng5}

```