# Bitcoin full node

## Introduction 

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node3.png "Logo Title Text 1")

Most people holding bitcoin aren't running full nodes and which means they are trusting someone to provide the balance of their address. Only running a full node allows trust less interaction with bitcoin.

Most bitcoin users are using wallets that are SPV wallets like TREZOR, electrum and etc... Trezor is completely trusted website. You CAN choose your own server, but its hard. 

But TREZOR is still one of the best hardware wallets solutions available at the moment.

To full understand the bitcoin revolution, you need to run a full node.
I will provide some links why this matters:

https://medium.com/@lopp/securing-your-financial-sovereignty-3af6fe834603

https://hackernoon.com/money-is-a-social-construct-and-thats-why-you-should-run-a-bitcoin-full-node-ea0330cb69a5

http://bitcoinist.com/6-reasons-run-bitcoin-full-node/


The most popular bitcoin client is the reference client or the satoshi client also called bitcoin core:

https://bitcoin.org/en/bitcoin-core/

https://bitcoincore.org/

https://bitcoin.org/bin/

**Always check the integrity and authenticity of any software downloaded from the internet**

Besides the reference client there is alternatives clients like knots, bitcoinj and others. All this clients came to consensus on the bitcoin network agreeing what are the rules of the network, or in other words this clients vote on the network on what is bitcoin. **There is some scammers in the crypto space claiming that bitcoin core is the only client, and that's a lie. Always check everything before put your money in one project!!!** 


More about this:

https://en.bitcoin.it/wiki/Consensus

https://en.bitcoin.it/wiki/Prohibited_changes

Bitcoin is a voting system totally decentralized and it's first application was a financial system. But similar systems based on the same principles can be used for voting, taking decisions, government and so much more.

The bitcoin network is a P2P network, every peer of the newtork are equally privileged and equipotent participants without the need for central coordination by servers or stable hosts. Peers are both suppliers and consumers of resources of the network.

In the bitcoin network, every ten minutes a block is mined by miners, miners are also nodes or they couldn't participate on the bitcoin network. Then, the mining nodes broadcast that block to every node (peer) of the network. 

Each node will check if that block is valid on rules of that node. This rules are enforced by the software running on that node. 

If it's valid the node broadcast that block to the rest of the network. 

If it's not valid the node will not broadcast that block on the network. And also will stop talking with the node which broadcasted the block in the first place. This cut of communication can be temporary or permanent.

In this way nodes that broadcast blocks with different rules are quickly isolated from the network. 

When they are more than one they create their own network, sharing their own resources and enforcing their own rules and creating a new coin.

The bitcoin network have rules but don't have rulers. The rules are enforced by software running on nodes and this nodes are controlled by anyone that are willing to do it. They just need to download the software, check their integrity and authenticity.

And because the hardware required doesn't need to be powerful, anyone can run their own node. A cheap old computer can do it, like a dual core with 4GB of ram on even a small RPi3 can run a full node. 

To change the rules everyone controlling the nodes need to change the software running on it.

And if anyone can run a full node, the bitcoin network is decentralized and anyone can participate on it.

This is the revolution of bitcoin as decentralized and incorruptible voting system of equal participants.

And we are still grasping it's potential.
Bitcoin is a young technology and it's needs to grow, scale and embrace every challenge on it's path.

In our days we ear everyone talking about bitcoin and the blockchain revolution. 
Governments and banks say that the true revolution is the blockchain. In other words their blockchain and a voting system centralized here only a few can say what is valid or not.
And if you believe them, you will not understand what is the bitcoin revolution. And why it matters and why is so powerful and beautiful.

**Bitcoin is probably the biggest revolution you will watch in your lifetime.** 

Run your own full bitcoin node!

## Setting a full bitcoin node 

This a few guides out there 

https://bitcoin.org/en/full-node

You can run a full bitcoin node in almost hardware out there, like Satoshi says in the white paper "*The network itself requires a minimal structure*".

But if you are a miner that is different thing and for that you need more powerful hardware. 

Some people claim that miners or mining nodes, because everyone on the network is a node, should say what are the rules and change them at their will. And that's not true because in a P2P network every node is equal and everyone share their resources that they put on the network.

But because miners are using lot of energy to mine bitcoin they are reward for that. Actually in the bitcoin network,  miners apply security doing computational work. 

An example how this works is looking to a lock like this one:

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node4.jpg "Logo Title Text 1")

Everyone with a bike should know this kind of looks!

This looks open with a combination but for someone that doesn't knows the combination the only way to open it is trying every combination. And this what mining nodes do! They do brute force until they find the combination.

Then the other nodes on the network check if that combination really opens the lock and they do it very fast because when you know the combination it's easy to open the look.

Because the hard work that miners do, every time they do this job that it's similar to open a look, they receive bitcoin. That's called the block reward and that's the way that the bitcoin is generated on the network. But this block reward is reduced with time, so the bitcoin supply is limited to 21M.

