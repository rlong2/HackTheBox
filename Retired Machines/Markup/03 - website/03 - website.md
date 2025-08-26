http://10.129.95.192/ brings up a login portal (MegaShopping, powered by Megacorp).
Wappalyzer notes
- PHP 7.2.28
- Apache Server 2.4.41
- Windows Server

# Burp
## Catching a login request
```
POST / HTTP/1.1
Host: 10.129.224.59
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 25
Origin: http://10.129.224.59
DNT: 1
Connection: keep-alive
Referer: http://10.129.224.59/
Cookie: PHPSESSID=kmmi5u5h31q1cl90jdefgsho48
Upgrade-Insecure-Requests: 1
Priority: u=0, i

username=foo&password=bar
```

## Response
A popup box says 'Wrong Credentials'
```
HTTP/1.1 200 OK
Date: Mon, 25 Aug 2025 22:19:49 GMT
Server: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
X-Powered-By: PHP/7.2.28
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Length: 66
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8

<script>alert("Wrong Credentials");document.location="/";</script>
```

## Intruder
![[webIntruder.png]]
Some credentials bring up a dashboard:
- admin
- password

![[adminDashboard.png]]

Several forms seem promising
- http://10.129.224.59/services.php
![[OrderInBulk.png]]

## Curl - found potential user
Inspecting the source code on the page finds a potential username
```
  <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Goods & Services</title>
        <!-- Modified by Daniel : UI-Fix-9092-->
        <style>
            <
            link href
```

## Burpsuite - bulk order
### bulk order request
```
POST /process.php HTTP/1.1
Host: 10.129.224.59
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: text/xml
Content-Length: 119
Origin: http://10.129.224.59
DNT: 1
Connection: keep-alive
Referer: http://10.129.224.59/services.php
Cookie: PHPSESSID=kmmi5u5h31q1cl90jdefgsho48
Priority: u=0

<?xml version = "1.0"?><order><quantity>99</quantity><item>Home Appliances</item><address>123 fake st</address></order>
```

### bulk order response
```
HTTP/1.1 200 OK
Date: Mon, 25 Aug 2025 22:31:55 GMT
Server: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
X-Powered-By: PHP/7.2.28
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Length: 49
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8

Your order for Home Appliances has been processed
```

The 'item' field is repeated back.
Contact Us
- http://10.129.224.59/contact.php
![[Contact Us.png]]

Submit button might not work, burp didn't capture anything


