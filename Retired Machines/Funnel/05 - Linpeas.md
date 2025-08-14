https://github.com/peass-ng/PEASS-ng/blob/master/linPEAS/README.md
```
# Output to file
./linpeas.sh -a > /dev/shm/linpeas.txt #Victim
less -r /dev/shm/linpeas.txt #Read with colors
```

Entire output available in [[Funnel/10 - Loot/10 - Loot|10 - Loot]]

```
<SNIP>
Vulnerable to CVE-2021-3560
<SNIP>
```

https://www.exploit-db.com/exploits/50011

```
christine@funnel:/tmp$ vim ignore.sh
christine@funnel:/tmp$ chmod +x ignore.sh 
christine@funnel:/tmp$ ./ignore.sh 
[*] Vulnerable version of polkit found
[*] Determining dbus-send timing
[*] Attempting to create account
<Script hangs here...>
```

https://github.blog/security/vulnerability-research/privilege-escalation-polkit-root-on-linux-with-bug/
- mentions localhost

### Exploring localhost
```
christine@funnel:/tmp$ netstat -tlp
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 localhost:45489         0.0.0.0:*               LISTEN      -                   
tcp        0      0 localhost:domain        0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:ssh             0.0.0.0:*               LISTEN      -                   
tcp        0      0 localhost:postgresql    0.0.0.0:*               LISTEN      -                   
tcp6       0      0 [::]:ftp                [::]:*                  LISTEN      -                   
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      -                   
christine@funnel:/tmp$ netstat -tlpn
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.1:45489         0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:5432          0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::21                   :::*                    LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -
```

localhost:postgresql is running on port 5432