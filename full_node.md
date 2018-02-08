# Bitcoin full node

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node1.jpg "Logo Title Text 1")

This is a setup of a bitcoin full node running on a RPi3 hardware. I run other nodes but this is my first bitcoin full node on an ARM machine.

My RPi3 run without X.

I use it through SSH.

## Download the client

On https://bitcoin.org/en/download or https://bitcoin.org/bin/



`$ wget https://bitcoin.org/bin/bitcoin-core-0.15.1/bitcoin-0.15.1-arm-linux-gnueabihf.tar.gz`

`$ wget https://bitcoin.org/bin/bitcoin-core-0.15.1/SHA256SUMS.asc`


## Check the client integrity and authenticity


```bash
$ sha256sum --ignore-missing -c SHA256SUMS.asc 
bitcoin-0.15.1-aarch64-linux-gnu.tar.gz: OK
sha256sum: WARNING: 20 lines are improperly formatted

```

Integrity is checked and now I will check it's authenticity, like I wrote on my [PGP.md](https://github.com/InserirAquiNome/crypto/blob/master/PGP.md)

`$ gpg --gen-key`


And in [where](https://bitcoin.org/en/full-node#other-linux-distributions) get the public key I want to verify. 

`$ wget https://bitcoin.org/laanwj-releases.asc`


But the website says 

```
If you know how to use PGP, you should also click the Verify Release Signatures link on the download page to download a signed list of SHA256 file hashes. The 0.11 and later releases are signed by Wladimir J. van der Laan’s releases key with the fingerprint:

01EA 5486 DE18 A882 D4C2  6845 90C8 019E 36C2 E964
```

Let check that

```bash
$ gpg --with-fingerprint laanwj-releases.asc 
pub  4096R/36C2E964 2015-06-24 Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>
      Key fingerprint = 01EA 5486 DE18 A882 D4C2  6845 90C8 019E 36C2 E964

```

It's correct!
So will import it to my keyring and sign it.

```bash
$ gpg --import laanwj-releases.asc 
gpg: key 36C2E964: public key "Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u

```

```
$ gpg --list-keys
$ gpg --sign-key 36C2E964
```

Let's check if the software is authentic.

 ```
$ gpg --verify SHA256SUMS.asc 
gpg: Signature made Sat 11 Nov 2017 13:52:22 WET using RSA key ID 36C2E964
gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   1  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: depth: 1  valid:   1  signed:   0  trust: 1-, 0q, 0n, 0m, 0f, 0u
gpg: next trustdb check due at 2019-02-14
gpg: Good signature from "Wladimir J. van der Laan (Bitcoin Core binary release signing key) <laanwj@gmail.com>"
 
 ```

## Extracting the file

Extract the file

`$ tar zpvfx bitcoin-0.15.1-aarch64-linux-gnu.tar.gz`

Some people run the client as root or create a new user just for that. I will run it with my regular user.


`$ vim ~/.bash_profile`

And this at the end

```
#PATH to bitcoin client
export PATH=$PATH:$HOME/BITCOIN/bitcoin-0.15.1/bin/
```

Be aware to not leave any blank space at the end of that file.

## Configuration

Create the ~/.bitcoin directory 

`$ mkdir ~/.bitcoin`

And now I need to create a bitcoin.conf file inside that directory. I already have one from my other full nodes so will upload the final version on git repo and in here I will say what I changed.

I will use only one core of my RPi3 cpu

```
# Bitcoin Core daemon
bitcoind -par=1 -daemon

# Bitcoin Core GUI
bitcoin-qt -par=1

```

I will not store the full blockchain on my node and for that I will prune the old blocks. The only storage size I will use is 600 M of disk space.

```
# Reduce storage requirements by pruning (deleting) old blocks. This mode is incompatible with -txindex and -rescan. 
# Warning: Reverting this setting requires re-downloading the entire blockchain. 
# (default: 0 = disable pruning blocks, >550 = target size in MiB to use for block files)
prune=600
```

```
# Node comment
uacomment=This-is-my-node-and-I-choose-what-is-bitcoin
```


## Final steps

I will not store the blockchain on the RPi sdcard, because this will read and write a lot of times on my sd card and can damage it. I will use USB memory stick to store the blocks.

```
$ cd ~/storage/
$ mkdir blocks
$ mkdir chainstate
$ cd ~/.bitcoin/
$ ln -s ~/storage/blocks/
$ ln -s ~/storage/chainstate/
```

I have a script called *bitcoinsync.sh* that I will download to my RPi3

```
$ cd ~/programming/Raspberry_RPi3/scripts/
$ wget https://raw.githubusercontent.com/InserirAquiNome/crypto/master/bash/bitcoinsync.sh
$ chmod +x bitcoinsync.sh
```

And now I will add some alias to my .bashrc

```
alias BTC_start="source ~/.bashrc ; bitcoind -daemon -disablewallet"

alias BTC_stop="source ~/.bashrc ; bitcoin-cli stop"

alias BTC_status="source ~/.bashrc ; /home/pi/programming/Raspberry_RPi3/scripts/bitcoinsync.sh"
```

And start the node

```
$ BTC_start
Bitcoin server starting
```

Let's check if is everything ok!

The node is being pruned? 

```
$ du -sh ~/.bitcoin/blocks/
56M     /home/pi/.bitcoin/blocks/

$ BTC_status
OK!!! bitcoind is running

Number of blocks 92883
415276 blocks behind
18.27 % Done 

$ ls -lisah  ~/.bitcoin/
total 23M
1076829 4.0K drwxr-xr-x  2 pi pi 4.0K Feb  7 22:02 .
1048579 4.0K drwxr-xr-x 44 pi pi 4.0K Feb  7 22:06 ..
1076862 4.0K -rw-------  1 pi pi   75 Feb  7 22:02 .cookie
1076856    0 -rw-------  1 pi pi    0 Feb  7 22:02 .lock
1076864 4.0K -rw-------  1 pi pi   37 Feb  7 22:02 banlist.dat
1076855 8.0K -rw-------  1 pi pi 7.5K Feb  7 21:34 bitcoin.conf
1076860 4.0K -rw-------  1 pi pi    5 Feb  7 22:02 bitcoind.pid
1076857    0 lrwxrwxrwx  1 pi pi   24 Feb  7 21:50 blocks -> /home/pi/storage/blocks/
1076858    0 lrwxrwxrwx  1 pi pi   28 Feb  7 21:50 chainstate -> /home/pi/storage/chainstate/
1076861  23M -rw-------  1 pi pi  23M Feb  7 22:08 debug.log
1076863 8.0K -rw-------  1 pi pi 4.1K Feb  7 22:02 peers.dat

$ date
Wed  7 Feb 22:09:53 WET 2018
```

How much time will take to sync the node??? 

## Conclusion and results 

Already pass some time but the blockchain is at the moment around 160GB and my node have to sync it allow

```
$ date
Wed  7 Feb 23:28:15 WET 2018

$ inxi 
CPU~Quad core ARMv7 rev 4 (v7l) (-MCP-) speed~1200 MHz Kernel~4.9.32-v7-arm armv7l Up~2:24 Mem~280.6/923.4MB HDD~31.9GB(49.0% used) Procs~144 Client~Shell inxi~2.3.56  

$ du -sh ~/storage/blocks/
529M    /home/pi/storage/blocks/

$ cat /etc/slackware-version 
Slackware 14.2
```

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node2.png "Logo Title Text 1")

It's note an expensive hardware. Only 35 usd hardware + power adapter + sdcard + USB memory stick.
In meanwhile I am listening some music on it, just waiting to full sync my node.

## More information
http://bitcoinist.com/6-reasons-run-bitcoin-full-node/

https://bitcoin.org/en/full-node

https://medium.com/@lopp/securing-your-financial-sovereignty-3af6fe834603

https://hackernoon.com/money-is-a-social-construct-and-thats-why-you-should-run-a-bitcoin-full-node-ea0330cb69a5


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
