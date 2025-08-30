
## Credentials
- Portal: http://10.129.95.184/login/login.php `admin:thi<SNIP>rd`
- SSH: `john:thi<SNIP>ord`
# user flag
```
john@base:~$ ls -l user.txt && md5sum user.txt 
-rw-r----- 1 root john 33 Mar 10  2020 user.txt
68b7b4224018c4efb9572bc8cd76ebf0  user.txt

```

# root flag
```
# ls -l root.txt && md5sum root.txt
-rw-r----- 1 root root 33 Mar 10  2020 root.txt
478851723fde7dd4490e468f9e3ecbbc  root.txt

```