# Cold storage

In other articles I already talked about cold storage wallets! 

Cold storage wallets are the only safe solution in crypto. Because your private keys remain offline and the only way to sign transactions is with private keys.

And because there is a physical separation from the internet - disconnected eth cable and no wifi networks. No one can grab your private keys from the internet. So you eliminate online threats. 

https://en.bitcoin.it/wiki/Category:Security

https://en.bitcoin.it/wiki/Securing_your_wallet

https://en.bitcoin.it/wiki/Cold_storage

Please follow this guide and read everything. I am not responsible for any lost of funds.

This setup will need 

  * USB memory stick of at least 4GB, and in this tutorial I call it the transfer USB.
  * Offline machine: an one computer old computer e.g: laptop or desktop; or a Raspberry Pi 3.

In my case a will use this machine

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cold_storage1.jpg "Logo Title Text 1")

## Setup - Offline machine

### Slackware Linux OS install

I will install Slackware Linux OS

http://www.slackware.com/

http://www.slackware.com/getslack/

And I will use an USB memory stick 4GB instead of a DVD. Because this machine doesn't have any DVD/CD ROM.

https://www.slackwiki.com/Install_Slackware_Using_A_USB_Flash_Drive

After downloaded the ISO for i386 because my hardware is i386, I need to transfer to ISO to the USB memory stick that I will use as install medium.

```
# dd if=slackware-14.2-install-dvd.iso of=/dev/sdf
# sync
```

I will follow this guide and combining LUKS and LVM and will create an encrypted system, where only the /boot is not encrypted. Everything else is encrypted eg: /home, swap and etc...

http://ftp.slackware.com/pub/slackware/slackware-14.1/README_CRYPT.TXT


In this guide the *Broken configuration* sections is very useful. 

https://blog.darknedgy.net/technology/2014/07/27/1/

All the setup and installation will be made with the machine offline! This machine will never be connected to the internet. The only thing going through the offline machine and the online machine is an USB memory stick formatted with vfat file system. This USB memory stick on this tutorial is referred as transfer USB.

The guide provided is very straight forward, so it will not be hard to install the OS. 

But there is a couple a things a did different from the guide.

```
...

* In the chroot, you create an initrd image with LVM and CRYPT support -
or else your Slackware computer will not be able to proceed past the initial
stage of booting the kernel.  The initial ramdisk (initrd) contains a small
filesystem with the tools needed to unlock the root filesystem, so that
the kernel can start the init program.  In the example command line below
which creates the 'initrd.gz' image I assume that you formatted the root
filesystem as 'ext3', and will be running the Slackware 14.0 default SMP
kernel '3.2.29-smp' :

  # mkinitrd -c -k 3.2.29-smp -m ext3 -f ext3 -r /dev/cryptvg/root -C /dev/sdx2 -L
...
```

This part where tells how to create the *initrd.gz* I do it in this way

`# /usr/share/mkinitrd/mkinitrd_command_generator.sh`

This will generate a command and options to generate the *initrd.gz*. But because you need to type everything and you are in terminal it's easier to this.

`# /usr/share/mkinitrd/mkinitrd_command_generator.sh > lilo.sh`

Now edit *lilo.sh* and change the first line to this 

`#!/bin/bash`

You can edit the file using vim

`# vim lilo.sh`

And make it executable and run it.

```
# chmod +x lilo.sh
# ./lilo.sh
```
Follow the rest of the guide!

### Create one user and change boot 

After the first reboot and login as root. Do this to create a new user
```
# useradd -m -s /bin/bash -G audio,cdrom,floppy,plugdev,power,video riva
```
*riva* is the name that I choose for my user. And now create a password for it
`#passwd riva`

To start the system with X11 enabled do this
`# vim /etc/inittab`
And change the run level from 3 to 4 like this

```
...
# Default runlevel. (Do not set to 0 or 6)
id:4:initdefault:
...

```
To be able on the session manager to use your keyboard layou
`# cp -av /usr/share/X11/xorg.conf.d/90-keyboard-layout.conf /etc/X11/xorg.conf.d`
And edit it

```
...
Option "XkbLayout" "pt"
...
```
This will use the Portuguese keyboard layout. Change it to fit your requirements.

### Network 

Now let's [blacklist](https://pragtob.wordpress.com/2012/09/14/permanently-deactivating-a-network-adapter-in-linux/) every network adapters

```
# lspci

...
0e:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
```

To find what kernel module belongs to this device

