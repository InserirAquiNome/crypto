# Electrum wallet - Authenticity check

## Intro 

Electrum wallet is a bitcoin wallet. There is also a fork of the electrum wallet that can be used as a litecoin wallet.

This the bitcoin wallet 

https://electrum.org

And this is a fork from the above that works on litecoin 

https://electrum-ltc.org/

**Electrum can be used as an hot wallet or as cold storage wallet. On cold storage your private keys stay offline so you will need a way to sign the transactions on a offline machine. You can use bitkey for that or create your own linux distro that runs on a storage device that is only connect with the machine offline. e.g: USB memory stick, external hard drive and etc...**

Links

https://en.bitcoin.it/wiki/Category:Security

https://en.bitcoin.it/wiki/Securing_your_wallet

https://en.bitcoin.it/wiki/Cold_storage

https://en.bitcoin.it/wiki/BitKey

## Downloading 

```
$ wget https://download.electrum.org/3.0.6/Electrum-3.0.6.tar.gz

$ wget https://download.electrum.org/3.0.6/Electrum-3.0.6.tar.gz.asc
```


This will download the wallet and signature. 

## Authenticity

But now I need to check if this software is the real software created by his author. The author of this software is [ThomasV](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x2BD5824B7F9470E6)

In my git repo there is an article created by me about [PGP](https://github.com/InserirAquiNome/crypto/blob/master/PGP.md)

And there is also a couple cheat sheets on my git repo about PGP

https://github.com/InserirAquiNome/articles/tree/master/cheatsheets

I need the key from the author. And from the website that I provided and that is also no the Electrum website

https://pgp.mit.edu/pks/lookup?op=vindex&search=0x2BD5824B7F9470E6

I can see the ID of his key **7F9470E6**

```
$ gpg --search-keys 7F9470E6

gpg: searching for "7F9470E6" from hkp server keys.gnupg.net
(1)     ThomasV <thomasv1@gmx.de>
        Thomas Voegtlin <thomasv1@gmx.de>
        Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>
          4096 bit RSA key 7F9470E6, created: 2011-06-15
Keys 1-1 of 1 for "7F9470E6".  Enter number(s), N)ext, or Q)uit > 1
gpg: requesting key 7F9470E6 from hkp server keys.gnupg.net
gpg: key 7F9470E6: public key "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>" imported
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   5  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: depth: 1  valid:   5  signed:   0  trust: 5-, 0q, 0n, 0m, 0f, 0u
gpg: next trustdb check due at 2018-06-09
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
```

Like you can see I found it. I but will check the finger print from the file I downloaded.

```
$ gpg --verify Electrum-3.0.6.tar.gz.asc 
gpg: assuming signed data in `Electrum-3.0.6.tar.gz'
gpg: Signature made Sat 03 Feb 2018 08:59:22 WET using RSA key ID 7F9470E6
gpg: Good signature from "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>"
gpg:                 aka "ThomasV <thomasv1@gmx.de>"
gpg:                 aka "Thomas Voegtlin <thomasv1@gmx.de>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 6694 D8DE 7BE8 EE56 31BE  D950 2BD5 824B 7F94 70E6
```

In the last line there is the fingerprint.

Now I will download the key from a key-server

```
$ gpg --recv-keys 7F9470E6
gpg: requesting key 7F9470E6 from hkp server keys.gnupg.net
gpg: key 7F9470E6: "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1
```

And check the fingerprint of the download key with the one I downloaded from the wallet website.

```
$ gpg --fingerprint 7F9470E6
pub   4096R/7F9470E6 2011-06-15
      Key fingerprint = 6694 D8DE 7BE8 EE56 31BE  D950 2BD5 824B 7F94 70E6
uid                  Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>
uid                  ThomasV <thomasv1@gmx.de>
uid                  Thomas Voegtlin <thomasv1@gmx.de>
sub   4096R/2021CD84 2011-06-15
```

And like you can see the fingerprints are the same. So will sign it. 

`$ gpg --sign-key 7F9470E6`

Now I will verify the file authenticity.

```
$ gpg --verify Electrum-3.0.6.tar.gz.asc 
gpg: assuming signed data in `Electrum-3.0.6.tar.gz'
gpg: Signature made Sat 03 Feb 2018 08:59:22 WET using RSA key ID 7F9470E6
gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   6  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: depth: 1  valid:   6  signed:   1  trust: 6-, 0q, 0n, 0m, 0f, 0u
gpg: next trustdb check due at 2018-06-09
gpg: Good signature from "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>"
gpg:                 aka "ThomasV <thomasv1@gmx.de>"
gpg:                 aka "Thomas Voegtlin <thomasv1@gmx.de>"
```

It's authentic.

## Install

In git repo of the electrum wallet shows the dependencies 

https://github.com/spesmilo/electrum

I already installed them.

I only did this

`$ tar zpvfx Electrum-3.0.6.tar.gz`

Now I will add the path to this directory to my PATH.

`$ pwd`

And I them add it at the end of file *.bash_profile*

`$ vim ~/.bash_profile`

I checked that the file *.bash_profile* doesn't have any empty line at the end.
 
Now I do 

`
$ source ~/.bash_profile
`

To add that path to my PATH.

And can run the wallet with the command *electrum*

There is a couple a things I do when run the eletrum wallet. I like to use different profiles so I create on directory for each one. Like this

`$ mkdir ~/.electrum_usd`

`$ mkdir ~/.electrum_eur`

## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
