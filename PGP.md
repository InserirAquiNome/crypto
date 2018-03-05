# PGP & SHA256SUM 

When downloading files from the internet is needed to check their integrity and authenticity. 
  
## Integrity check

A file downloaded from the internet could be different from the original one. In
this way is needed to compare the file downloaded and the original one.

For this you will use sha256sum to generate the SHA256 sum of the downloaded
file and compare to the SHA256 sum of the original one, available on the website
where you download it.


```bash
$ cat SHA256SUMS.asc 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

d64d2e27cad78bbd2a0268bdaa9efa3f1eca670a4fab462b5e851699c780e3a0  bitcoin-0.15.1-aarch64-linux-gnu.tar.gz
ceba092c9a390082ff184c8d82a24bc34d7f9b421dc5c1e6847fcf769541f305  bitcoin-0.15.1-arm-linux-gnueabihf.tar.gz
231e4c9f5cf4ba977dbaf118bf38b0fde4d50ab7b9efd65bee6647fb14035a2c  bitcoin-0.15.1-i686-pc-linux-gnu.tar.gz
b6771c5d67fb6b9c4882cc351e579470a008211d76407155e544b28b00fcd711  bitcoin-0.15.1-osx64.tar.gz
0ce5ca1ba424603526d8a40d9321f1f735797a7205a7fbbe39561c078f2a0858  bitcoin-0.15.1-osx.dmg
34de2dbe058c1f8b6464494468ebe2ff0422614203d292da1c6458d6f87342b4  bitcoin-0.15.1.tar.gz
cc7a31d8fece1462955bddef87945420721e42cfe6af589a36547b0940851765  bitcoin-0.15.1-win32-setup.exe
4d2ad1371df1904367955d3f250212d0edd9f338c26d5cd60d7d8ce3f1733f5a  bitcoin-0.15.1-win32.zip
905a5999fb52b083d7e3bedb2dc6704ca641823f81865db58a55a6a20b454d8c  bitcoin-0.15.1-win64-setup.exe
b858521496c0d7699a6916c20767cdb123eb39be70ffc544d6876b08af3b696a  bitcoin-0.15.1-win64.zip
387c2e12c67250892b0814f26a5a38f837ca8ab68c86af517f975a2a2710225b  bitcoin-0.15.1-x86_64-linux-gnu.tar.gz
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJaBwCWAAoJEJDIAZ42wulkUREQAIBqO799fgiPJG+Nwvd7zNrN
cxRBw5aZOV70nZb0uhhaRwJm1roIMYGcZwdwSdumg0fH0772fbvReqwd6dq8aDme
RqPZPGy2PnDl5DFvD3I66jKFnxDv+5JYhR16Rx5KS7SPH/X1HbnZkiI020pRZtRV
x5P75K466/PJl17c6ESNBghKLup71ZvsfKgTDRng81IGvb0P7RMWRiHlhD47LkoS
lPcprP/abikboXhaYSwBK7JEp5tiKbtACZTdzVT91xy4kDUoyNdR6c6SylD+81xl
xjDBrW33pVf1XseQOao1JQ2J6G2WwtOyiFupf0xadi8BvsNcT7jlHW2+QfHJuQDu
4qdcEWAJNVSpEii8s2EewVqr1ZJl6n+wGZd615cLBTvx59qyhKrfui9ddA6n9r+d
njseBiOf7Azk+kygJQGG/LuLr8yM3IJd4epiK7jeDfCNkYkck+2jInQLwteTCWVD
1DmG0mgGVVZ7NvEyK4AvR0djk2+a6948Alog4SDN9KNjC7KTuznlKr77yPntKjXc
NIcHTx0oLCS4l86sfAd6hprJlC9/HJ1EH1c/EYICvq1zmrTzhEu7MHZT2THsPHE/
V9wfYwqfIwU3BUyYQJCQrNsqfGix67tf27E+A8PiNWDtTXj46WLtJHUgcJleYzze
mN90rQS7PO1XX3//5nKh
=6mwW
-----END PGP SIGNATURE-----
```

The SHA256SUMS.asc is a file downloaded from https://bitcoin.org/bin/ and it
holds the SHA256 sum of every bitcoin 0.15.1 and also their PGP signature. 


In my case because I am a Linux user I will use

