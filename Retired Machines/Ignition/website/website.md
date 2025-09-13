# Poking around
![](Ignition/website/landingPage.png)


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
![](Ignition/website/admin_login.png)


Simple admin injection attempt:
![](Ignition/website/admin_injection_attempt.png)


- searching for default passwords
	- [admin 123123](https://magento.stackexchange.com/questions/231135/what-is-the-default-magento-admin-username-and-password)  - nope

Potential password requirements for the admin panel:
- ![](Ignition/website/potential_password_requirements.png)
- 
- https://meetanshi.com/blog/configure-password-options-in-magento-2/
- ![](Ignition/website/magento_password_defaults.png)
- 
- https://www.mgt-commerce.com/tutorial/password-options-for-customers-in-magento-2/
- 
	- minimum password length: 8 characters
	- At least 3 of the following choices:
		- lowercase
		- uppercase
		- digits
		- special characters

### password investigation attempts
#### Based on the error message above, excessive brute forcing through hydra/burp is probably a bad idea.

Collecting some ideas.
Starting off my assuming the username is admin and the password is at lease 8 characters.

Attempting to parse down some existing password lists
```
┌──(kali㉿kali)-[~]
└─$ history | tail                                                                                  
 2016  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/SecLists/Passwords/Common-Credentials/100k-most-used-passwords-NCSC.txt | awk 'length($0) == 8'| grep -i password
 2017  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/SecLists/Passwords/Common-Credentials/xato-net-10-million-passwords-10.txt | awk 'length($0) == 8'| grep -i password
 2018  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/SecLists/Passwords/Common-Credentials/xato-net-10-million-passwords-100000.txt | awk 'length($0) == 8'| grep -i password
 2019  less /usr/share/wordlists/SecLists/Passwords/Common-Credentials/xato-net-10-million-passwords-100000.txt
 2020  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/SecLists/Passwords/Common-Credentials/probable-v2_top-12000.txt | awk 'length($0) == 8'| grep -i password
 2021  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/SecLists/Passwords/Common-Credentials/xato-net-10-million-passwords.txt | awk 'length($0) == 8'| grep -i password
 2022  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/rockyou.txt | awk 'length($0) == 8'
 2023  sed -n '/^[a-z]*[A-Z][a-z]*[0-9][a-z]*$/p' /usr/share/wordlists/rockyou.txt | awk 'length($0) == 8' > rockyou_magneto.txt
 2024  less rockyou_magneto.txt
 2025  wc -l rockyou_magneto.txt

┌──(kali㉿kali)-[~]
└─$ cewl -d 2 -m 6 http://ignition.htb
CeWL 6.2.1 (More Fixes) Robin Wood (robin@digi.ninja) (https://digi.ninja/)
Search
messages
Account
summary
getCartParam
getTemplate
template
browser
customer
Advanced
Newsletter
information
<SNIP>
```

### Attempts w/admin username
- Magento1
- Magento123
- Admin123
- Password1
- Passw0rd!
- Password123
	- Many attempts later, realizing that Magento password recommendations may not have been followed:
		- qwerty123 granted access!