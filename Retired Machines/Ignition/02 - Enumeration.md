# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open 10.129.213.34 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-11 17:26 MDT
Nmap scan report for 10.129.213.34
Host is up (0.076s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 1.17 seconds
             
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC 10.129.213.34              
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-11 17:26 MDT
Nmap scan report for 10.129.213.34
Host is up (0.047s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
80/tcp open  http    nginx 1.14.2
|_http-server-header: nginx/1.14.2
|_http-title: Did not follow redirect to http://ignition.htb/

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 19.21 seconds
```

Popped ignition.htb into /etc/hosts...

# wappalyzer
Lots going on here
![[wappalyzer - ignition.png]]

# gobuster
### vhost fuzzing for subdirectories (none found)
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://ignition.htb --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://ignition.htb
[+] Method:          GET
[+] Threads:         10
[+] Wordlist:        /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Progress: 4989 / 4990 (99.98%)
===============================================================              
Finished                                                                     
===============================================================
```

### gobuster directory search
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://ignition.htb -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x html,php
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://ignition.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              html,php
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/0                    (Status: 200) [Size: 25803]
/Home                 (Status: 301) [Size: 0] [--> http://ignition.htb/home]
/admin                (Status: 200) [Size: 7095]
/catalog              (Status: 302) [Size: 0] [--> http://ignition.htb/]
/checkout             (Status: 302) [Size: 0] [--> http://ignition.htb/checkout/cart/]
/cms                  (Status: 200) [Size: 25817]
/contact              (Status: 200) [Size: 28673]
/enable-cookies       (Status: 200) [Size: 27176]
/errors               (Status: 301) [Size: 185] [--> http://ignition.htb/errors/]
/home                 (Status: 200) [Size: 25802]
/index.php            (Status: 200) [Size: 25815]
/index.php            (Status: 200) [Size: 25815]
/media                (Status: 301) [Size: 185] [--> http://ignition.htb/media/]
/opt                  (Status: 301) [Size: 185] [--> http://ignition.htb/opt/]
/rest                 (Status: 400) [Size: 52]
/robots.txt           (Status: 200) [Size: 1]
/robots               (Status: 200) [Size: 1]
/setup                (Status: 301) [Size: 185] [--> http://ignition.htb/setup/]                                                                          
/soap                 (Status: 200) [Size: 391]
/static               (Status: 301) [Size: 185] [--> http://ignition.htb/static/]                                                                         
/wishlist             (Status: 302) [Size: 0] [--> http://ignition.htb/customer/account/login/referer/aHR0cDovL2lnbml0aW9uLmh0Yi93aXNobGlzdA%2C%2C/]      
Progress: 14250 / 14250 (100.00%)
===============================================================
Finished
===============================================================
```

# Checking out soap
```
┌──(kali㉿kali)-[~]
└─$ curl ignition.htb/soap    
<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope" >
   <env:Body>
      <env:Fault>
         <env:Code>
            <env:Value>env:Receiver</env:Value>
         </env:Code>
         <env:Reason>
            <env:Text xml:lang="en">Invalid XML</env:Text>
         </env:Reason>
         
      </env:Fault>
   </env:Body>
</env:Envelope>                                                                             
┌──(kali㉿kali)-[~]
└─$ curl ignition.htb/soap?wsdl
<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope" >
   <env:Body>
      <env:Fault>
         <env:Code>
            <env:Value>env:Sender</env:Value>
         </env:Code>
         <env:Reason>
            <env:Text xml:lang="en">Incorrect format of request URI or Requested services are missing.</env:Text>
         </env:Reason>
         
      </env:Fault>
   </env:Body>
</env:Envelope>  
```