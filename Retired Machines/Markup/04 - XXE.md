When accessing the login dashboard and inspecting services.php, this may be vulnerable to XXE injection.
```
### Request
<?xml version = "1.0"?><order><quantity>99</quantity><item>Home Appliances</item><address>123 fake st</address></order>

### Response
Your order for Home Appliances has been processed
```

https://book.hacktricks.wiki/en/pentesting-web/xxe-xee-xml-external-entity.html
