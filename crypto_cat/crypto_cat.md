# PGP 

Using PGP for authenticity check

https://www.gnupg.org/documentation/manpage.html

## Signing a file

`gpg -u 5079D156 --output cat.jpg.sig --detach-sign cat.jpg`

My pub pgp key

https://twitter.com/ComAsasNosPes/status/966848020989038593

https://github.com/InserirAquiNome/crypto/tree/master/pubkeys

https://keyserver.mattrude.com/pks/lookup?search=ten.thousands.fists%40gmail.com&fingerprint=on&op=vindex

## Checking the file for authenticity

```
$ gpg --verify cat.jpg.sig                                    
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:46:19 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

## Making a fake

`$ cp -av cat_fake.jpg cat.jpg`



```
$ gpg --verify cat.jpg.sig   
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:46:19 WET using RSA key ID 5079D156
gpg: BAD signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

`$ cp -av cat_orig.jpg cat.jpg`

```
$ gpg --verify cat.jpg.sig   
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:46:19 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

## Signing a file using an ASCII armored output.

`$ gpg -u 5079D156 --armor --output cat.jpg.asc --detach-sign cat.jpg`

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

```
$ gpg --verify cat.jpg.asc  
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>
```

## What about the integrity?

`$ sha256sum cat.jpg >> cat.jpg.asc`

```
$ sha256sum -c --ignore-missing cat.jpg.asc 
cat.jpg: OK
sha256sum: WARNING: 16 lines are improperly formatted
```

```
$ gpg --verify cat.jpg.asc                  
gpg: assuming signed data in `cat.jpg'
gpg: Signature made Fri 23 Feb 2018 04:52:26 WET using RSA key ID 5079D156
gpg: Good signature from "InserirAquiNome <ten.thousands.fists@gmail.com>"
```

