# PGP on Windows 

## Get software

To know if you software integrity wasn't damaged during download and other data
transfers you need to verify its checksum.

On Windows go to https://www.quickhash-gui.org/ and download the last
version. This software will allow you to verify a checksum of any file.

After the integrity was checked it is also required to verify if the file was
the file created by its author. For that we use PGP (Pretty Good Privacy)

On Windows go to https://www.gpg4win.org/download.html and download the last
version. Then open quickhash and check the SHA256SUM of your file against the
provided in the website. If both are identical, your file is an exact match from
the one in the website This means that no errors were done during transfer and
the data is intact.

Now install gpg4win. 

## Setup 

To use it you need to edit the Windows PATH.

![alttext](https://github.com/InserirAquiNome/crypto/blob/master/static/image/4_noname_1.png "Logo Title Text 1") 

![alttext](https://github.com/InserirAquiNome/crypto/blob/master/static/image/4_noname_2.png "Logo Title Text 1") 

![alttext](https://github.com/InserirAquiNome/crypto/blob/master/static/image/4_noname_3.png "Logo Title Text 1") 

![alttext](https://github.com/InserirAquiNome/crypto/blob/master/static/image/4_noname_4.png "Logo Title Text 1") 

Every time you add a new PATH to the existing PATH use `;`.

`;` is the separator between each individual PATH of the total PATH. 

The PGP config files will be in your user settings. To get there put %APPDATA% in
the file manager.

My configuration file [gpg.conf](https://github.com/InserirAquiNome/crypto/blob/master/config/gpg.conf)
will not work in windows as it is. But you can adapt it, adding line by line and see how
it works. 

But the setting for 
```
#-----------------------------                                                                                                              
# algorithm and ciphers                                                                                                                     
#-----------------------------  
```
will work and I advice you to use it.

## Create your PGP key

Now setup your own PGP key 

`$ gpg --gen-key`

And use all default options.

If you already have a key in linux you can search on [PGP
guides](http://www.spywarewarrior.com/uiuc/gpg/gpg-com-4.htm) or in [PGP manual](https://www.gnupg.org/gph/en/manual.html) how to import
the key.

For a more complex setup with revoke certificates follow this guide [1](https://alexcabal.com/creating-the-perfect-gpg-keypair) [2](https://github.com/InserirAquiNome/articles/blob/master/misc/PGP2.md) [3](https://github.com/InserirAquiNome/crypto/blob/master/0_PGP.md#creating-the-perfect-gpg-keypair)

## Usage 

After this you will be able of sign and encrypt files with your key.

http://www.spywarewarrior.com/uiuc/gpg/gpg-com-4.htm


## More links

https://www.gnupg.org/

https://www.gnupg.org/gph/en/manual.html

http://www.spywarewarrior.com/uiuc/gpg/gpg-com-4.htm

http://cryptowiki.net/index.php?title=Table_of_Contents

https://blogs.gentoo.org/mgorny/2018/05/12/on-openpgp-gnupg-key-management/

https://darknetmarkets.org/guides/pgp-tutorial-for-newbs/

https://futureboy.us/pgp.html

https://davesteele.github.io/gpg/2014/09/20/anatomy-of-a-gpg-key/

http://www.mattnworb.com/post/how-to-verify-a-pgp-signature-with-gnupg/

https://alexcabal.com/creating-the-perfect-gpg-keypair


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")

Lighting Tip Box
http://bitcoin0plomo.ddns.net:9115