`387c2e12c67250892b0814f26a5a38f837ca8ab68c86af517f975a2a2710225b  bitcoin-0.15.1-x86_64-linux-gnu.tar.gz`

Now I need to generate my SHA256 sum of my downloaded file and compare it with
above

```bash
$ sha256sum bitcoin-0.15.1-x86_64-linux-gnu.tar.gz 
387c2e12c67250892b0814f26a5a38f837ca8ab68c86af517f975a2a2710225b  bitcoin-0.15.1-x86_64-linux-gnu.tar.gz
```
I can see that they are identical! So the file integrity is checked and it's
correct.

Now when you have a txt file with the SHA256 sum and the name of the file on it,
in this format:

```bash
$ cat bitcoin-0.15.1-x86_64-linux-gnu.tar.gz.sha256sum                                                
387c2e12c67250892b0814f26a5a38f837ca8ab68c86af517f975a2a2710225b  bitcoin-0.15.1-x86_64-linux-gnu.tar.gz
```
 
I can do this:

```bash
$ sha256sum -c bitcoin-0.15.1-x86_64-linux-gnu.tar.gz.sha256sum 
bitcoin-0.15.1-x86_64-linux-gnu.tar.gz: OK
```
It automatically checks the SHA256 sum on that txt file with the SHA256 of the
file. Of course the file was to be on the current directory.

When you get from the website something like 

```bash
$ cat SHA256SUMS.asc 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

d64d2e27cad78bbd2a0268bdaa9efa3f1eca670a4fab462b5e851699c780e3a0  bitcoin-0.15.1-aarch64-linux-gnu.tar.gz
ceba092c9a390082ff184c8d82a24bc34d7f9b421dc5c1e6847fcf769541f305  bitcoin-0.15.1-arm-linux-gnueabihf.tar.gz
231e4c9f5cf4ba977dbaf118bf38b0fde4d50ab7b9efd65bee6647fb14035a2c  bitcoin-0.15.1-i686-pc-linux-gnu.tar.gz
b6771c5d67fb6b9c4882cc351e579470a008211d76407155e544b28b00fcd711  bitcoin-0.15.1-osx64.tar.gz
0ce5ca1ba424603526d8a40d9321f1f735797a7205a7fbbe39561c078f2a0858  bitcoin-0.15.1-osx.dmg
34de2dbe058c1f8b6464494468ebe2ff0422614203d292da1c6458d6f87342b4  bitcoin-0.15.1.tar.gz
cc7a31d8fece1462955bddef87945420721e42cfe6af589a36547b0940851765  bitcoin-0.15.1-win32-setup.exe
4d2ad1371df1904367955d3f250212d0edd9f338c26d5cd60d7d8ce3f1733f5a  bitcoin-0.15.1-win32.zip
905a5999fb52b083d7e3bedb2dc6704ca641823f81865db58a55a6a20b454d8c  bitcoin-0.15.1-win64-setup.exe
b858521496c0d7699a6916c20767cdb123eb39be70ffc544d6876b08af3b696a  bitcoin-0.15.1-win64.zip
387c2e12c67250892b0814f26a5a38f837ca8ab68c86af517f975a2a2710225b  bitcoin-0.15.1-x86_64-linux-gnu.tar.gz
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJaBwCWAAoJEJDIAZ42wulkUREQAIBqO799fgiPJG+Nwvd7zNrN
cxRBw5aZOV70nZb0uhhaRwJm1roIMYGcZwdwSdumg0fH0772fbvReqwd6dq8aDme
RqPZPGy2PnDl5DFvD3I66jKFnxDv+5JYhR16Rx5KS7SPH/X1HbnZkiI020pRZtRV
x5P75K466/PJl17c6ESNBghKLup71ZvsfKgTDRng81IGvb0P7RMWRiHlhD47LkoS
lPcprP/abikboXhaYSwBK7JEp5tiKbtACZTdzVT91xy4kDUoyNdR6c6SylD+81xl
xjDBrW33pVf1XseQOao1JQ2J6G2WwtOyiFupf0xadi8BvsNcT7jlHW2+QfHJuQDu
4qdcEWAJNVSpEii8s2EewVqr1ZJl6n+wGZd615cLBTvx59qyhKrfui9ddA6n9r+d
njseBiOf7Azk+kygJQGG/LuLr8yM3IJd4epiK7jeDfCNkYkck+2jInQLwteTCWVD
1DmG0mgGVVZ7NvEyK4AvR0djk2+a6948Alog4SDN9KNjC7KTuznlKr77yPntKjXc
NIcHTx0oLCS4l86sfAd6hprJlC9/HJ1EH1c/EYICvq1zmrTzhEu7MHZT2THsPHE/
V9wfYwqfIwU3BUyYQJCQrNsqfGix67tf27E+A8PiNWDtTXj46WLtJHUgcJleYzze
mN90rQS7PO1XX3//5nKh
=6mwW
-----END PGP SIGNATURE-----
```

