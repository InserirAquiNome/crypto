# Create a live Slackware distro that runs on a DVD or a USB stick

The usb stick variant can hold changes or in other words is a persistent installation.

## Links

[General](https://docs.slackware.com/slackware:liveslak)

[ISO](https://docs.slackware.com/slackware:liveslak#downloading_iso_images)

[ISO Darren'sd site](http://slackware.uk/people/alien-slacklive/)

[live slack sources](http://git.slackware.nl/liveslak/)


## Creating my custom ISO 

In http://git.slackware.nl/liveslak/ is possible to get the latest version of liveslack scripts.

I personally clone the git repo.

```
git git://slackware.nl/liveslak.git

cd liveslack

```

Checking if I am on last version branch

```
$ git branch         
1.1.9.8
* master
```

```
$ git checkout 1.1.9.8
warning: refname '1.1.9.8' is ambiguous.
M       make_slackware_live.conf
Switched to branch '1.1.9.8'
```

Verify authenticity 

```
$ git tag -v  1.1.9.8 
object a5f063a2c8069a3aae058e496cdd2e101b92b169
type commit
tag 1.1.9.8
tagger Eric Hameleers <alien@slackware.com> 1525961787 +0200

Thu May 10 14:16:27 UTC 2018
gpg: Signature made Thu 10 May 2018 15:16:27 WEST
gpg:                using RSA key 883EC63B769EE011
gpg: Good signature from "Eric Hameleers (Alien BOB) <alien@slackware.com>" [full]
gpg:                 aka "Eric Hameleers <eric.hameleers@gmail.com>" [unknown]
gpg:                 aka "Eric Hameleers (SBo) <alien@slackbuilds.org>" [unknown]
gpg:                 aka "Eric Hameleers (Thuis) <e.hameleers@chello.nl>" [unknown]
gpg:                 aka "Eric Hameleers (Alien Base) <eric.hameleers@alienbase.nl>" [unknown]
gpg:                 aka "[jpeg image of size 4594]" [unknown]
Primary key fingerprint: 2AD1 07EA F451 32C8 A991  F4F9 883E C63B 769E E011
```

This is my directory structure for live 

```
live/                                                                                                                                       
├── ftp                                                                                                                                     
└── liveslak 
```

```
live/liveslak/                                                                                                                              
├── EFI                                                                                                                                     
├── README.txt                                                                                                                              
├── blueSW-128px.png                                                                                                                        
├── blueSW-64px.png                                                                                                                         
├── grub.tpl                                                                                                                                
├── iso2usb.sh                                                                                                                              
├── languages                                                                                                                               
├── liveinit.tpl                                                                                                                            
├── make_slackware_live.conf                                                                                                                
├── make_slackware_live.conf~                                                                                                               
├── make_slackware_live.sh                                                                                                                  
├── makemod                                                                                                                                 
├── menu.tpl                                                                                                                                
├── patches                                                                                                                                 
├── pkglists                                                                                                                                
├── pxeserver.tpl                                                                                                                           
├── setup2hd.local                                                                                                                          
├── setup2hd.tpl                                                                                                                            
├── skel                                                                                                                                    
├── syslinux                                                                                                                                
├── upslak.sh                                                                                                                               
└── xdm   
```

This is a rsync mirror of slackware 
```
live/ftp/                                                                                                                                   
└── pub                                                                                                                                     
    └── slackware                                                                                                                           
            └── slackware64-14.2                                                                                                                
                                           
```

The file `make_slackware_live.conf` is personal configuration of mine, available [here](https://pastebin.com/BMK0AcCX). That makes a ISO with my custom settings.

Then I just do 

```
# ./make_slackware_live.sh
```

To create my personal custom ISO.

## Burning a ISO on a USB stick


On [live slack sources](http://git.slackware.nl/liveslak/) you can get the `iso2usb.sh` to burn ISO on a USB stick. And this is valid for an ISO available [Darren's site](http://slackware.uk/people/alien-slacklive/) or for a custom ISO.

Create a USB Live with both the /home and the persistent data encrypted (the /home will 30% of the stick's free space  and the persistence filesystem will be 300 MB in size):
```
# ./iso2usb.sh -i slackware64-live-current.iso -o /dev/sdX -c 30% -C 300M 
```

Create a USB Live with both the /home and the persistent data encrypted (the /home will 30% of the stick's free space  and the persistence filesystem will be 30% of the stick's free space):
```
# ./iso2usb.sh -i slackware64-live-current.iso -o /dev/sdX -c 30% -C 30% 
```

For large USB sticks, bigger then 16GB I use 
```
# ./iso2usb.sh -i slackware64-live-current.iso -o /dev/sdX -c 40% -C 40% 
```


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
