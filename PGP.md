# PGP

## When downloading files from the internet is needed to check their integrity and authenticity 
  
### Integrity check

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

Now when you have a txt file with the SHA256 sum on it you can do something
else. For example with this txt file:

```bash
$ cat bitcoin-0.15.1-x86_64-linux-gnu.tar.gz.sha256sum                                                
387c2e12c67250892b0814f26a5a38f837ca8ab68c86af517f975a2a2710225b  bitcoin-0.15.1-x86_64-linux-gnu.tar.gz
```
 
I have the SHA256 sum and the name of the file in that format. So I can do this:

```bash
$ sha256sum -c bitcoin-0.15.1-x86_64-linux-gnu.tar.gz.sha256sum 
bitcoin-0.15.1-x86_64-linux-gnu.tar.gz: OK
```
It automatically checks the SHA256 sum on that txt file with the SHA256 of the
file. Of course the file was to be on that directory.

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

### Authenticity check

**This tutorial is based on this work** 
*source* http://www.mattnworb.com/post/how-to-verify-a-pgp-signature-with-gnupg/


If you already have GnuPG or another PGP client installed, skip steps 1 and 2.

1. Install GnuPG on your linux distro.

2. Create your private key with

   `$ gpg --gen-key`
  
   Accept all of the default options.

3. Download the public key of the person/institution you want to verify. For
   bitcoin-client , their public key is available here.
   
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

6. Now you can verify the signature of the file you downloaded. With TrueCrypt and it’s installer, this command was:

  `$ gpg --verify SHA256SUMS.asc`

which outputted:

```bash
$ gpg --verify SHA256SUMS.asc   
gpg: Signature made Sat 11 Nov 2017 13:52:22 WET using RSA key ID 36C2E964
gpg: Good signature from "Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>"
```


Links:

http://www.mattnworb.com/post/how-to-verify-a-pgp-signature-with-gnupg/

https://futureboy.us/pgp.html
