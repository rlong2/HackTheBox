# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.95.232             
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 06:12 MDT
Nmap scan report for 10.129.95.232
Host is up (0.080s latency).
Not shown: 65534 closed tcp ports (reset)
PORT     STATE SERVICE
3306/tcp open  mysql

Nmap done: 1 IP address (1 host up) scanned in 20.43 seconds              
```

- Note: machine reset here since nmap was timing out with the `sV` flag
### nmap scan 2: service version
```
┌──(kali㉿kali)-[~]
└─$ nmap -sV -sC -v -p 3306 10.129.62.240
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 06:30 MDT
NSE: Loaded 157 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 06:30
Completed NSE at 06:30, 0.00s elapsed
Initiating NSE at 06:30
Completed NSE at 06:30, 0.00s elapsed
Initiating NSE at 06:30
Completed NSE at 06:30, 0.00s elapsed
Initiating Ping Scan at 06:30
Scanning 10.129.62.240 [4 ports]
Completed Ping Scan at 06:30, 0.07s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 06:30
Completed Parallel DNS resolution of 1 host. at 06:30, 0.03s elapsed
Initiating SYN Stealth Scan at 06:30
Scanning 10.129.62.240 [1 port]
Discovered open port 3306/tcp on 10.129.62.240
Completed SYN Stealth Scan at 06:30, 0.07s elapsed (1 total ports)
Initiating Service scan at 06:30
Scanning 1 service on 10.129.62.240
Completed Service scan at 06:32, 157.55s elapsed (1 service on 1 host)
NSE: Script scanning 10.129.62.240.
Initiating NSE at 06:32
Completed NSE at 06:33, 21.85s elapsed
Initiating NSE at 06:33
Completed NSE at 06:33, 21.24s elapsed
Initiating NSE at 06:33
Completed NSE at 06:33, 0.00s elapsed
Nmap scan report for 10.129.62.240
Host is up (0.047s latency).

PORT     STATE SERVICE VERSION
3306/tcp open  mysql?
| mysql-info: 
|   Protocol: 10
|   Version: 5.5.5-10.3.27-MariaDB-0+deb10u1
|   Thread ID: 97
|   Capabilities flags: 63486
|   Some Capabilities: Support41Auth, SupportsLoadDataLocal, InteractiveClient, SupportsTransactions, ConnectWithDatabase, Speaks41ProtocolNew, IgnoreSpaceBeforeParenthesis, IgnoreSigpipes, DontAllowDatabaseTableColumn, Speaks41ProtocolOld, FoundRows, SupportsCompression, ODBCClient, LongColumnFlag, SupportsAuthPlugins, SupportsMultipleStatments, SupportsMultipleResults
|   Status: Autocommit
|   Salt: gs+zF.P*}]9E-P+$q/7d
|_  Auth Plugin Name: mysql_native_password

NSE: Script Post-scanning.
Initiating NSE at 06:33
Completed NSE at 06:33, 0.00s elapsed
Initiating NSE at 06:33
Completed NSE at 06:33, 0.00s elapsed
Initiating NSE at 06:33
Completed NSE at 06:33, 0.01s elapsed
Read data files from: /usr/share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 201.71 seconds
           Raw packets sent: 5 (196B) | Rcvd: 2 (84B)

```

### nmap: available mysql modules
```
┌──(kali㉿kali)-[~]
└─$ ls -l /usr/share/nmap/scripts | grep mysql
-rw-r--r-- 1 root root  6688 May 15 09:37 mysql-audit.nse
-rw-r--r-- 1 root root  2977 May 15 09:37 mysql-brute.nse
-rw-r--r-- 1 root root  2945 May 15 09:37 mysql-databases.nse
-rw-r--r-- 1 root root  3263 May 15 09:37 mysql-dump-hashes.nse
-rw-r--r-- 1 root root  2020 May 15 09:37 mysql-empty-password.nse
-rw-r--r-- 1 root root  3413 May 15 09:37 mysql-enum.nse
-rw-r--r-- 1 root root  3455 May 15 09:37 mysql-info.nse
-rw-r--r-- 1 root root  3714 May 15 09:37 mysql-query.nse
-rw-r--r-- 1 root root  2811 May 15 09:37 mysql-users.nse
-rw-r--r-- 1 root root  3265 May 15 09:37 mysql-variables.nse
-rw-r--r-- 1 root root  6977 May 15 09:37 mysql-vuln-cve2012-2122.nse
```

```
┌──(kali㉿kali)-[~]
└─$ nmap --script-help mysql-users            
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-07 06:19 MDT

mysql-users
Categories: auth intrusive
https://nmap.org/nsedoc/scripts/mysql-users.html
  Attempts to list all users on a MySQL server.
```

The above script doesn't appear to be much help. Time for some other sql access attempts.

