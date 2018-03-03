# Revisiting PGP -  Creating the perfect GPG keypair
 
## Intro 

Note
-------
> Before you start reading, keep in mind that I’m a layperson, just like you. This guide was created by synthesizing a lot of different information and tutorials available online, but I’m not a GPG developer, or even a cryptography professional. I’m just an enthusiast who thinks encryption is a critical part of modern society.
 > The encryption technology landscape can change rapidly, the PGP standard is bewilderingly complex, and GPG is a stunningly obtuse piece of software on the best of days. There are a lot of ways of creating a functional keypair, and my perfect way may not be your perfect way. Please make sure to do your own research to ensure the explanations and steps below make sense for you and your situation.
> While I’ll do my best to keep this guide updated with what I personally consider to be the latest best practice, I can’t guarantee anything and I can’t answer any GPG-related questions.

There’s a lot of information online on how to create a new GPG keypair. Unfortunately a lot of it is old advice and recommends settings that today might be unsafe.

There also isn’t too much information on how to protect your keypair if you use a laptop that might get lost or stolen.

Protecting your keypair on a laptop is tricky.

On one hand, you need your private key with you to decrypt or sign messages.

On the other hand, if your laptop is stolen then you risk losing your entire online identity, perhaps going back years, because the thief would have access to your private key and could then impersonate you.

