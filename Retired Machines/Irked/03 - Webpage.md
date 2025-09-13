http://10.10.10.117/ - Image with a smiley face - 'IRC is almost working!'

## Curl
```
┌──(kali㉿kali)-[~]
└─$ curl 10.10.10.117 
<img src=irked.jpg>
<br>
<b><center>IRC is almost working!</b></center>

┌──(kali㉿kali)-[~]
└─$ curl 10.10.10.117/irked.jpg -o irked.jpg
<SNIP>
                                          
```

## Inspecting the file
```
┌──(kali㉿kali)-[~]
└─$ file irked.jpg                                     
irked.jpg: JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 600x600, components 3
                                                                
┌──(kali㉿kali)-[~]
└─$ strings irked.jpg             
JFIF
$3br
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz
        #3R
&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz
}KE|A
5.<E
<SNIP>
```