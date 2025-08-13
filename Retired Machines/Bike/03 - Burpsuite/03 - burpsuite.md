![[bikeBurp01.png]]
\

![[bikeWeWillContactYou.png]]

# Encoding a payload
Given the payload in the [[04 - XSS Attempts]] note, Burpsuite can be used to URL encode the payload each time a command is changed (whoami, id, etc)
![[BurpEncoding.png]]

Still getting an error:
![[BurpRequireIsNotDefined.png]]

It doesn't like this line of the payload, specifically the `require` call.
- {{this.push "return require('child_process').exec('whoami');"}}

There is a way to see which current [process](https://nodejs.org/api/globals.html)  is running.
In the payload, change
	{{this.push "return require('child_process').exec('whoami');"}}
	to
	{{this.push "return process;"}}

After changing that line and putting the encoded payload through the repeater, a different response happens:
![[BurpReturnProcessPayload.png]]