You need to do 

```
$ sha256sum --ignore-missing -c SHA256SUMS.asc 
bitcoin-0.15.1-x86_64-linux-gnu.tar.gz: OK
sha256sum: WARNING: 20 lines are improperly formatted
```

## Authenticity check

**This tutorial is based on this work** http://www.mattnworb.com/post/how-to-verify-a-pgp-signature-with-gnupg/


If you already have GnuPG or another PGP client installed, skip steps 1 and 2.
 
1. Install GnuPG on your linux distro.

2. Create your private key with

   `$ gpg --gen-key`
  
   Accept all of the default options.
   
   Most likely will receive an warning like this
   
   ```bash
   We need to generate a lot of random bytes. It is a good idea to perform
   some other action (type on the keyboard, move the mouse, utilize the
   disks) during the prime generation; this gives the random number
   generator a better chance to gain enough entropy.

   Not enough random bytes available.  Please do some other work to give
   the OS a chance to collect more entropy! (Need 91 more bytes)

   ```
   If the process stops because there is not enough entropy, just do this
   
   `$ ls -R /`
   
   This will increase the hardware noise and hardware noise is one source of entropy on computers.

3. Download the public key of the person/institution you want to verify. For
   bitcoin-client , their public key is available here:
   
   https://bitcoin.org/en/full-node#other-linux-distributions

4. Import the person’s public key into your key ring with:

   `$ gpg --import laanwj.asc`

   (change the filename to whatever is appropriate).

5. You need to sign the person’s public key with your private key, to tell PGP that you “accept” the key. This contains a few steps on it’s own:

   * List the keys in your keyring with
  
     `$ gpg --list-keys`
  
     The output will look like:
  
     ```bash
     ... 
     pub   4096R/36C2E964 2015-06-24 [expires: 2019-02-14]
     uid               Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>
     ```
    * The “name” of their key is the part after “4096R/” in the line
  
      `pub    4096R/36C2E964 2015-06-24 [expires: 2019-02-14]`
  
    * Sign their public key with:
  
      `$ gpg --sign-key 36C2E964`

6. Now you can verify the signature of the file you downloaded. With
   bitcoin-client  and it’s installer, this command was:

   `$ gpg --verify SHA256SUMS.asc`

   which outputted:

   ```bash
   $ gpg --verify SHA256SUMS.asc   
   gpg: Signature made Sat 11 Nov 2017 13:52:22 WET using RSA key ID 36C2E964
   gpg: Good signature from "Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>"
   ```


I made a simple bash script that check the integrity and the authenticity at
once. It's called verify.sh:

```bash
#!/bin/bash

release_sig=$1

if [[ -z $release_sig ]] ; then
  printf "\n\nUsage: ./verify.sh release_sig\n"
  exit 0
fi

gpg --verify-files $release_sig

sha256sum --ignore-missing -c $release_sig
```

Is output is like this:

```
$ ./verify.sh SHA256SUMS.asc 
gpg: Signature made Sat 11 Nov 2017 13:52:22 WET using RSA key ID 36C2E964
gpg: Good signature from "Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>"
bitcoin-0.15.1-x86_64-linux-gnu.tar.gz: OK
sha256sum: WARNING: 20 lines are improperly formatted

```
## Creating the perfect GPG keypair

