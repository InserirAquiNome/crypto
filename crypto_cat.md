# PGP 
## Intro

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

# Steganography 

## Intro

Steganography (/ˌstɛɡəˈnɒɡrəfi/ (About this sound listen) STEG-ə-NOG-rə-fee) is the practice of concealing a file, message, image, or video within another file, message, image, or video. The word steganography combines the Greek words steganos (στεγανός), meaning "covered, concealed, or protected," and graphein (γράφειν) meaning "writing".

The first recorded use of the term was in 1499 by Johannes Trithemius in his Steganographia, a treatise on cryptography and steganography, disguised as a book on magic. Generally, the hidden messages appear to be (or be part of) something else: images, articles, shopping lists, or some other cover text. For example, the hidden message may be in invisible ink between the visible lines of a private letter. Some implementations of steganography that lack a shared secret are forms of security through obscurity, and key-dependent steganographic schemes adhere to Kerckhoffs's principle.

The advantage of steganography over cryptography alone is that the intended secret message does not attract attention to itself as an object of scrutiny. Plainly visible encrypted messages, no matter how unbreakable they are, arouse interest and may in themselves be incriminating in countries in which encryption is illegal.

Whereas cryptography is the practice of protecting the contents of a message alone, steganography is concerned with concealing the fact that a secret message is being sent as well as concealing the contents of the message.

Steganography includes the concealment of information within computer files. In digital steganography, electronic communications may include steganographic coding inside of a transport layer, such as a document file, image file, program or protocol. Media files are ideal for steganographic transmission because of their large size. For example, a sender might start with an innocuous image file and adjust the color of every hundredth pixel to correspond to a letter in the alphabet. The change is so subtle that someone who is not specifically looking for it is unlikely to notice the change.


![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cat_1.jpg "Logo Title Text 1")

There are several different techniques for concealing data inside of normal files. One of the most widely used and perhaps simplest to understand is the least significant bit technique, known commonly as LSB.

This technique changes the last few bits in a byte to encode a message, which is especially useful in something like an image, where the red, green, and blue values of each pixel are represented by eight bits (one byte) ranging from 0 to 255 in decimal or 00000000 to 11111111 in binary.

Changing the last two bits in a completely red pixel from 11111111 to 11111101 only changes the red value from 255 to 253, which to the naked eye creates a nearly imperceptible change in color but still allows us to encode data inside of the picture.

The least significant bit technique works well for media files, where slightly changing byte values creates only slight imperceptible changes, but not so well for things like ASCII text, where a single bit out of place will completely change the character. That's not to mention the fact that data hidden using LSB steganography is also easy to detect if someone is looking for it.

For this reason, there are a plethora of other steganography techniques out there, each with their own benefits and drawbacks. Another far less detectable one is called the discrete cosine transform coefficient technique, which slightly changes the weights (coefficients) of the cosine waves that are used to reconstruct a JPEG image.

## Using it

For sure certain digital steganography techniques are better than others, generally, it's best to avoid the LSB technique and go for something a bit more sophisticated. Or even designing your own steganography algorithm if you have good coding and math foundations. But to show how steganography works, I will use [steghide](http://steghide.sourceforge.net/download.php), that uses LSB.

Usage 

`steghide embed -ef secretFile -cf coverFile -sf outputFile -z compressionLevel -e scheme`

The arguments are broken down as follows:

     -ef specifies the path of the file that you want to hide. You can embed any kind of file inside of the cover file, including Python scripts or shell files.
     
     -cf is the file that the data is embedded into. This is restricted to BMP, JPEG, WAV, and AU files.
     
     -sf is an optional argument that specifies the output file. If this is omitted, the original cover file will be overwritten by your new steganographic file.
     
     -z specifies the compression level, between 1 and 9. If you prefer not to compress your file, use the argument -Z instead.
     
     -e specifies the type of encryption. Steghide supports a multitude of encryption schemes, and if this argument is omitted by default, Steghide will use 128-bit AES encryption. If you prefer not use encryption, simply type -e none.

Again I will use the picture of my cat. I will create a copy to use.

`$ cp -av cat_orig.jpg cat_steg.jpg`

Now I will hide a secret message on it.

`$ steghide embed -ef secret.txt -cf cat_steg.jpg -e none -Z`

This is my secret message, *secret.txt*
```
Soft kitty
Warm kitty
Little ball of fur

Happy kitty
Sleepy kitty
Purr purr purr
```
Putting both images side by side I can see any difference between them. The original one is on the left and the with the secret is on the right.

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/cat_orig_steg.jpg "Logo Title Text 1")

To extract the secret 

`steghide extract -sf stegoFile -xf outputFile`

Now I will extract my secret message.

`$ steghide extract -sf cat_steg.jpg -xf my_secret.txt`

And this is it

```
$ cat my_secret.txt 
Soft kitty
Warm kitty
Little ball of fur

Happy kitty
Sleepy kitty
Purr purr purr
```

I will add all SHA256 checksum to the file cat.jpg.asc

`$ sha256sum *.jpg >> cat.jpg.asc`

```
$ cat  cat.jpg.asc 
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
76639b1b7918c863e899377acd482e995435337834f305c46d4ff781005734dd  cat.jpg
756ea827fed88ef6d4d9ffb1d5179c5fc490d061329a0b9a02fe14948adda8d5  cat_fake.jpg
14e9fdc6e18b278a4c8fdf1cc4a46cfdf599e0a676dc88647650096da926b617  cat_fake_zoom.jpg
76639b1b7918c863e899377acd482e995435337834f305c46d4ff781005734dd  cat_orig.jpg
805278298cdb6f6b79f8bc1f255bf58c765bbf17aa1f191ccf2fe97c9a4899f4  cat_orig_steg.jpg
b80b88f66b8c0d7b24a17389598ca2f3c5605c5f494d4151b986509635d1e95f  cat_steg.jpg

```

Of course that the file *cat.jpg* and *cat_orig.jpg* have the same checksum because they are identical.

And finally I will check the integrity of all *jpg* files and also verify if my *cat.jpg* is still the one that I signed.

```
$ gpg --verify cat.jpg.asc
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```
Signature matches.

```
$ sha256sum -c --ignore-missing cat.jpg.asc
cat.jpg: OK
cat_fake.jpg: OK
cat_fake_zoom.jpg: OK
cat_orig.jpg: OK
cat_orig_steg.jpg: OK
cat_steg.jpg: OK
sha256sum: WARNING: 16 lines are improperly formatted
```

And also the SHA256 checksum also matches.

This is a link for all the files used on this article. You can check by yourself the integrity and authenticity of the *cat.jpg*  with my public PGP key. And also you can read the *secret.txt* that it's hidden on *cat_steg.jpg* with the password **cat**.


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")

[donate.png.asc](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png.asc) 

[Smartbit Block Explorer](https://www.smartbit.com.au/address/37mC1bGqUP7G1C9qj3MzY8PdeFnrZNYL6x)