```
# find /sys | grep drivers.*0e:00
/sys/bus/pci/drivers/r8169/0000:0e:00.0
```

To unload and blacklist this kernel module.

```
# lsmod | grep r8169

# modprobe -r r8169

# vim /etc/modprobe.d/blacklist.conf 
```
Add this line 

`blacklist r8169`

My ethernet controller is blacklisted but my laptop also was an wifi network adapter. Type *ifconfig -a* to see them.

Using the some method I blacklisted the wifi network adapter kernel module. But before removing and blacklist it I check if I didn't mess up finding the kernel module.

`# lsmod | grep ath9k`

Only after I did 

```
# modprobe -r ath9k

# ifconfig -a 
```
And add the line *blacklist ath9k* on */etc/modprobe.d/blacklist.conf*

Reboot the machine and login again!

### Dependencies

And now you need to download the following dependencies

  * libxkbcommon
  * libwacom
  * libinput 
  * qt5
  * qt5-webkit
  * python3
  * python3-sip
  * python3-PyQt5 
  
From [here](http://www.slackware.com/~alien/slackbuilds/) and [here](https://slackware.pkgs.org/14.2/slackonly-x86_64/).

```
$ mkdir packages 
$ cd packages
$ wget http://www.slackware.com/~alien/slackbuilds/libxkbcommon/pkg64/current/libxkbcommon-0.8.0-x86_64-1alien.txz
$ wget http://www.slackware.com/~alien/slackbuilds/libwacom/pkg64/14.2/libwacom-0.22-x86_64-1alien.txz
$ wget http://www.slackware.com/~alien/slackbuilds/libinput/pkg64/14.2/libinput-1.5.4-x86_64-1alien.txz
$ wget http://www.slackware.com/~alien/slackbuilds/qt5/pkg64/current/qt5-5.9.4-x86_64-1alien.txz
$ wget http://www.slackware.com/~alien/slackbuilds/qt5-webkit/pkg64/current/qt5-webkit-5.9.1-x86_64-2alien.txz
$ wget https://mirrors.slackware.com/slackware/slackware64-current/slackware64/a/patch-2.7.6-x86_64-1.txz
$ wget https://packages.slackonly.com/pub/packages/14.2-x86_64/python/python3/python3-3.6.4-x86_64-1_slonly.txz
$ wget https://packages.slackonly.com/pub/packages/14.1-x86_64/python/python3-sip/python3-sip-4.17-x86_64-1_slack.txz
$ wget https://packages.slackonly.com/pub/packages/14.2-x86_64/libraries/python3-PyQt5/python3-PyQt5-5.9.2-x86_64-1_slonly.txz
```
Put all this packages on transfer USB and transfer it to the offline machine.

Install all the files in *packages* folder using *installpkg *.txz *tgz* 


## Misc

### transfer USB

Connect to USB memory stick to your online machine and see where it is.

`# fdisk -l`

This is my output 
```
Disk /dev/sdf: 3.7 GiB, 3909091328 bytes, 7634944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x7bd3b908

Device     Boot Start     End Sectors  Size Id Type
/dev/sdf1        2048 7634943 7632896  3.7G  b W95 FAT32

```
I am using a 4GB USB memory stick and it's on */dev/sdf* and it has a vfat partition on */dev/sdf1**

**This USB memory sticks was always to be on vfat format because in linux in vfat file system, there is no executable files. And this way you can prevent key loggers and other spying software from running**

I will setup this USB stick as a new one. And for that I will destroy it's MBR.

`# dd if=/dev/zero of=/dev/sdf bs=512 count=1`

And now 

```
# fdisk -l

...

Disk /dev/sdf: 3.7 GiB, 3909091328 bytes, 7634944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

# fdisk /dev/sdf

Welcome to fdisk (util-linux 2.27.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x198c942d.

Command (m for help): p
Disk /dev/sdf: 3.7 GiB, 3909091328 bytes, 7634944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x198c942d

Command (m for help): p
Disk /dev/sdf: 3.7 GiB, 3909091328 bytes, 7634944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x198c942d

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 
First sector (2048-7634943, default 2048): 
Last sector, +sectors or +size{K,M,G,T,P} (2048-7634943, default 7634943): 

Created a new partition 1 of type 'Linux' and of size 3.7 GiB.

Command (m for help): t
Selected partition 1
Partition type (type L to list all types): l

 0  Empty           24  NEC DOS         81  Minix / old Lin bf  Solaris        
 1  FAT12           27  Hidden NTFS Win 82  Linux swap      c1  DRDOS/sec (FAT-
 2  XENIX root      39  Plan 9          83  Linux           c4  DRDOS/sec (FAT-
 3  XENIX usr       3c  PartitionMagic  84  OS/2 hidden or  c6  DRDOS/sec (FAT-
 4  FAT16 <32M      40  Venix 80286     85  Linux extended  c7  Syrinx         
 5  Extended        41  PPC PReP Boot   86  NTFS volume set da  Non-FS data    
 6  FAT16           42  SFS             87  NTFS volume set db  CP/M / CTOS / .
 7  HPFS/NTFS/exFAT 4d  QNX4.x          88  Linux plaintext de  Dell Utility   
 8  AIX             4e  QNX4.x 2nd part 8e  Linux LVM       df  BootIt         
 9  AIX bootable    4f  QNX4.x 3rd part 93  Amoeba          e1  DOS access     
 a  OS/2 Boot Manag 50  OnTrack DM      94  Amoeba BBT      e3  DOS R/O        
 b  W95 FAT32       51  OnTrack DM6 Aux 9f  BSD/OS          e4  SpeedStor      
 c  W95 FAT32 (LBA) 52  CP/M            a0  IBM Thinkpad hi ea  Rufus alignment
 e  W95 FAT16 (LBA) 53  OnTrack DM6 Aux a5  FreeBSD         eb  BeOS fs        
 f  W95 Ext'd (LBA) 54  OnTrackDM6      a6  OpenBSD         ee  GPT            
10  OPUS            55  EZ-Drive        a7  NeXTSTEP        ef  EFI (FAT-12/16/
11  Hidden FAT12    56  Golden Bow      a8  Darwin UFS      f0  Linux/PA-RISC b
12  Compaq diagnost 5c  Priam Edisk     a9  NetBSD          f1  SpeedStor      
14  Hidden FAT16 <3 61  SpeedStor       ab  Darwin boot     f4  SpeedStor      
16  Hidden FAT16    63  GNU HURD or Sys af  HFS / HFS+      f2  DOS secondary  
17  Hidden HPFS/NTF 64  Novell Netware  b7  BSDI fs         fb  VMware VMFS    
18  AST SmartSleep  65  Novell Netware  b8  BSDI swap       fc  VMware VMKCORE 
1b  Hidden W95 FAT3 70  DiskSecure Mult bb  Boot Wizard hid fd  Linux raid auto
1c  Hidden W95 FAT3 75  PC/IX           bc  Acronis FAT32 L fe  LANstep        
1e  Hidden W95 FAT1 80  Old Minix       be  Solaris boot    ff  BBT            
Partition type (type L to list all types): 0b
Changed type of partition 'Linux' to 'W95 FAT32'.

Command (m for help): p
Disk /dev/sdf: 3.7 GiB, 3909091328 bytes, 7634944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x198c942d

Device     Boot Start     End Sectors  Size Id Type
/dev/sdf1        2048 7634943 7632896  3.7G  b W95 FAT32
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```
And now I check if I really created it.
```
# fdisk -l

...
Disk /dev/sdf: 3.7 GiB, 3909091328 bytes, 7634944 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x198c942d

Device     Boot Start     End Sectors  Size Id Type
/dev/sdf1        2048 7634943 7632896  3.7G  b W95 FAT32
```
And now I need to format it.
```
# mkfs.vfat /dev/sdf1
mkfs.fat 3.0.28 (2015-05-16)
```

## Wallets

### Electrum and Electrum-ltc - SPV Wallets

In the transfer USB create a folder called wallets.

```
$ mkdir wallets
$ cd wallets
$ wget https://download.electrum.org/3.0.6/Electrum-3.0.6.tar.gz 
$ wget https://download.electrum.org/3.0.6/Electrum-3.0.6.tar.gz.asc
$ wget https://electrum-ltc.org/download/Electrum-LTC-3.0.6.2.tar.gz
$ wget https://electrum-ltc.org/download/Electrum-LTC-3.0.6.2.tar.gz.DIGESTS.txt
$ wget https://electrum-ltc.org/download/Electrum-LTC-3.0.6.2.tar.gz.asc
```

Now I need to check the integrity and authenticity of this wallets. I already made a few articles about PGP

https://github.com/InserirAquiNome/crypto/blob/master/PGP.md

https://github.com/InserirAquiNome/crypto/blob/master/electrum_wallet_verify_authenticity.md

Verify the integrity and authenticity.

 * Online 
   
   In the git repo of electrum 
   
   https://github.com/spesmilo/electrum
  
   Go to the *pubkeys* folder and download the key from ThomasV
   
   `$ wget https://raw.githubusercontent.com/spesmilo/electrum/master/pubkeys/ThomasV.asc`
   
   Now lets see the unique ID from this key on the [keyserver](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x2BD5824B7F9470E6)
  
   ```
   $ gpg --search-keys 7F9470E6 
   gpg: searching for "7F9470E6" from hkp server keys.gnupg.net
   (1)     ThomasV <thomasv1@gmx.de>
           Thomas Voegtlin <thomasv1@gmx.de>
           Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>
           4096 bit RSA key 7F9470E6, created: 2011-06-15
   Keys 1-1 of 1 for "7F9470E6".  Enter number(s), N)ext, or Q)uit > 1
   gpg: requesting key 7F9470E6 from hkp server keys.gnupg.net
   gpg: key 7F9470E6: "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>" not changed
   gpg: Total number processed: 1
   gpg:              unchanged: 1
   ```
  
   And see the unique ID from the key downloaded from the git repo.
   
   ```
   $ gpg ThomasV.asc           
   pub  4096R/7F9470E6 2011-06-15 ThomasV <thomasv1@gmx.de>
   sub  4096R/2021CD84 2011-06-15
   pub  2048R/695506FD 2013-01-15 Animazing <animazing@gmail.com>
   sub  2048R/F607BDEC 2013-01-15
   ``` 

   ```
   $ gpg --list-keys --fingerprint 7F9470E6
   pub   4096R/7F9470E6 2011-06-15
         Key fingerprint = 6694 D8DE 7BE8 EE56 31BE  D950 2BD5 824B 7F94 70E6
   uid                  Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>
   uid                  ThomasV <thomasv1@gmx.de>
   uid                  Thomas Voegtlin <thomasv1@gmx.de>
   sub   4096R/2021CD84 2011-06-15
   ```

   They have the same unique ID and also now the fingerprint. It's recommend to print this fingerprint to compare with offline machine.
 
   To electrum-ltc in git repo https://github.com/pooler/electrum-ltc/ check the folder *pubkeys*
 
   `$ wget https://raw.githubusercontent.com/pooler/electrum-ltc/master/pubkeys/pooler.asc` 
 
 
   ```
   $ gpg pooler.asc 
   pub  2048R/F1BE8FEA 2013-07-21 pooler <pooler@litecoinpool.org> 
   sub  2048R/A31415A6 2013-07-21
   ``` 
   [keyserver](http://pgp.mit.edu/pks/lookup?op=vindex&search=0x6FC4C9F7F1BE8FEA)
 
   ```
   $ gpg --search-keys F1BE8FEA 
   gpg: searching for "F1BE8FEA" from hkp server keys.gnupg.net
   (1)     pooler <pooler@litecoinpool.org>
          2048 bit RSA key F1BE8FEA, created: 2013-07-21
   Keys 1-1 of 1 for "F1BE8FEA".  Enter number(s), N)ext, or Q)uit > 1
   gpg: requesting key F1BE8FEA from hkp server keys.gnupg.net
   gpg: key F1BE8FEA: "pooler <pooler@litecoinpool.org>" not changed
   gpg: Total number processed: 1
   gpg:              unchanged: 1
   ```

   ```
   $ gpg --list-keys --fingerprint F1BE8FEA
   pub   2048R/F1BE8FEA 2013-07-21
         Key fingerprint = CAE1 092A D355 3FFD 21C0  5DE3 6FC4 C9F7 F1BE 8FEA
   uid                  pooler <pooler@litecoinpool.org>
   sub   2048R/A31415A6 2013-07-21
   ```
   
   I also recommend to print this fingerprint.
 
   Copy all this files to transfer USB.
 
 * Offline machine 

  `$ gpg --gen-key`
  
  `$ gpg --import ThomasV.asc `
  
  `$ gpg --fingerprint 7F9470E6`
  
   And now compare it to fingerprint that was printed on the online machine. If both match then sign it.
   
   `$ gpg --sign-key 7F9470E6`
   
   Now it's possible to verify the file authenticity.
   
   `$ gpg --verify Electrum-3.0.6.tar.gz.asc`
  
  Do the same for Electrum-ltc.


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