I found a amazing [article](https://alexcabal.com/creating-the-perfect-gpg-keypair/) on the web and copy it to my [git repository](https://github.com/InserirAquiNome/articles/blob/master/misc/PGP2.md), just in case it get lost.

This article will guide you on some extra options, like using sub keys to create a PGP key to use on your laptop.

## My PGP OPSEC

My PGP OPSEC is supported on the previous points but I use on offline machine only for PGP keyring. For this I need a large size USB stick memory for the Linux Live Distro. I will use a 32GB one.

I also need media devices to backup my full PGP keyring and also to export the PGP keyring for the online machine: USB memory sticks and SD cards.

On the online machines I will use PGP keyring as mention in [here](https://alexcabal.com/creating-the-perfect-gpg-keypair) and also in [here](https://github.com/InserirAquiNome/articles/blob/master/misc/PGP2.md), as the *laptop keypair*.



### Creating a Linux Live Distro

I will use Slackware Linux Live to this setup 

https://docs.slackware.com/slackware:liveslak

The command bellow check the integrity of the ISO downloaded from one of the sites available on the link above.
```
$ md5sum -c slackware64-live-xfce-current.iso.md5 
slackware64-live-xfce-current.iso: OK
```

Now I will transfer the ISO to my 32GB USB stick memory. My options are 40% of the all size to the /home mount point that will encrypted and also 50% for the persistent filesystem. The persistent filesystem will store any changes that I make on the OS. So this setup will allow changes on the OS, when I reboot that changes will be available because they are persistent and not reset like in a DVD.
```
# ./iso2usb.sh -i slackware64-live-xfce-current.iso -o /dev/sdf -c 40% -C 50%
# sync
```

Like I said I will use USB memory sticks and SD cards to store the keyring for backup and export it to online machines.

I will use only vfat filesystem on USB memory sticks and SD cards. Because in linux, can't be executable files on vfat. 

The `fdisk -l` will list all my connected drives. The USB memory stick that I connected to store the keyring is on `/dev/sdf`. It's a 4GB memory stick and I need to create a vfat partition first with `fdisk /dev/sdf`. Then I will format the new vfat partition `mkfs.vfat /dev/sdf1`. To insure that the partition is really I will list all my drives again `fdisk -l`. Run `sync` before unplug the USB stick and connect the next media: USB stick or SD cards.
```
# fdisk -l
# fdisk /dev/sdf
# mkfs.vfat /dev/sdf1
# fdisk -l
# sync
```
DVDs are blank so they not need any preparation.

Now I will disconnect my laptop from the internet and boot with the Linux Live Distro. 

### Make sure that the offline machine don't connect to any device.

This laptop was Ethernet adapter and Wi-Fi adapter. I will blacklist the kernel modules of this adapters to try to prevent any connection from this adapters to other devices.

I will see how many network adapters I have 

```
# ifconfig -a
```

Using `# lspci` I will list all my pci devices. Then I will find the kernel modules that I want to blacklist. For example the Ethernet controller: 
```
# lspci
...
02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168B PCI Express Gigabit Ethernet controller (rev 01)

# find /sys | grep drivers.*02:00
/sys/bus/pci/drivers/r8169/0000:02:00.0
```
 Uses the r8169 kernel module drive. So I will remove it and blacklist it.
 
 ```
 # modprobe -r r8169 
 # echo "blacklist r8169" >> /etc/modprobe.d/blacklist.conf
 ```

And I will do `ifconfig -a` again to see the if really was removed I go to the next network adapter.

### Creating PGP keyring on the offline machine

Using this article and the one I linked called *Creating the perfect GPG keypair* I will create my PGP keys.

For generate the password for my PGP keys I use this script

```
!/bin/bash

# This line will genereate a 32 char random pass using A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~ chars 
#

digits=$(( RANDOM % (32 - 16 + 1 ) + 16 ))

LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c $digits ; echo

```

This will generate a password between 16-32 chars from this chars  A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~

You can change the script to tweak more chars or less or even remove some of those chars.

The offline machine warn me about not having not enough entropy for generate the PGP key. 

To increase the entropy consider install `rng-tools` and `haveged` from https://slackbuilds.org/

Like this

```
$ wget http://www.issihosts.com/haveged/haveged-1.9.1.tar.gz
$ wget https://slackbuilds.org/slackbuilds/14.2/system/haveged.tar.gz
```

Transfer the downloaded files to the offline machine using the media in vfat filesystem.

On the offline machine do

```
$ tar zpvfx haveged.tar.gz
$ rm haveged.tar.gz
$ mv haveged-1.9.1.tar.gz haveged
$ cd haveged/
$ chmod +x haveged.SlackBuild
# ./haveged.SlackBuild
# installpkg /tmp/haveged-1.9.1-x86_64-2_SBo.tgz
```

I created also some directories to store backups of my PGP keyring and revocation certificates 

```
$ mkdir ~/gpg_archive
$ mkdir ~/gpg_archive/gpg_backup/
$ mkdir ~/gpg_archive/gpg_revocation_certificates/
$ mkdir ~/gpg_archive/gpg_public/
```
Then I copy the PGP keyring to there before making any modification on it `$ cp -av ~/.gnupg ~/gpg_archive/gpg_backup/gpg_1`

Now I will create a ISO file of my folder `~/gpg_archive`

```
$ mkisofs -o PGP.iso -r -J /home/live/gpg_archive
```

And transfer the iso to an USB memory stick

```
# dd bs=4M if=PGP.iso of=/dev/sdc
```

So now I did this on the offline machine:

 1. Created a new keypair using the strongest possible settings.

 1. Added a new signing subkey to that keypair.

 1. Exported my public PGP key and revocation certificates and copied my entire keypair to backup directory and make a ISO file of that.

 1. Removed the original signing subkey from the master keypair in your laptop’s keyring, thus transforming your master keypair into your laptop keypair.


### Exporting the keys for the online machine

I just use a media with vfat filesystem where I only have keys without signing keys.

Creating a script like this called GPG.sh can be useful for creating the keys for online use. Because this something that you need to do a lot. 

```
#!/bin/bash

mkdir /tmp/gpg 
mount -t ramfs -o size=1M ramfs /tmp/gpg 
chown live:users /tmp/gpg 
```

I also use this both scripts

```
#!/bin/bash

for (( i=1 ; i > 0 ;  i++ )); do
	if [[ -d  ~/gpg_archive/gpg_backup/gnupg_${i} ]]; then
		echo "exists $i"
	else
		echo "no exists $i"
		break
	fi

done

cp -av ~/.gnupg  ~/gpg_archive/gpg_backup/gnupg_${i}

if [[ -f ~/PGP.iso ]]; then rm ~/PGP.iso ; fi

mkisofs -o ~/PGP.iso -r -J /home/live/gpg_archive
```
This backups the keyring creating a new gnupg_X folder without overwriting any existing one. And also creates the PGP.iso of the `~/.gnu_archive` folder.

```
#!/bin/bash
 

gpg --export-secret-subkeys 1B9706E8 > /tmp/gpg/subkeys
printf "\n\nsecret subkey 1B9706E8 exported\n\n" 
gpg --delete-secret-key 1B9706E8
printf "\n\nimporting secret subkey 1B9706E8 right now\n\n" 
gpg --import  /tmp/gpg/subkeys
gpg --list-secret-keys
rm  /tmp/gpg/subkeys
```
This create the keys for using online but it needs to been to executed after the first script that a posted on this section. I added a few lines for my others keys.

### Final comments

I noticed that creating PGP keys on air gaped machines will create a PGP key in few hours in the future. The best solution I came a cross is to change the clock of the offline machine to two days before.

```
# date -s "3 March 2018 18:00:00"
```

I will recommend the following permissions for `~/.gnupg`

```
find ~/.gnupg/ -type d -exec chmod 700 {} \;
find ~/.gnupg/ -type f -exec chmod 600 {} \;
```

And this my `~/.gnupg/gpg.conf`

Now I have an air gaped machine for PGP in a 32GB USB memory stick

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/pgp.jpg "Logo Title Text 1")

## Links:

http://www.mattnworb.com/post/how-to-verify-a-pgp-signature-with-gnupg

https://futureboy.us/pgp.html

https://bitzuma.com/posts/how-to-verify-an-electrum-download-on-windows

https://bitcointalk.org/index.php?topic=1836004.msg18341475#msg18341475

https://gist.github.com/turingbirds/3df43f1920a98010667a

https://alexcabal.com/creating-the-perfect-gpg-keypair

https://github.com/InserirAquiNome/articles/blob/master/misc/PGP2.md

https://davesteele.github.io/gpg/2014/09/20/anatomy-of-a-gpg-key/ 

[copy from the above](https://github.com/InserirAquiNome/articles/blob/master/misc/PGP_anatomy.md)
 
http://www.spywarewarrior.com/uiuc/gpg/gpg-com-4.htm

## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