You’d think that today, where laptops and world travel are commonplace, there’d be a little more information on how to secure a private key you have to travel with. But I could only find one resource: the [Debian Wiki](http://wiki.debian.org/subkeys) entry on subkeys. Fortunately it turns out this wiki page has exactly the solution we need. 

## Subkeys help protect your identity in case of private key (laptop) theft

If a thief gets ahold of the laptop with your private key on it, it’s pretty much game over. The thief can not only decrypt messages intended for you, they can also impersonate you by signing messages with your private key. Your only recourse would be to revoke your key, but that would mean losing years of signatures on that key and basically creating a massive inconvenience for yourself.

Part of the answer to this problem is the concept of subkeys. Subkeys can’t prevent a thief from decrypting messages intended for your private key. But they can help mitigate the damage to your identity should your key be lost or stolen.

The concept behind this technique is as follows:

 1. Create a regular GPG keypair. By default GPG creates one *signing* subkey (your identity) and one encryption subkey (how you receive messages intended for you).
 
 1. Use GPG to add an *additional* signing subkey to your keypair. This new subkey is linked to the first signing key. Now we have three subkeys.
 
 1. This keypair is your **master keypair**. Store it in a protected place like your house or a safe-deposit box. Your master keypair is the one whose loss would be truly catastrophic.
 
 1. Copy your master keypair to your laptop. Then use GPG to *remove the original signing subkey*, leaving only the new signing subkey and the encryption subkey. This transforms your master keypair into your **laptop keypair**.

Your laptop keypair is what you’ll use for day-to-day GPG usage.

What’s the benefit to this setup? Since your master keypair isn’t stored on your traveling laptop, that means you can revoke the subkeys on your laptop should your laptop be stolen. Since you’re not revoking the original subkey you created in the master keypair—remember, we removed it from our laptop’s keypair—that means you don’t have to create a new keypair and go through the hassle of getting people to sign it again. You’d still have to revoke the stolen subkey, and the thief could still use the encryption subkey to decrypt any messages you’ve already received, but at least the damage done won’t be as catastrophic.

## Creating the perfect GPG keypair, step-by-step

I’m going to lead you through the steps to create a new keypair using this subkey method. To do this we’ll be using GPG 1.4.11, which is the version currently distributed with Ubuntu 12.04 LTS.

Note
------
>GPG can be pretty noisy in its output. Some of the output below might be cut off due to the fixed-width layout of this blog; what’s cut off isn’t really important, but you can see it by highlighting it with your mouse.

Creating your initial keypair

Use the `$ gpg ‐‐gen-key` command to create a new GPG keypair.

Generally you should set your key to expire within a year or less. You can always change the expiration date later, but if you upload a key without an expiration date to a keyserver, and then your key is lost or compromised, the bad key will remain out there forever. Giving it an expiration date is a safeguard against that. For our example key, we’ll set it to not expire to simplify things a little.

Warning 
=========
>When you create your new keypair, use the highest possible values for key length. As computers get more powerful and storage gets cheaper, it’s conceivable that a nasty person could archive a message that’s unbreakable today, then in the future break it using a more powerful computer. Using the highest possible value for key length helps protect you from that scenario. Don’t use GPG’s default of 2048!

```
$ gpg --gen-key
gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
This is free software: you are free to change and  redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
    (1) RSA and RSA (default)
    (2) DSA and Elgamal
    (3) DSA (sign only)
    (4) RSA (sign only)
Your selection? 

RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 

Requested keysize is 4096 bits
Please specify how long the key should be valid.
    0 = key does not expire
    <n>  = key expires in n days
    <n>w = key expires in n weeks
    <n>m = key expires in n months
    <n>y = key expires in n years
Key is valid for? (0) 

Key does not expire at all
Is this correct? (y/N) 


You need a user ID to identify your key; the software constructs the user ID
from the Real Name, Comment and E-mail Address in this form:
    "Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"

Real name: 

E-mail address: 

Comment: 
You selected this USER-ID:
    "Bilbo Baggins <bilbo@shire.org>"

Change (N)ame, (C)omment, (E)-mail or (O)kay/(Q)uit? 

You need a Passphrase to protect your secret key.


gpg: key 488BA441 marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   4096R/488BA441 2013-03-13
      Key fingerprint = B878 1FB6 B187 B94C 3E52  2AFA EB1D B79A 488B A441
uid                  Bilbo Baggins <bilbo@shire.org>
sub   4096R/69B0EA85 2013-03-13
```

When prompted for a passphrase, make sure to pick a long and unique one. If your key gets stolen, this passphrase is the only thing protecting it!
Adding a picture

You might want to add a picture of yourself for completeness. Since the picture is stored in your public key and your public key gets distributed in a lot of places, including sometimes email, it’s best to use a small image to save space.

Use the `$ gpg ‐‐edit-key` command. At the `gpg>` prompt, enter the command addphoto and give GPG the path of the picture you’d like to use. When you’re done, use save at the final `gpg>` prompt to save your changes:

```
$ gpg --edit-key bilbo@shire.org
gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
[ultimate] (1). Bilbo Baggins <bilbo@shire.org>

gpg> 


Pick an image to use for your photo ID.  The image must be a JPEG file.
Remember that the image is stored within your public key.  If you use a
very large picture, your key will become very large as well!
Keeping the image close to 240x288 is a good size to use.

Enter JPEG filename for photo ID: 

Is this photo correct (y/N/q)? 


You need a passphrase to unlock the secret key for
user: "Bilbo Baggins <bilbo@shire.org>"
4096-bit RSA key, ID 488BA441, created 2013-03-13


pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
[ultimate] (1). Bilbo Baggins <bilbo@shire.org>
[ unknown] (2)  [jpeg image of size 5324]

gpg> 

```

## Strengthening hash preferences

Now we set our key to prefer stronger hashes. Use the gpg ‐‐edit-key command. At the gpg> prompt, enter the command `setpref SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed` (note that this will probably be cut off in the example below; highlight it with your mouse to see it), then `save`.

```
$ gpg --edit-key bilbo@shire.org
gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
[ultimate] (1). Bilbo Baggins <bilbo@shire.org>
[ultimate] (2)  [jpeg image of size 5324]

gpg> 

Set preference list to:
     Cypher: AES256, AES192, AES, CAST5, 3DES
     Digest: SHA512, SHA384, SHA256, SHA224, SHA1
     Compression: ZLIB, BZIP2, ZIP, Uncompressed
     Features: MDC, Keyserver no-modify
Really update the preferences? (y/N) 


You need a passphrase to unlock the secret key for
user: "Bilbo Baggins <bilbo@shire.org>"
4096-bit RSA key, ID 488BA441, created 2013-03-13


pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
[ultimate] (1). Bilbo Baggins <bilbo@shire.org>
[ultimate] (2)  [jpeg image of size 5324]

gpg> 

```

## Adding a new signing subkey

Now for the special sauce: let’s add our new signing subkey.

Use the `gpg ‐‐edit-key` command. At the `gpg>` prompt, enter the command addkey. Select `RSA (sign only)` and `4096` for the `keysize`. Don’t forget to save at the last `gpg>` prompt:

```
$ gpg --edit-key bilbo@shire.org
gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Secret key is available.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
[ultimate] (1). Bilbo Baggins <bilbo@shire.org>
[ultimate] (2)  [jpeg image of size 5324]

gpg> 

Key is protected.

You need a passphrase to unlock the secret key for
user: "Bilbo Baggins <bilbo@shire.org>"
4096-bit RSA key, ID 488BA441, created 2013-03-13


Please select what kind of key you want:
    (3) DSA (sign only)
    (4) RSA (sign only)
    (5) Elgamal (encrypt only)
    (6) RSA (encrypt only)
Your selection? 

RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 

Requested keysize is 4096 bits
Please specify how long the key should be valid.
    0 = key does not expire
    <n>  = key expires in n days
    <n>w = key expires in n weeks
    <n>m = key expires in n months
    <n>y = key expires in n years
Key is valid for? (0) 

Key does not expire at all
Is this correct? (y/N) 

Really create? (y/N) 


pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
sub  4096R/C24C2CDA  created: 2013-03-13  expires: never       usage: S   
[ultimate] (1). Bilbo Baggins <bilbo@shire.org>
[ultimate] (2)  [jpeg image of size 5324]

gpg> 

```

## Creating a revocation certificate

Now we generate a revocation certificate file. If your master keypair gets lost or stolen, this certificate file is the only way you’ll be able to tell people to ignore the stolen key. **This is important, don’t skip this step!**

```
$ gpg --output \<bilbo@shire.org\>.gpg-revocation-certificate --gen-revoke bilbo@shire.org
```

Store the revocation certificate file in a different place than your master keypair (which we’ll export in a later step). You’ll use it to revoke your master keypair should you lose access to it. If you only lose access to your laptop keypair, then you’ll revoke those subkeys using the master keypair, not this revocation certificate.

## Exporting the final product

Now that your keypair has been created, let’s export it so that we can back it up:

```
$ gpg --export-secret-keys --armor bilbo@shire.org > \<bilbo@shire.org\>.private.gpg-key 

$ gpg --export --armor bilbo@shire.org > \<bilbo@shire.org\>.public.gpg-key
```

This will create two files: your public key and your private key. Protect these two files, along with the revocation certificate file, as best as you can—don’t keep them on your laptop, keep them in your house or in a safe-deposit box. These three files are **your master keypair**.

## Transforming your master keypair into your laptop keypair

Now we have our master keypair in our keyring, along with three files representing the master keypair plus the keypair’s revocation certificate. To transform our master keypair into our laptop keypair, we have to remove the original signing subkey from the master keypair in our keyring.

GPG doesn’t make this easy, but here we go:

 1. Export all of the subkeys from our new keypair to a file. We first create a RAM-based ramfs temporary folder to prevent our keys from being written to permanent storage. we use ramfs instead of tmpfs/ or /dev/shm/ because ramfs doesn’t write to swap.
    ```
    $  mkdir /tmp/gpg 
    $ sudo mount -t ramfs -o size=1M ramfs /tmp/gpg 
    $ sudo chown $(logname):$(logname) /tmp/gpg 
    $ gpg --export-secret-subkeys bilbo@shire.org > /tmp/gpg/subkeys
    ```
 1. Delete the original signing subkey from the keypair in our keyring:
    ```
    $ gpg --delete-secret-key bilbo@shire.org
    ```

 1. Re-import the keys we exported and clean up our temporary file:
    ```
    $ gpg --import /tmp/gpg/subkeys 
    $ sudo umount /tmp/gpg 
    $ rmdir /tmp/gpg
    ```

That’s all! You can verify it worked by running:
```
$ gpg --list-secret-keys
/home/bilbo/.gnupg/secring.gpg
-----------------------------
sec#  4096R/488BA441 2013-03-13
uid                  Bilbo Baggins <bilbo@shire.org>
ssb   4096R/69B0EA85 2013-03-13
ssb   4096R/C24C2CDA 2013-03-13
```
See how the third line begins with `sec#`, not `sec`? The pound sign means the signing subkey is not in the keypair located in the keyring.

You’re all done!
What have we just accomplished?

If you followed all the steps in this guide, you:

 1. Created a new keypair using the strongest possible settings.

 1. Added a new signing subkey to that keypair.

 1. Exported the complete keypair to two files plus a revocation certificate, all three of which you’ve stored up in a safe place, not on your laptop. This is your master keypair.

 1. Removed the original signing subkey from the master keypair in your laptop’s keyring, thus transforming your master keypair into your laptop keypair. Your life will now be a little easier should your laptop get lost or stolen.

## Using your new laptop keypair

You can now use your keypair to encrypt, decrypt, and sign files and messages.

To sign someone else’s key or to create or revoke a subkey on this keypair, you need to use the master keypair that you keep safe—the one that’s not on your laptop.

You should distribute your public key to a keyserver. There are plenty of tutorials online on how to do that.

## In case of emergency

Should the worst happen and your laptop with your special keypair gets lost or stolen (or your special keypair is otherwise compromised), we need to revoke the subkeys on that keypair.

 1. Unlock your safe-deposit box and get your master keypair out.

 1. Boot a live USB of Ubuntu or your distro of choice. Then, import your master keypair into the live USB’s keyring:
    ```
    $ gpg --import /path/to/\<bilbo@shire.org\>.public.gpg-key /path/to/\<bilbo@shire.org\>.private.gpg-key
    ``````

 1. Now use `gpg ‐‐edit-key` to interactively revoke your subkeys:
    ```
    $ gpg --edit-key bilbo@shire.org
    gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

    Secret key is available.

    pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                         trust: ultimate      validity: ultimate
    sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
    sub  4096R/C24C2CDA  created: 2013-03-13  expires: never       usage: S   
    [ultimate] (1). Bilbo Baggins <bilbo@shire.org>
    [ultimate] (2)  [jpeg image of size 5324]

    gpg> 



    pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
    sub* 4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
    sub  4096R/C24C2CDA  created: 2013-03-13  expires: never       usage: S   
    [ultimate] (1). Bilbo Baggins <bilbo@shire.org>
    [ultimate] (2)  [jpeg image of size 5324]
    
    gpg> 


    pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
    sub* 4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E   
    sub* 4096R/C24C2CDA  created: 2013-03-13  expires: never       usage: S    
    [ultimate] (1). Bilbo Baggins <bilbo@shire.org>
    [ultimate] (2)  [jpeg image of size 5324]

    gpg> 
    


    Do you really want to revoke the selected subkeys? (y/N) 

    Please select the reason for the revocation:
        0 = No reason specified
        1 = Key has been compromised
        2 = Key is superseded
        3 = Key is no longer used
        Q = Cancel
    
    Your decision? 
    Enter an optional description; end it with an empty line:
    > 
    Reason for revocation: Key has been compromised
    (No description given)
    
    Is this okay? (y/N) 
    
    You need a passphrase to unlock the secret key for
    user: "Bilbo Baggins <bilbo@shire.org>"
    4096-bit RSA key, ID 488BA441, created 2013-03-13


    You need a passphrase to unlock the secret key for
    user: "Bilbo Baggins <bilbo@shire.org>"
    4096-bit RSA key, ID 488BA441, created 2013-03-13


    pub  4096R/488BA441  created: 2013-03-13  expires: never       usage: SC  
                     trust: ultimate      validity: ultimate
    This key was revoked on 2013-03-13 by RSA key 488BA441 Bilbo Baggins    
    sub  4096R/69B0EA85  created: 2013-03-13  expires: never       usage: E
    This key was revoked on 2013-03-13 by RSA key 488BA441 Bilbo Baggins    
    sub  4096R/C24C2CDA  created: 2013-03-13  expires: never       usage: S   
    [ultimate] (1). Bilbo Baggins <bilbo@shire.org>
    [ultimate] (2)  [jpeg image of size 5324]
    
    gpg> 
    
    ```


 1. Now that your subkey has been revoked, you have to tell the world about it by distributing your key to a keyserver.

## Further reading

  * [The GNU Privacy Handbook](http://www.gnupg.org/gph/en/manual.html), a very detailed explanation of how public-key cryptography works and how to use GPG.
  
  * [Subkeys](http://wiki.debian.org/subkeys) at the Debian Wiki, an explanation of why using subkeys is a good idea and a step-by-step guide to setting them up.
  
  * [Creating GPG Keys](http://fedoraproject.org/wiki/Creating_GPG_Keys) at the Fedora project, a step-by-step guide to creating a new GPG keypair.
    
  * [GPG How-to](https://help.ubuntu.com/community/GnuPrivacyGuardHowto) at the Ubuntu Community Help Wiki.


*source* https://alexcabal.com/creating-the-perfect-gpg-keypair/
