# Poking around
![[Pasted image 20250811173249.png]]

#### Forms
- http://ignition.htb/contact/
- http://ignition.htb/sales/guest/form/
-  http://ignition.htb/customer/account/create/
- http://ignition.htb/customer/account/login
- http://ignition.htb/admin
- http://ignition.htb/admin/admin/auth/forgotpassword/
- http://ignition.htb/catalogsearch/result/?q=foo

The catalog search gives an interesting error message:
```
# There has been an error processing your request

_Exception printing is disabled by default for security reasons._

Error log record number: 292938b2112e61dd93e2e9b47e5277251708d6730b7a15ff26bbcf3422d33eeb
```

http://ignition.htb/admin looks like a good place to start.
![[admin_login.png]]

Simple admin injection attempt:
![[admin_injection_attempt.png]]

- searching for default passwords
	- [admin 123123](https://magento.stackexchange.com/questions/231135/what-is-the-default-magento-admin-username-and-password)  - nope