# Contents

This wallet contains:

* Electrum
* Electrum-ltc
* Armory
* MEW 
* Monero GUI
* Libreoffice
* Geany
* qrencode
* zbar-tools
* haveged
* rng-tools
* Software provided by [Slackware Linux Distribution](http://www.slackware.com/)

Requires 32 GB on a usb stick and boots both on UEFI machines and Legacy BIOS
machines. 

It needs a usb stick of 32GB and another usb stick of any size with vfat
filesystem.

## Files 

[img](https://mega.nz/#!31dQBCwS!uZ8CGXPv1ljHJSKCGogIpUe2ZqG3HAzJfYpQlC-XKIo)

[hashes](https://mega.nz/#!60VyEYBL!Q431y6a_2WpFQ6_a2jDwZlGLjR_gNq_VgcSu3yZrilo)

## Burn img

Plug an empty 32GB USB stick with at least 31482445824 bytes of capacity.

`# gunzip -c wallet_empty_30Sep2018.img.gz | dd of=/dev/sdX status=progress`

Where `/dev/sdX` it's the your USB stick.

## Resize encrypted partition 

If you have a large device with more than 31482445824 bytes of capacity, after
you burned the img, it's possible to reclaim the remaining free space.

You need to boot from a other Linux distro, a live CD or live USB.

```
# cryptsetup luksOpen /dev/sdX4 slackluks

# fdisk -l /dev/sdX
```
Get the size on the top, like 200GB

`# parted /dev/sdX`

```
Choose fix

p

resizepart 4 

End? [31.5GB]? 200GB 

q
```
I used 200GB as an example.

```
# cryptsetup resize slackluks

# vgchange -a y cryptvg

# pvresize /dev/mapper/slackluks

# lvresize -l+100%FREE /dev/mapper/cryptvg-root.

# e2fsck -f /dev/mapper/cryptvg-root

# resize2fs /dev/mapper/cryptvg-root
```

# Usage 

Can be used as cold storage signer or as PGP key system with revoke
certifications as [described](https://github.com/bitcoinoplomo/crypto/blob/master/0_PGP.md)

In there is also possible to find how to blacklist the network adapter kernel
modules. 

This usb stick should be always used without a Ethernet cable connected or wifi
configured. On a laptop the battery should be removed and the power cable
disconnect at least one minute before booting.

More info about PGP keys with revoke certificate in
[here](https://github.com/bitcoinoplomo/articles/blob/master/misc/PGP_anatomy.md)
and [here](https://github.com/bitcoinoplomo/articles/blob/master/misc/PGP2.md)


# Setup 

The password of the usb stick is on txt provided with also the root and wallet
user password. The checksum is also available and signed with my [PGP key](https://github.com/bitcoinoplomo/crypto/tree/master/pubkeys)

The first thing to do is to change the password of the usb stick. Help can be
find in
[here](https://unix.stackexchange.com/questions/252672/how-do-i-change-a-luks-password)

The encrypted partition is the forth of the usb stick. So if in your system
the usb stick is /dev/sdb the commands required are

```
# cryptsetup luksDump /dev/sdb4
```

In my system it shows that the slot with password is the slot 0, so to change it

```
# cryptsetup luksChangeKey /dev/sdb4 -S 0
```

First insert the current password that I provide and then setup your won.

Reboot the machine and boot from the usb stick.

In second you should change the root and user wallet password like this.

Change password of root user
```
# passwd 
```

Change password of wallet user
```
# passwd wallet
```

Third, blacklist your network adapter kernel modules like described in
[here](https://github.com/bitcoinoplomo/crypto/blob/master/0_PGP.md)

Finally hide any partitions entries besides the ones used by the usb stick to not open
them by mistake, editing  `/etc/fstab/`.

There are already a couple of them hidden on `/etc/fstab`. So you should only
edit the file and add new ones or modify the existing ones. Because those UUID
are from my system.

To find your partitions UUID just run the following

```
# ls -lF ls -lF /dev/disk/by-uuid/
```
To restrict the output to /dev/sda for exemple just do

```
# ls -lF ls -lF /dev/disk/by-uuid/ | grep sda
```

To communicate between the signer and the online wallet you sould only use
another usb stick with vfat filesystem. Because in Linux vfat filesystem can't
run executable files.

**!!Warning!!** 

**I will not take any responsibility for coins being lost or hacks!!!** 

**If you don't know what you are doing! Don't risk any coins and just buy a TREZOR
or Ledger wallet and be safe!**

**But if you are interested in learn about cold storage use this usb stick for
small amounts!**

**Always but always write down your seedkeys in a paper like [this](https://github.com/bitcoinoplomo/misc/blob/master/blank_seedkey_12.pdf) and
[this](https://github.com/bitcoinoplomo/misc/blob/master/blank_seedkey_24.pdf).** 

**That is the only way that you can recover your funds!!!**


# Other useful links

https://en.bitcoin.it/wiki/How_to_set_up_a_secure_offline_savings_wallet (see
also section)

https://en.bitcoin.it/wiki/Deterministic_wallet

https://en.bitcoin.it/wiki/Address

https://en.bitcoin.it/wiki/List_of_address_prefixes

https://en.bitcoin.it/wiki/Bech32


## Support my work

![alt text](https://github.com/bitcoinoplomo/crypto/blob/master/static/image/donate1.png "Logo Title Text 1")

37dEqgQC38PFqXusHPyLGEbN23yzhCGPGv

![alt text](https://github.com/bitcoinoplomo/crypto/blob/master/static/image/donate2.png "Logo Title Text 1")

lnurl1dp68gurn8ghj7arfwqhxy6t8wd6kutnc09az7mrww4exctesxgcrqepj89nrscesv56nvd3j89jn2cfhxf3kyvecxqurzc3c8qmnvenpxpnxzdt9vyunqvfc8qurqvehxgmrycfcxqek2vty8yek2epk9acxzunpd4esflug0h

Lighting Tip Box
http://bitcoin0plomo.ddns.net:9115
