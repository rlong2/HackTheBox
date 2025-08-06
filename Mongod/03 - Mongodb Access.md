Mongodb 3.6.8

After downgrading the mongosh shell on the attacking system, it is possible to access the mongod server.
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Mongod]
└─$ mongosh --host 10.129.61.167 --port 27017                   
Current Mongosh Log ID: 68934ca142a8d8facc5e739b
Connecting to:          mongodb://10.129.61.167:27017/?directConnection=true&appName=mongosh+2.3.0
Using MongoDB:          3.6.8
Using Mongosh:          2.3.0
mongosh 2.5.6 is available for download: https://www.mongodb.com/try/download/shell

For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/


To help improve our products, anonymous usage data is collected and sent to MongoDB periodically (https://www.mongodb.com/legal/privacy-policy).
You can opt-out by running the disableTelemetry() command.

------
   The server generated these startup warnings when booting
   2025-08-06T12:12:08.530+0000: 
   2025-08-06T12:12:08.530+0000: ** WARNING: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine
   2025-08-06T12:12:08.530+0000: **          See http://dochub.mongodb.org/core/prodnotes-filesystem
   2025-08-06T12:12:10.664+0000: 
   2025-08-06T12:12:10.664+0000: ** WARNING: Access control is not enabled for the database.
   2025-08-06T12:12:10.665+0000: **          Read and write access to data and configuration is unrestricted.
   2025-08-06T12:12:10.665+0000:
------

test> 
```

Enumerating the database
```
test> show dbs
admin                  32.00 KiB
config                 72.00 KiB
local                  72.00 KiB
sensitive_information  32.00 KiB
users                  32.00 KiB

```