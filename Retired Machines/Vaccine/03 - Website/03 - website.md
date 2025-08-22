The landing page is a MegaCorp login page.
Wappalyzer notes that php is being used.
![[webLandingPage.png]]

See [[06 - md5 brute forcing]] for the password cracking adventure.
- admin
- qwerty789
![[webAdminLogin.png]]

http://10.129.95.174/dashboard.php
![[webDashboard.png]]
The search bar is worth inspecting.

# Burpsuite search
```
GET /dashboard.php?search=foo HTTP/1.1
Host: 10.129.66.143
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
DNT: 1
Connection: keep-alive
Referer: http://10.129.66.143/dashboard.php
Cookie: PHPSESSID=mudfd7ug5ugl1dfqme3lgap3ha
Upgrade-Insecure-Requests: 1
Priority: u=0, i

```
