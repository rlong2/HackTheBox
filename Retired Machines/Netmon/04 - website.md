- http://10.10.10.152 - landing page for PRTG Network Monitor

![](Netmon/Netmon_Screenshots/LandingPage.png)
Default credentials `prtgadmin:prtgadmin` do not work.

## Burpsuite
Request
```
POST /public/checklogin.htm HTTP/1.1
Host: 10.10.10.152
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 35
Origin: http://10.10.10.152
DNT: 1
Connection: keep-alive
Referer: http://10.10.10.152/public/login.htm?errormsg=Your%20login%20has%20failed.%20Please%20try%20again%21&loginurl=
Upgrade-Insecure-Requests: 1
Priority: u=0, i

loginurl=&username=foo&password=bar
```

Response
```
HTTP/1.1 302 Moved Temporarily
Connection: close
Content-Type: text/html; charset=UTF-8
Content-Length: 0
Date: Thu, 18 Sep 2025 02:28:46 GMT
Expires: 0
Cache-Control: no-cache
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
X-Frame-Options: DENY
Server: PRTG/18.1.37.13946
Location: /public/login.htm?errormsg=Your%20login%20has%20failed.%20Please%20try%20again%21&loginurl=**
```

From 'PRTG Configuration.old.bak', there are credentials!
```
┌──(kali㉿kali)-[~]
└─$ cat ~/Desktop/HackTheBox/Retired\ Machines/Netmon/PRTG\ Configuration.old.bak | grep -A 2 prtgadmin
              <!-- User: prtgadmin -->
              PrTg@dmin2018
            </dbpassword>
<SNIP>
```

Login is still not working......

Iterating the year worked!
`prtgadmin:PrTg@dmin2019`

![](LoggedIn.png)

