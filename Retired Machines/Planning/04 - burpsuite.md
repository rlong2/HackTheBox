http://planning.htb/ - landing page, search for classes
## Request
```
POST /index.php HTTP/1.1
Host: planning.htb
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 11
Origin: http://planning.htb
DNT: 1
Connection: keep-alive
Referer: http://planning.htb/index.php
Upgrade-Insecure-Requests: 1
Priority: u=0, i

keyword=foo
```

## Response
```
<SNIP>
            <div class="message">
                <h3>Search results:</h3>            </div>
<SNIP>
```

http://planning.htb/enroll.php - name/email/phone number field
## Request
```
POST /enroll.php HTTP/1.1
Host: planning.htb
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Content-Type: application/x-www-form-urlencoded
Content-Length: 52
Origin: http://planning.htb
DNT: 1
Connection: keep-alive
Referer: http://planning.htb/enroll.php
Upgrade-Insecure-Requests: 1
Priority: u=0, i

full_name=foo&email=bar%40gmail.com&phone=1232132132
```

## Response
```
<SNIP>
         <div class='alert alert-success'>Successful registration - Thank you!</div>          <form method="POST" action="enroll.php">
<SNIP>
```
	
http://planning.htb/contact.php - send a message
- no interesting response