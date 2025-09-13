# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open -p- 10.10.10.95
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-06 07:33 MDT
Nmap scan report for 10.10.10.95
Host is up (0.046s latency).
Not shown: 65534 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT     STATE SERVICE
8080/tcp open  http-proxy

Nmap done: 1 IP address (1 host up) scanned in 99.48 seconds
            
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.10.10.95
Starting Nmap 7.95 ( https://nmap.org ) at 2025-09-06 07:36 MDT
Nmap scan report for 10.10.10.95
Host is up (0.049s latency).
Not shown: 999 filtered tcp ports (no-response)
PORT     STATE SERVICE VERSION
8080/tcp open  http    Apache Tomcat/Coyote JSP engine 1.1
|_http-open-proxy: Proxy might be redirecting requests
|_http-favicon: Apache Tomcat
|_http-server-header: Apache-Coyote/1.1
|_http-title: Apache Tomcat/7.0.88

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 19.01 seconds

```

# Gobuster
## gobuster - tomcat
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://10.10.10.95:8080 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/Web-Servers/Apache-Tomcat.txt 
===============================================================
Gobuster v3.8
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.95:8080
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/Web-Servers/Apache-Tomcat.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.8
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/examples             (Status: 302) [Size: 0] [--> /examples/]
/examples/../manager/html (Status: 401) [Size: 2536]
/examples/jsp/index.html (Status: 200) [Size: 17695]
/host-manager         (Status: 302) [Size: 0] [--> /host-manager/]
/examples/servlets/index.html (Status: 200) [Size: 7139]
/examples/jsp/snp/snoop.jsp (Status: 200) [Size: 616]
/host-manager/html/*  (Status: 401) [Size: 2098]
/manager/html         (Status: 401) [Size: 2536]
/manager/html/*       (Status: 401) [Size: 2536]
/manager/html/        (Status: 401) [Size: 2536]
/manager              (Status: 302) [Size: 0] [--> /manager/]
/manager/jmxproxy     (Status: 401) [Size: 2536]
/examples/jsp/source.jsp (Status: 500) [Size: 2387]
/manager/jmxproxy/*   (Status: 401) [Size: 2536]
/manager/status/*     (Status: 401) [Size: 2536]
/manager/status       (Status: 401) [Size: 2536]
/manager/status.xsd   (Status: 200) [Size: 4458]
/manager/text         (Status: 401) [Size: 2536]
/RELEASE-NOTES.txt    (Status: 200) [Size: 9600]
Progress: 104 / 104 (100.00%)
===============================================================
Finished
===============================================================

```