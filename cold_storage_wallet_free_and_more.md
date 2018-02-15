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