Besides this block reward, miners also receive the fees of every transaction on the block that was mined. And in this way, when every bitcoin was already mined there is still incentive for miners spend energy applying security on the network doing computational work aka POW (Proof of Work).

And doesn't matter if you can do this job faster with more computational power because PoW was difficulty adjustment. This means that every time that there is more miners or more powerful hardware on the network the job goes harder. And the opposite also applies, less hash rate (capacity to do PoW) means less difficulty.

In this way the bitcoin network is sustainable in the future and the devs working on the satoshi client or bitcoin core client, are doing an amazing job adding new features to bitcoin making it better every time. 

## Hardware - An $35 computer, an RPi3

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node1.jpg "Logo Title Text 1")

This is a setup of a bitcoin full node running on a RPi3 hardware. I run other nodes but this is my first bitcoin full node on an ARM machine.

My RPi3 run a Linux OS, without X. This even make the cost of running this node lower, because I won't need a monitor. I don't need a software license because Linux is Free Open Source Software (FOSS).
 And bitcoin is also FOSS.
 
And I access my node through SSH, so I don't even need a mouse or keyboard. It's only the RPi3, it's power supply, micro sd card and an 8GB USB memory stick. 

The final cost of this setup is less than 100 usd with cables and the plastic box to put the RPi3.

## Software - Download the client

I will use the Sathoshi client also known as reference client or bitcoin core.

So on https://bitcoin.org/en/download or https://bitcoin.org/bin/

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

And add this at the end

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
This is my node comment.
```
# Node comment
uacomment=This-is-my-node-and-I-choose-what-is-bitcoin
```

## Misc 

I will not store the blockchain on the RPi sdcard, because this will read and write a lot of times on my sd card and can damage it. I will use an USB memory stick to store the blocks.

```
$ cd ~/storage/
$ mkdir blocks
$ mkdir chainstate
$ cd ~/.bitcoin/
$ ln -s ~/storage/blocks/
$ ln -s ~/storage/chainstate/
```

I have a script called *bitcoinsync.sh* and another called *tor.sh* that I will download to my RPi3

```
$ cd ~/programming/Raspberry_RPi3/scripts/
$ wget https://raw.githubusercontent.com/InserirAquiNome/crypto/master/bash/bitcoinsync.sh
$ wget https://raw.githubusercontent.com/InserirAquiNome/crypto/master/bash/tor.sh
$ chmod +x bitcoinsync.sh tor.sh
```

And now I will add some alias to my .bashrc

```
alias BTC_start="source ~/.bash_profile ; bitcoind -daemon -disablewallet"

alias BTC_stop="source ~/.bash_profile ; bitcoin-cli stop"

alias BTC_status="source ~/.bash_profile ; /home/pi/programming/Raspberry_RPi3/scripts/bitcoinsync.sh ; /home/pi/tor.sh ; du -sh /home/pi/storage/blocks/"
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

## Syncing the node 

Already pass some time but the blockchain is at the moment around 160GB and my node have to sync it all.

```
$ date
Wed  7 Feb 23:28:15 WET 2018

$ inxi 
CPU~Quad core ARMv7 rev 4 (v7l) (-MCP-) speed~1200 MHz Kernel~4.9.32-v7-arm armv7l Up~2:24 Mem~280.6/923.4MB HDD~31.9GB(49.0% used) Procs~144 Client~Shell inxi~2.3.56  

$ du -sh ~/storage/blocks/
529M    /home/pi/storage/blocks/

$ cat /etc/slackware-version 
Slackware 14.2

$ BTC_status
OK!!! bitcoind is running

Number of blocks 233847
274346 blocks behind
46.01 % Done
```

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node2.png "Logo Title Text 1")

It's not an expensive hardware. Only a $35 hardware + power adapter + sdcard + USB memory stick. And there it is, everything we need to guarantee your financial sovereignty!

In meanwhile I am listening some music on it, just waiting to full sync my node.

I think will also configure tor on it!

I will leave some link about that.

**Update - 8 Feb 2018** 

It passed almost 24 hours since the last time posted my node progress syncing the full blockchain.

```
$ date
Thu  8 Feb 18:34:31 WET 2018

$ BTC_status
OK!!! bitcoind is running

Number of blocks 290825
217449 blocks behind
57.21 % Done 

(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)

Your Tor IP is:
   Current IP Address: NOT.MY.TOR.ADDRESS
      Congratulations. This browser is configured to use Tor.
      Congratulations. This browser is configured to use Tor.
Number of Tor connections: 19
676M    /home/pi/storage/blocks/

$ uptime
 18:35:30 up 21:32,  2 users,  load average: 3.41, 2.76, 2.82

