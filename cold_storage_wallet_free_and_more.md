# Cold storage

In other articles I already talked about cold storage wallets. Cold storage wallets are the only safe solution that is safe in crypto because your private keys remain offline and the only way to sign transactions is with private keys.

And because there is a physical separation from the internet - disconnect eth cable and wifi networks. No one can grab your private keys from the internet. So you eliminate online threats. 

https://en.bitcoin.it/wiki/Category:Security

https://en.bitcoin.it/wiki/Securing_your_wallet

https://en.bitcoin.it/wiki/Cold_storage

Please follow this guide and read everything. I am not responsible for any lost of funds.

This setup will need two USB memory sticks. One with size > 16GB and other of any size you want.

  * USB memory stick > 16GB
  * USB memory stick of any size
  * One computer e.g: laptop or desktop
  

## Setup

First and connected to the internet you will need to setup an live linux distro.

https://docs.slackware.com/slackware:liveslak

In [here](http://slackware.uk/people/alien-slacklive/) you choose the ISO you and

`$ wget http://slackware.uk/people/alien-slacklive/1.1.9.6/slackware64-live-xfce-current.iso`

And download also files from the bonus folder

`$ wget http://slackware.uk/people/alien-slacklive/bonus/0050-multilib-current-x86_64.sxz`

In the guide there is a few options to create your live linux distro and for that I will need this [script](http://www.slackware.com/~alien/liveslak/iso2usb.sh).

Notice that everything is provided on the [guide](https://docs.slackware.com/slackware:liveslak)

### USB memory stick > 16GB

To transfer the ISO to the USB stick,  it's need  the iso2usb.sh script that it's already downloaded. This script was a few options

```
 -c|--crypt size|perc       Add a LUKS encrypted /home ; parameter is the
                             requested size of the container in kB, MB, GB,
                             or as a percentage of free space.
                             Examples: '-c 125M', '-c 1.3G', '-c 20%'.
  -d|--devices               List removable devices on this computer.
  -f|--force                 Ignore most warnings (except the back-out).
  -h|--help                  This help.
  -i|--infile <filename>     Full path to the ISO image file.
  -o|--outdev <filename>     The device name of your USB drive.
  -p|--persistence <name>    Custom name of the 'persistence' directory/file.
  -r|--refresh               Refresh the USB stick with the ISO content.
                             No formatting, do not touch user content.
  -s|--scan                  Scan for insertion of new USB device instead of
                             providing a devicename (using option '-o').
  -u|--unattended            Do not ask any questions.
  -v|--verbose               Show verbose messages.
  -w|--wait<number>          Add <number> seconds wait time to initialize USB.
  -C|--cryptpersistfile size|perc
                             Use a LUKS-encrypted 'persistence' file instead
                             of a directory (for use on FAT filesystem).
  -P|--persistfile           Use an unencrypted 'persistence' file instead
                             of a directory (for use on FAT filesystem).
```

I choose this options

`$ ./iso2usb.sh -i slackware64-live-xfce-current.iso -o /dev/sdf -c 30% -C 60%`

This transfer the to *slackware64-live-xfce-current.iso*  to the storage device */dev/sdf* and create an [LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) encrypted /home using 30% of the space of the storage device. And also will create a LUKS encrypted file here are stored the changes made to the OS.

### The other USB memory stick

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
```


```
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

And now I check if I really created 

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

Copy the *0050-multilib-current-x86_64.sxz* to it and disconnect the computer from the internet unplugging the cable and shutdown.


## Offline Setup

Now with the machine with the internet cable disconnected you can put the USB memory stick > 16GB and boot.

This is how I run my offline machine

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cold_storage1.jpg "Logo Title Text 1")

I use [rEFInd](http://www.rodsbooks.com/refind/) boot manager the icon selected bellow represents my USB memory stick > 16GB.

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cold_storage2.jpg "Logo Title Text 1")

When you boot the live distro you can change some options like the keyboard layout.

Like you can see in the guide I provided

```
...
Slackware Live Edition knows two user accounts: “root” and “live”. They have passwords, and by default these are… you guessed: “root” and “live”. Also by default, the ISOs will boot into runlevel 4, i.e. you will get a graphical login. The bootloader allows you to pick a non-US language and/or keyboard layout and (on boot of an UEFI system) a custom timezone. 
...
```

Now it's needed to create new users and change the root password.

To change the root password.

```
$ su

# passwd 

# exit
```

To create a new one called *riva*

```
$ su

# useradd -m -s /bin/bash -G audio,cdrom,flopply,plugdev,power,video riva
```

Setup the user *riva* password

`# passwd riva`

And now let's [blacklist]() every network adapters

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

Reboot the machine and login with the new user, in my case it's *riva*!


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
