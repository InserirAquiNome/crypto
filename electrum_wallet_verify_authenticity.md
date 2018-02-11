# Electrum wallet - Authenticity check

## Intro 

Electrum wallet is a bitcoin wallet. There is also a fork of the electrum wallet that can be used as a litecoin wallet.

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/electrum1.png "Logo Title Text 1")

This the bitcoin wallet

https://electrum.org

And this is a fork from the above that works on litecoin

https://electrum-ltc.org/

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/electrum2.png "Logo Title Text 1")

**Electrum can be used as an hot wallet or as cold storage wallet. On cold storage your private keys stay offline so you will need a way to sign the transactions on a offline machine. You can use bitkey for that or create your own linux distro that runs on a storage device that is only connect with the machine offline, e.g: USB memory stick, external hard drive and etc...**

**The problem is like you can see in the picture above is that when you create a wallet in a online machine, your seed is also created online. And the wallet itself with the private keys inside, stays also online. In the cold storage solution, you create this seed on a electrum wallet in a offline machine that is never connected to the internet again since the OS was installed. And what you put on the online machine is an watch only wallet. An watch only wallet doesn't has any private keys inside, only pub keys.**

Links

https://en.bitcoin.it/wiki/Category:Security

https://en.bitcoin.it/wiki/Securing_your_wallet

https://en.bitcoin.it/wiki/Cold_storage

https://en.bitcoin.it/wiki/Deterministic_wallet

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

Like you can see I found it on the key-server. I but will check the finger print from the file I downloaded.

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

Now I will download the key from the key-server.

```
$ gpg --recv-keys 7F9470E6
gpg: requesting key 7F9470E6 from hkp server keys.gnupg.net
gpg: key 7F9470E6: "Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1
```

And compare the fingerprint of the download key from the key-server, with the one I downloaded from the wallet website.

```
$ gpg --fingerprint 7F9470E6
pub   4096R/7F9470E6 2011-06-15
      Key fingerprint = 6694 D8DE 7BE8 EE56 31BE  D950 2BD5 824B 7F94 70E6
uid                  Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>
uid                  ThomasV <thomasv1@gmx.de>
uid                  Thomas Voegtlin <thomasv1@gmx.de>
sub   4096R/2021CD84 2011-06-15
```

And like you can see the fingerprints are the same. So I will sign it. 

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

There is a couple a things I do when run the eletrum wallet. I like to use different profiles so I create on directory for each one. Like this,

`$ mkdir ~/.electrum_usd`

`$ mkdir ~/.electrum_eur`

To run each profile I will use the electrum option **-D** You can see more typing *electrum --help*

`$ electrum -D $HOME/.electrum_usd/`

## Electrum - LTC wallet

The fork of the electrum wallet that works as an litecoin wallet can be found in here

https://electrum-ltc.org/

The authenticity verification and install process is identical as the original one. And in the website there is a few tips like this

https://electrum-ltc.org/verifying-signatures.html

In the git repo 

https://github.com/pooler/electrum-ltc/

You can see that the dependencies are the same that the original one. So when you install the electrum wallet, you can run also the ltc version of it. 

And with electrum option **-D** that works in bitcoin version and also on the litecoin version, you can run the wallets you want. The only thing that matter is that when you run electrum you point it to a directory with a profile of bitcoin electrum. And the same with electrum-ltc, you need to point it to directory of litecoin electrum.

## Thoughts

The guides that I create are only for Linux OS.

Windows OS is too unstable and too insecure to use in crypto. In Windows you can only use hardware wallets with cold storage.

But if you have your private keys online, it doesn't matter if you are in Windows, Linux, MacOS, BSD or any other OS. There is always a chance of anyone grab you private keys from the internet. 

But if you are using a cold storage solution in a hardware wallet like TREZOR even if someone steal your TREZOR, you are safe. Just read the following links how to improve your safety in a TREZOR wallet

https://doc.satoshilabs.com/trezor-user/securitybestpractices.html#using-passphrase-encrypted-seeds

https://blog.trezor.io/seed-pin-passphrase-e15d14a0b546

https://blog.trezor.io/hide-your-trezor-wallets-with-multiple-passphrases-f2e0834026eb

https://blog.trezor.io/

https://twitter.com/TREZOR

https://trezor.io/


If you are using any cold storage solution in software like Armory, bitkey or even your own Linux OS installation for different wallets, you should always encrypt everything. 

Your drives should be encrypted I use this distro and I encrypt all my system. In my computer only the /boot is not encrypted.

http://ftp.slackware.com/pub/slackware/slackware-14.1/README_CRYPT.TXT

[In this blog I found the section *Broken configuration*, very useful](https://blog.darknedgy.net/technology/2014/07/27/1/**

In the online machine you only store watch only wallets that only have inside public keys. 

The private keys always remain on the encrypted offline machine!


**Beware of phishing sites! Always check if the address on the browser is correct, always get it from different sources and when you I are sure that is correct bookmark it and always go to the website from the bookmarks.**

**Never trust on google search results for wallets, exchanges and etc... Where you need to enter passphrases or get any software.**

**Google is useful only for getting info!!!**

But this only useful for online attacks and physical attacks on your devices like drives and hardware wallets. But an physical is more likely to be an $5 wrench attack that someone trying to decrepit your drives or hack your hardware wallets by physical access.

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/electrum3.png "Logo Title Text 1")

In crypto you need no only take care of your online exposure but also your every day security.

Take same personal defense classes, buy a dog or even buy and learn to use fire weapons.

But do everything inside the law, everyone was the right to defend themselves but being arrested by having illegal fire arms is stupid. 

Be safe!!!


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