```

It's not fast because I am using only one core, like you can see on bitcoin.conf. But at least the system load is low.

But I am receiving a full blockchain that is pruned after 600M. It started from the beginning of the blockchain and goes until the current block. Now I am at 57% of blockchain and I think that this blocks are still not full. So it will not put a lot of load on the computer for now. Maybe around 75% I will see some increase on my system load. Let's see at happens until then.

I could be doing this in a different way. I already have a full blockchain on my personal computer. I could just copy that blockchain to the RPi3 and I think doing that would be faster. But I prefer to test this like if this was my only hardware available for my full node. And for that I will sync the all blockchain.

**Update - 8 Feb 2018**

I changed somethings on my .bashrc to get better stats.

```
function BTC_status () {

  source ~/.bashrc

  process="bitcoind"
  pidof -s "$process" > /dev/null 2>&1
  status=$?

  if [[ "$status" -eq 0 ]]; then
    printf "\n"
    echo "$process is running"
    printf "\n"
    uname -a
    printf "\n"
    date
    printf "\n"
    uptime
    printf "\n"
    /home/pi/programming/Raspberry_RPi3/scripts/bitcoinsync.sh
    /home/pi/tor.sh
    du -sh /home/pi/storage/blocks/
    du -sh /home/pi/storage/chainstate/
  else
    echo "$process is NOT running"
  fi

}

```

The output of this change it this

```
$ BTC_status

bitcoind is running

Linux RaspberryRPi3 4.9.32-v7-arm #1 SMP Sat Jun 17 13:52:41 BST 2017 armv7l BCM2835 GNU/Linux

Thu  8 Feb 22:07:13 WET 2018

 22:07:13 up 1 day,  1:03,  2 users,  load average: 3.19, 2.56, 2.22

OK!!! bitcoind is running

Number of blocks 295950
212343 blocks behind
58.22 % Done 

(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)

Your Tor IP is:
   Current IP Address: NOT.MY.TOR.ADDRESS
      Congratulations. This browser is configured to use Tor.
      Congratulations. This browser is configured to use Tor.
Number of Tor connections: 22
635M    /home/pi/storage/blocks/
540M    /home/pi/storage/chainstate/
```

**Update - 13 Feb 2018**

I came a cross with some difficulties. The USB memory stick that I'm using for store the blockchain has another data inside and also it's an old USB memory stick that I had laying around. And because of that my node was always stopping. 

But now I am using another USB memory stick only for the blockchain.

My /etc/fstab
```
...
UUID=523ce6cf-a026-467b-822e-3c7cd0e8f94e        /storage1         ext4        defaults         0   0
...
```

```
$ BTC_status

bitcoind is running

Linux RaspberryRPi3 4.9.32-v7-arm #1 SMP Sat Jun 17 13:52:41 BST 2017 armv7l BCM2835 GNU/Linux

Tue 13 Feb 18:21:35 WET 2018

 18:21:35 up 1 day,  2:26,  5 users,  load average: 2.58, 2.82, 2.86

OK!!! bitcoind is running

Number of blocks 353543
155484 blocks behind
69.45 % Done 

(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)

Your Tor IP is:
   Current IP Address: NOT.MY.TOR.ADDRESS
      Congratulations. This browser is configured to use Tor.
      Congratulations. This browser is configured to use Tor.
Number of Tor connections: 3
584M    /home/pi/storage1/blocks/
982M    /home/pi/storage1/chainstate/

```

And now is already running for a while!

## Tor setup

I followed this guide

https://en.bitcoin.it/wiki/Setting_up_a_Tor_hidden_service

## Next step...

I am also thinking on putting a node on an RPi zero W. 

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node5.jpg "Logo Title Text 1")

https://www.raspberrypi.org/products/raspberry-pi-zero-w/

An RPi zero W is a small [SoC](https://en.wikipedia.org/wiki/System_on_a_chip) computer of half of size of an Raspberry Pi 1 model A.

Tech specs:

 * 802.11 b/g/n wireless LAN
 * Bluetooth 4.1
 * Bluetooth Low Energy (BLE)
 * 1GHz, single-core CPU
 * 512MB RAM
 * Mini HDMI and USB On-The-Go ports
 * Micro USB power
 * HAT-compatible 40-pin header
 * Composite video and reset headers
 * CSI camera connector

Size:

65mm × 30mm × 5mm

## Thanks

Many thanks to all the men and women working on the development of bitcoin. Thanks for improving bitcoin with your work and thanks for beside all the improvement that we have and will have in this project in the future, everyone can run it in their own homes with inexpensive hardware.

People need to learn the value of having a network like this that runs on every hardware that anyone can afford. 

If the bitcoin network remains decentralized like today, it will never die. Because for that they need to shutdown node by node and make sure that node anyone of those nodes comes back online.

Plz! Run a full bitcoin node and experience bitcoin and try to see beyond the price. I guarantee that will help you to face corrections and pullbacks because then you will know it will go up again.


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
