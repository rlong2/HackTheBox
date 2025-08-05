Using redis-cli, the server can be explored
```
┌──(kali㉿kali)-[~]
└─$ redis-cli -h 10.129.136.187 -p 6379
10.129.136.187:6379> help
redis-cli 8.0.0
To get help about Redis commands type:
      "help @<group>" to get a list of commands in <group>
      "help <command>" for help on <command>
      "help <tab>" to get a list of possible help topics
      "quit" to exit

To set redis-cli preferences:
      ":set hints" enable online hints
      ":set nohints" disable online hints
Set your preferences in ~/.redisclirc
```

Listing available keys
```
10.129.136.187:6379> help keys

  KEYS pattern
  summary: Returns all key names that match a pattern.
  since: 1.0.0
  group: generic

10.129.136.187:6379> keys *
1) "flag"
2) "temp"
3) "stor"
4) "numb"

```