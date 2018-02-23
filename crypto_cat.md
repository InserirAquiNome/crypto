# PGP 

PGP is very useful. 

PGP stands for *Pretty Good Privacy* and can be used to send a message to a recipient, using his public key, that he only can read with his private key.

In other words it's possible to send an encrypted message to someone only knowing something that everyone else knows. But if that person can prove that the thing that everyone else knows is really his, he can decrypt the message.

PGP consists in two keys, the private key and the public key. The relationship between a pub key and it's private key is a password.

The pub key, like the name says is public. So the public key can be online and should be online. The only way to access your private key is with your password.

PGP can be used to encrypt messages but also for sign messages. You can sign a message with your private key and prove that the message belongs to you.

This is very useful for example if your bank sends you an email and want to sign it so that you know that was really your bank that send it. Because the bank sign is public you can check the authenticity of the email.

In this way you can check the authenticity of files with PGP.

PGP is available for Linux, MacOS and also Windows and you can find this software searching by *gnupg*.

[More](https://www.gnupg.org/documentation/index.html)

## Signing a file

I have a picture of my cat that I what to send to a friend in way that he can prove that it's authentic or that the picture wasn't tampered with.

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cat.jpg "Logo Title Text 1")

First I will sign the picture with my private key. And the only one that could do this it's me because I own the password.

`gpg -u 5079D156 --output cat.jpg.sig --detach-sign cat.jpg`

But my pub key is public and it's available online in a few places like [1](https://twitter.com/ComAsasNosPes/status/966848020989038593) [2](https://github.com/InserirAquiNome/crypto/tree/master/pubkeys) [3](https://keyserver.mattrude.com/pks/lookup?search=ten.thousands.fists%40gmail.com&fingerprint=on&op=vindex)

So my friend can easily get my pub key.

## Checking the file for authenticity

Before I send it I will check the authenticity myself.

```
$ gpg --verify cat.jpg.sig                                    
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:46:19 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

## Making a fake

I will change one pixel on the image and create a new version.

`$ cp -av cat_fake.jpg cat.jpg`

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cat_fake.jpg "Logo Title Text 1")

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cat_fake_zoom.jpg "Logo Title Text 1")

And know I will check the authenticity.

```
$ gpg --verify cat.jpg.sig   
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:46:19 WET using RSA key ID 5079D156
gpg: BAD signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

Because this wasn't the file that I signed it's says that isn't authentic.

I will restore the original one.

`$ cp -av cat_orig.jpg cat.jpg`

And check its authenticity.

```
$ gpg --verify cat.jpg.sig   
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:46:19 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

This is the one that I signed.

## Signing a file using an ASCII armored output.

I want to sign my cat picture in such a way that the output is an ASCII output. 

`$ gpg -u 5079D156 --armor --output cat.jpg.asc --detach-sign cat.jpg`

This is the content of file cat.jpg.asc
```
-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJaj54KAAoJELBCX6pQedFWxacP/RXE5Sj85G5gR5wCoZ4bF17W
6qg1Q9Q3pPGMlk2TRiQG/t/40FQxche7e2j/8XIsOqBGU7cGM7KhjHJnZmEhp/0p
W0PesdTCJftyK+/owaWVW4in4C0KcA1mQHXmYm5dd/d3+SiAmM969yRxMQojmq3u
HZNijnxcu5csJz1r7jn5lotraKDxGYfxhizHvwbPGbdBTVr5+pxyejKgVebvB0YA
iuB6oaKdU5eelBMkT/oyXo3lMva+RT6SCYyGW/zod9Gpjv5ZdtG43LLxIAGFm68Q
2PIcu+SvjJdSluL5NT8UfSt+19YtvXVGvYpTQ8AxrW1E62H5pVdtEj4LGhmsnVEF
eAI4oJ+vfvxmWCsuhRKJXxVhIqikQfB6tOR6mSs9gYUuICnbrzs8jlDswb0rkkDh
yz6nAK5WKkB+dr/+macJirtJfU39CkB5SuOygq+ulqubeUamvWdekJEuh6Dw1vZu
HyzmueRZbjcjhpVqYFKgUkc4Mk23sZEjZmX08HuZPLrhqn0eNsFQ3IkJJLzY/s0R
+et5ZiDScp2bLkatjjmB4Jy8T84q0MKtThI/K134cA5K8CP6MvEYgRyfQsCYr6MY
97rcqMUmRoRU2Tv7SnjayCs7Lmu+bR/vp7wRXnouO4pAdFEP+tksVwQqk7VHpeEZ
fMkgDaZ98y6TzRg7j50t
=zlMt
-----END PGP SIGNATURE-----
```

And it can be used to check the authenticity of my cat picture.

```
$ gpg --verify cat.jpg.asc  
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>
```

## What about the integrity?

Sometimes sending files over the internet can get some errors on them. This is a huge problem when the files are software, for example.

I will create SHA256 checksum of the picture before I send it. And store that checksum in a txt file that I will send also with the picture.

`$ sha256sum cat.jpg >> cat.jpg.asc`

Before I send it I will check if the checksum is ok or in other words the file integrity.

```
$ sha256sum -c --ignore-missing cat.jpg.asc 
cat.jpg: OK
sha256sum: WARNING: 16 lines are improperly formatted
```

And this is the file authenticity. 

```
$ gpg --verify cat.jpg.asc                  
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

In this way I only need to send two files: the picture of my cat and a txt file where is the file signature the prove its authenticity; and the SHA256 checksum that prove its integrity.

No I can sent both files by email or send only the txt file by email and host the picture on any image hosting service. If the hosting service don't change the picture, my friend can check if it match exactly with the picture that I toke. 
Now there is a problem with some image hosting services, some of them change the images that are hosted.

`$ wget https://i.imgur.com/OwVPWI5.jpg -O cat.jpg`

```
$ gpg --verify cat.jpg.asc 
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: BAD signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

But in this hosting service

`$ wget https://images2.imgbox.com/3d/24/z4PoDdri_o.jpg -O cat.jpg`

```
$ gpg --verify cat.jpg.asc                                       
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

It wasn't changed. 

Just in case the best solution is compress both the picture and the txt file and host it somewhere.

## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")

[donate.png.asc](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png.asc) [Smartbit Block Explorer](https://www.smartbit.com.au/address/37mC1bGqUP7G1C9qj3MzY8PdeFnrZNYL6x)

