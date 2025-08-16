Pages
- The landing page redirects to http://10.129.39.125:8080/login?from=%2F
	- decoding the URL, this translates to `login?from=/`

![[Jenkins login page.png]]

### Logging in
Jenkins generates a password when the server is initially created, so there is no default.
Brute-forcing seems like the only way in.

Burpsuite catches this:
`j_username=foo&j_password=bar&from=&Submit=Sign+in`
