# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn --open 10.129.96.149                                                                                                                  
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-22 16:11 MDT
Nmap scan report for 10.129.96.149
Host is up (0.071s latency).
Not shown: 996 closed tcp ports (reset)
PORT     STATE SERVICE
22/tcp   open  ssh
6789/tcp open  ibm-db2-admin
8080/tcp open  http-proxy
8443/tcp open  https-alt

Nmap done: 1 IP address (1 host up) scanned in 1.06 seconds              
```

### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -p- 10.129.96.149
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-22 16:11 MDT
Stats: 0:01:08 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan
Service scan Timing: About 83.33% done; ETC: 16:13 (0:00:09 remaining)
Stats: 0:02:34 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan
Service scan Timing: About 83.33% done; ETC: 16:14 (0:00:26 remaining)
Nmap scan report for 10.129.96.149
Host is up (0.068s latency).
Not shown: 65529 closed tcp ports (reset)
PORT     STATE SERVICE         VERSION
22/tcp   open  ssh             OpenSSH 8.2p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 48:ad:d5:b8:3a:9f:bc:be:f7:e8:20:1e:f6:bf:de:ae (RSA)
|   256 b7:89:6c:0b:20:ed:49:b2:c1:86:7c:29:92:74:1c:1f (ECDSA)
|_  256 18:cd:9d:08:a6:21:a8:b8:b6:f7:9f:8d:40:51:54:fb (ED25519)
6789/tcp open  ibm-db2-admin?
8080/tcp open  http            Apache Tomcat (language: en)
|_http-open-proxy: Proxy might be redirecting requests
|_http-title: Did not follow redirect to https://10.129.96.149:8443/manage
8443/tcp open  ssl/nagios-nsca Nagios NSCA
| ssl-cert: Subject: commonName=UniFi/organizationName=Ubiquiti Inc./stateOrProvinceName=New York/countryName=US
| Subject Alternative Name: DNS:UniFi
| Not valid before: 2021-12-30T21:37:24
|_Not valid after:  2024-04-03T21:37:24
| http-title: UniFi Network
|_Requested resource was /manage/account/login?redirect=%2Fmanage
8843/tcp open  ssl/http        Apache Tomcat (language: en)
|_http-title: HTTP Status 400 \xE2\x80\x93 Bad Request
| ssl-cert: Subject: commonName=UniFi/organizationName=Ubiquiti Inc./stateOrProvinceName=New York/countryName=US
| Subject Alternative Name: DNS:UniFi
| Not valid before: 2021-12-30T21:37:24
|_Not valid after:  2024-04-03T21:37:24
8880/tcp open  http            Apache Tomcat (language: en)
|_http-title: HTTP Status 400 \xE2\x80\x93 Bad Request
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 195.34 seconds
```

# Gobuster
## gobuster - common, no tls validation
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir --no-tls-validation -u https://10.129.96.149:8443 -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     https://10.129.96.149:8443
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/api/experiments      (Status: 401) [Size: 63]
/api                  (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fapi]                                                                 
/api/experiments/configurations (Status: 401) [Size: 63]
/diag                 (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fdiag]                                                                
/file                 (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Ffile]                                                                
/guest                (Status: 302) [Size: 0] [--> http://www.google.com/]
/logout               (Status: 302) [Size: 0] [--> /manage]
/manage               (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fmanage]                                                              
/op                   (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fop]                                                                  
/pages                (Status: 302) [Size: 0] [--> /pages/]
/print                (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fprint]                                                               
/setup                (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fsetup]                                                               
/status               (Status: 200) [Size: 112]
/upload               (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fupload]                                                              
/v2                   (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fv2]                                                                  
/wss                  (Status: 302) [Size: 0] [--> /manage/account/login?redirect=%2Fwss]                                                                 
Progress: 4750 / 4750 (100.00%)
===============================================================
Finished
===============================================================

```

## gobuster - vhost fuzzing
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -k -u https://10.129.96.149:8443 --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             https://10.129.96.149:8443
[+] Method:          GET
[+] Threads:         10
[+] Wordlist:        /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: gc._msdcs.10.129.96.149:8443 Status: 400 [Size: 435]
Progress: 4989 / 4990 (99.98%)
===============================================================
Finished
===============================================================

```