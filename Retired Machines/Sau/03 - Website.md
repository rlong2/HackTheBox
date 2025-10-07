http://10.10.11.224:55555/web - landing page - create a basket to collect and inspect HTTP requests.

![](Attachments/WebLandingPage.png)

http://10.10.11.224:55555/web/baskets - provide the master toekn and gain access to all the baskets
![](Attachments/Baskets.png)

## Creating a random basket
```
Basket 'rf9vwi3' is successfully created!

Your token is: ==5vrisXrw4Q0jLXNM3ABP5bQSHGZF8xnXcETGtxnKMr2P==
```

http://10.10.11.224:55555/web/rf9vwi3
![](Attachments/EmptyBasket.png)

### sending a get request
```
┌──(kali㉿kali)-[~]
└─$ curl -X GET http://10.10.11.224:55555/rf9vwi3

```

There are lots of interesting settings
![](Attachments/InterestingSettings.png)
