# nmap
### nmap scan 1: quick, all ports 
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -Pn -p- --open 10.129.166.187
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-10 09:05 MDT
Nmap scan report for 10.129.166.187
Host is up (0.045s latency).
Not shown: 63834 closed tcp ports (reset), 1699 filtered tcp ports (no-response)
Some closed ports may be reported as filtered due to --defeat-rst-ratelimit
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 21.53 seconds              
```

### nmap scan 2: service version
It's coming up as filtered, which doesn't seem right.
The box notes say to wait ~2 minutes after starting the machine for services to come up, but it's been ~10 minutes.
```
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -Pn -p 22,80 10.129.166.187
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-10 09:06 MDT
Nmap scan report for 10.129.166.187
Host is up.

PORT   STATE    SERVICE VERSION
22/tcp filtered ssh
80/tcp filtered http

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 8.22 seconds


#### rescanning...
┌──(kali㉿kali)-[~]
└─$ nmap -T4 -sV -sC -Pn -p 22,80 10.129.166.187
Starting Nmap 7.95 ( https://nmap.org ) at 2025-08-10 09:09 MDT
Nmap scan report for 10.129.166.187
Host is up (0.047s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.7 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 17:8b:d4:25:45:2a:20:b8:79:f8:e2:58:d7:8e:79:f4 (RSA)
|   256 e6:0f:1a:f6:32:8a:40:ef:2d:a7:3b:22:d1:c7:14:fa (ECDSA)
|_  256 2d:e1:87:41:75:f3:91:54:41:16:b7:2b:80:c6:8f:05 (ED25519)
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
|_http-title: The Toppers
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 9.44 seconds


```

# Gobuster
### gobuster, common
Getting lots of timeout errors.....
```
┌──(kali㉿kali)-[~]
└─$ gobuster dir -u http://thetoppers.htb -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -x html
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://thetoppers.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.6
[+] Extensions:              html
[+] Timeout:                 10s
===============================================================
Starting gobuster in directory enumeration mode
===============================================================
/.htaccess            (Status: 403) [Size: 279]
/.hta.html            (Status: 403) [Size: 279]
/.htpasswd            (Status: 403) [Size: 279]
/.hta                 (Status: 403) [Size: 279]
/.htaccess.html       (Status: 403) [Size: 279]
/.htpasswd.html       (Status: 403) [Size: 279]
Progress: 3702 / 9500 (38.97%)[ERROR] Get "http://thetoppers.htb/football": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
[ERROR] Get "http://thetoppers.htb/football.html": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
<SNIP>
[ERROR] Get "http://thetoppers.htb/fs.html": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
/images               (Status: 301) [Size: 317] [--> http://thetoppers.htb/images/]                                                                       
/index.php            (Status: 200) [Size: 11952]
/server-status        (Status: 403) [Size: 279]
Progress: 9500 / 9500 (100.00%)

```

## Gobuster subdirectories
Still getting timeouts, but found subdomains for s3
```
┌──(kali㉿kali)-[~]
└─$ gobuster vhost -u http://thetoppers.htb --append-domain -w /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://thetoppers.htb
[+] Method:          GET
[+] Threads:         10
[+] Wordlist:        /usr/share/wordlists/SecLists/Discovery/DNS/subdomains-top1million-5000.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: s3.thetoppers.htb Status: 404 [Size: 21]
Found: gc._msdcs.thetoppers.htb Status: 400 [Size: 306]
Progress: 4658 / 4990 (93.35%)[ERROR] Get "http://thetoppers.htb/": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
[ERROR] Get "http://thetoppers.htb/": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
<SNIP>
[ERROR] Get "http://thetoppers.htb/": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
Progress: 4989 / 4990 (99.98%)
===============================================================
Finished
===============================================================

```

# Exif data
Attempting to get exif data from an image
```
┌──(kali㉿kali)-[~]
└─$ exiftool ~/Desktop/HackTheBox/Retired\ Machines/Three/Webpage/band.jpg 
ExifTool Version Number         : 13.25
File Name                       : band.jpg
Directory                       : /home/kali/Desktop/HackTheBox/Retired Machines/Three/Webpage
File Size                       : 90 kB
File Modification Date/Time     : 2025:08:10 09:27:05-06:00
File Access Date/Time           : 2025:08:10 09:27:05-06:00
File Inode Change Date/Time     : 2025:08:10 09:27:05-06:00
File Permissions                : -rw-rw-r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
JFIF Version                    : 1.01
Resolution Unit                 : inches
X Resolution                    : 300
Y Resolution                    : 300
Exif Byte Order                 : Little-endian (Intel, II)
Image Description               : Rock Band with Guitarists and Drummer Performing at a Concert in a Night Club. Front Row Crowd is Partying. Silhouettes of Fans Raise Hands in Front of Bright Colorful Strobing Lights on Stage.
Orientation                     : Horizontal (normal)
Asset ID                        : 1329876201
Web Statement                   : https://www.istockphoto.com/legal/license-agreement?utm_medium=organic&utm_source=google&utm_campaign=iptcurl
Creator                         : gorodenkoff
Description                     : Rock Band with Guitarists and Drummer Performing at a Concert in a Night Club. Front Row Crowd is Partying. Silhouettes of Fans Raise Hands in Front of Bright Colorful Strobing Lights on Stage.
Licensor URL                    : https://www.istockphoto.com/photo/license-gm1329876201-?utm_medium=organic&utm_source=google&utm_campaign=iptcurl
Profile CMM Type                : Linotronic
Profile Version                 : 2.1.0
Profile Class                   : Display Device Profile
Color Space Data                : RGB
Profile Connection Space        : XYZ
Profile Date Time               : 1998:02:09 06:49:00
Profile File Signature          : acsp
Primary Platform                : Microsoft Corporation
CMM Flags                       : Not Embedded, Independent
Device Manufacturer             : Hewlett-Packard
Device Model                    : sRGB
Device Attributes               : Reflective, Glossy, Positive, Color
Rendering Intent                : Perceptual
Connection Space Illuminant     : 0.9642 1 0.82491
Profile Creator                 : Hewlett-Packard
Profile ID                      : 0
Profile Copyright               : Copyright (c) 1998 Hewlett-Packard Company
Profile Description             : sRGB IEC61966-2.1
Media White Point               : 0.95045 1 1.08905
Media Black Point               : 0 0 0
Red Matrix Column               : 0.43607 0.22249 0.01392
Green Matrix Column             : 0.38515 0.71687 0.09708
Blue Matrix Column              : 0.14307 0.06061 0.7141
Device Mfg Desc                 : IEC http://www.iec.ch
Device Model Desc               : IEC 61966-2.1 Default RGB colour space - sRGB
Viewing Cond Desc               : Reference Viewing Condition in IEC61966-2.1
Viewing Cond Illuminant         : 19.6445 20.3718 16.8089
Viewing Cond Surround           : 3.92889 4.07439 3.36179
Viewing Cond Illuminant Type    : D50
Luminance                       : 76.03647 80 87.12462
Measurement Observer            : CIE 1931
Measurement Backing             : 0 0 0
Measurement Geometry            : Unknown
Measurement Flare               : 0.999%
Measurement Illuminant          : D65
Technology                      : Cathode Ray Tube Display
Red Tone Reproduction Curve     : (Binary data 2060 bytes, use -b option to extract)
Green Tone Reproduction Curve   : (Binary data 2060 bytes, use -b option to extract)
Blue Tone Reproduction Curve    : (Binary data 2060 bytes, use -b option to extract)
Current IPTC Digest             : 729edd01336be9d6a68ff04f10b596fa
By-line                         : gorodenkoff
Caption-Abstract                : Rock Band with Guitarists and Drummer Performing at a Concert in a Night Club. Front Row Crowd is Partying. Silhouettes of Fans Raise Hands in Front of Bright Colorful Strobing Lights on Stage.
Credit                          : Getty Images/iStockphoto
Image Width                     : 553
Image Height                    : 311
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:4:4 (1 1)
Image Size                      : 553x311
Megapixels                      : 0.172

```

# Potential ssh username enumeration
```
┌──(kali㉿kali)-[~]
└─$ searchsploit ssh 7.6p1                         
------------------------------------------- ---------------------------------
 Exploit Title                             |  Path
------------------------------------------- ---------------------------------
OpenSSH 2.3 < 7.7 - Username Enumeration   | linux/remote/45233.py
OpenSSH 2.3 < 7.7 - Username Enumeration ( | linux/remote/45210.py
OpenSSH < 7.7 - User Enumeration (2)       | linux/remote/45939.py
------------------------------------------- ---------------------------------
Shellcodes: No Results


```