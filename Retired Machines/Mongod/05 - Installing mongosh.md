To access the mongodb, mongosh is needed.
https://www.mongodb.com/docs/mongodb-shell/install/

```
### Supported MongoDB Versions[](https://www.mongodb.com/docs/mongodb-shell/install/#supported-mongodb-versions "Permalink to this heading")

### [

](https://www.mongodb.com/docs/mongodb-shell/install/#supported-mongodb-versions "Permalink to this heading")

You can use the MongoDB Shell to connect to MongoDB version 4.2 or greater.
```
It appears that a lower version of mongosh will be necessary.

```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Mongod]
└─$ mongosh --host 10.129.61.167 --port 27017        
Current Mongosh Log ID: 68934b5726faed9d6e89b03c
Connecting to:          mongodb://10.129.61.167:27017/?directConnection=true&appName=mongosh+2.5.6                                                        
MongoServerSelectionError: Server at 10.129.61.167:27017 reports maximum wire version 6, but this version of the Node.js Driver requires at least 7 (MongoDB 4.0)

```

#### Attempt to downgrade
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Mongod]
└─$ sudo apt policy mongodb-mongosh
mongodb-mongosh:
  Installed: 2.5.6
  Candidate: 2.5.6
  Version table:
 *** 2.5.6 500
        500 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 Packages
        100 /var/lib/dpkg/status
     2.5.5 500
        500 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 Packages
     2.5.3 500
        500 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 Packages
<SNIP>
     2.3.0 500
        500 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 Packages
     2.2.15 500
        500 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 Packages
     2.2.14 500
        500 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 Packages

┌──(kali㉿kali)-[~/Desktop/HackTheBox/Mongod]
└─$ sudo apt install -y --allow-downgrades mongodb-mongosh=2.3.0
The following packages were automatically installed and are no longer required:
  libpipewire-0.3-modules-xrdp  python3-pyinstaller-hooks-contrib
  pipewire-module-xrdp          python3-wheel-whl
  python3-packaging-whl
Use 'sudo apt autoremove' to remove them.

DOWNGRADING:
  mongodb-mongosh
                                                                             
Summary:
  Upgrading: 0, Installing: 0, Downgrading: 1, Removing: 0, Not Upgrading: 210
  Download size: 53.9 MB
  Freed space: 18.6 MB

Get:1 https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0/multiverse amd64 mongodb-mongosh amd64 2.3.0 [53.9 MB]
Fetched 53.9 MB in 3s (15.9 MB/s)           
dpkg: warning: downgrading mongodb-mongosh (2.5.6) to (2.3.0)
(Reading database ... 431450 files and directories currently installed.)
Preparing to unpack .../mongodb-mongosh_2.3.0_amd64.deb ...
Unpacking mongodb-mongosh (2.3.0) over (2.5.6) ...
Setting up mongodb-mongosh (2.3.0) ...
Processing triggers for man-db (2.13.1-1) ...
Processing triggers for kali-menu (2025.3.0) ...
                                                                                                                                                             
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Mongod]
└─$ mongosh --version
2.3.0


```

