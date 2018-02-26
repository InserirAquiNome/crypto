# Bitcoin full node

## Introduction 

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node3.png "Logo Title Text 1")

Most people holding bitcoin aren't running full nodes, so they are trusting someone to provide the balance of their address. Only running a full node allows trust less interaction with bitcoin.

Most bitcoin users are using wallets that are SPV wallets like TREZOR, electrum and etc... Trezor is completely trusted website. You CAN choose your own server, but its hard. 

But TREZOR is still one of the best hardware wallets solutions available at the moment.

To full understand the bitcoin revolution, you need to run a full node.
I will provide some links explaining why this matters:

https://medium.com/@lopp/securing-your-financial-sovereignty-3af6fe834603

https://hackernoon.com/money-is-a-social-construct-and-thats-why-you-should-run-a-bitcoin-full-node-ea0330cb69a5

http://bitcoinist.com/6-reasons-run-bitcoin-full-node/


The most popular bitcoin client is the reference client or the satoshi client also called bitcoin core:

https://bitcoin.org/en/bitcoin-core/

https://bitcoincore.org/

https://bitcoin.org/bin/

**Always check the integrity and authenticity of any software downloaded from the internet**

Besides the reference client there is alternatives clients like knots, bitcoinj and others. All this clients came to consensus on the bitcoin network agreeing what are the rules of the network, or in other words this clients vote on the network on what is bitcoin. **There is some scammers in the crypto space claiming that bitcoin core is the only client, and that's a lie. Always check everything before put your money in a project!!!** 


More about this:

https://en.bitcoin.it/wiki/Consensus

https://en.bitcoin.it/wiki/Prohibited_changes

Bitcoin is a voting system totally decentralized and it's first application was a financial system. But similar systems based on the same principles can be used for voting, taking decisions, government and so much more.

The bitcoin network is a P2P network, every peer of the newtork are equally privileged and equipotent participants without the need for central coordination by servers or stable hosts. Peers are both suppliers and consumers of resources of the network.

In the bitcoin network, every ten minutes a block is mined by miners, miners are also nodes or they couldn't participate on the bitcoin network. Then, the mining nodes broadcast that block to every node (peer) of the network. 

Each node will check if that block is valid on rules of that node. This rules are enforced by the software running on that node. 

If it's valid the node broadcast that block to the rest of the network. 

If it's not valid the node will not broadcast that block on the network. And also will stop talking with the node which broadcasted the block in the first place. This cut of communication can be temporary or permanent.

In this way nodes that broadcast blocks with different rules are quickly isolated from the network.  When the banned nodes are more than one and they broadcast blocks with the same rules, this nodes create their own network, sharing their own resources and enforcing their own rules and creating a new coin.

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

This is one of the few guides out there 

https://bitcoin.org/en/full-node

You can run a full bitcoin node in almost hardware out there, like Satoshi says in the white paper "*The network itself requires a minimal structure*".

But if you are a miner that is different thing and for that you need more powerful hardware. 

Some people claim that miners or mining nodes, because everyone on the network is a node, should say what are the rules and change them at their will. And that's not true because in a P2P network every node is equal and everyone share their resources that they put on the network.

But because miners are using lot of energy to mine bitcoin they are reward for that. Actually in the bitcoin network,  miners apply security doing computational work. 

An example how this works is looking to a lock like this one:

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node4.jpg "Logo Title Text 1")

Everyone with a bike should know this kind of looks!

This looks open with a combination but for someone that doesn't knows the combination the only way to open it is trying every single combination. And this what mining nodes do! They do brute force until they find the combination.

Then the other nodes on the network check if that combination really opens the lock and they do it very fast because when you know the combination it's easy to open the look.

Because the hard work that miners do, every time they do this job that it's similar to open a look, they receive bitcoin. That's called the block reward and that's the way that the bitcoin is generated on the network. But this block reward is reduced with time, so the bitcoin supply is limited to 21M.

Besides this block reward, miners also receive the fees of every transaction on the block that was mined. And in this way, when every bitcoin was already mined there is still incentive for miners spend energy applying security on the network doing computational work aka PoW (Proof of Work).

And doesn't matter if you can do this job faster with more computational power because PoW was difficulty adjustment. This means that every time that there is more miners or more powerful hardware on the network the job goes harder. And the opposite also applies, less hash rate (capacity to do PoW) means less difficulty.

In this way the bitcoin network is sustainable in the future and the devs working on the satoshi client or bitcoin core client, are doing an amazing job adding new features to bitcoin making it better every time. 

## Hardware - An $35 computer, an RPi3

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node1.jpg "Logo Title Text 1")

This is a setup of a bitcoin full node running on a RPi3 hardware. I run other nodes but this is my first bitcoin full node on an ARM machine.

My RPi3 run a Linux OS, without X. This even make the cost of running this node lower, because I won't need a monitor. I don't need a software license because Linux is Free Open Source Software (FOSS).
 And bitcoin is also FOSS.
 
And I access my node through SSH, so I don't even need a mouse or keyboard. It's only the RPi3, it's power supply, micro sd card and an 2,5'' external hard drive like this one

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node2.jpg "Logo Title Text 1")

The final cost of this setup is less than 200 usd with cables, the plastic box to put the RPi3 and the hard drive.

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

This is my node comment
```
# Node comment
uacomment=This-is-my-node-and-I-choose-what-is-bitcoin
```

## Misc 

I will not store the blockchain on the RPi sdcard, because this will read and write a lot of times on my sd card and can damage it. I will use an external hard drive to store the blocks.

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

And now I will add some alias to my *~/.bashrc*

```
alias BTC_start="source ~/.bash_profile ; bitcoind -daemon -disablewallet"

alias BTC_stop="source ~/.bash_profile ; bitcoin-cli stop"
```

And also add this function to my *~/.bashrc*

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
    du -sh /home/pi/storage2/blocks/
    du -sh /home/pi/storage2/chainstate/
    printf "\nFull node running for days-hours:minutes:seconds\n$(ps -o etime= -p "$(pidof "$process")")\n\n"
  else
    echo "$process is NOT running"
  fi

}
```

I will also configure tor on it!

## Tor setup

I followed this guide

https://en.bitcoin.it/wiki/Setting_up_a_Tor_hidden_service

## Syncing the node

I could download the full blockchain and validate everything on my RPi3. But the RPi3 is not a very powerful hardware so it would take a lot of time doing that. And even worse is that I am using only one core of my RPi3, because I need it for other stuff.

I also run a full node on my x64 hardware and I have a local blockchain on that node already verified by me. **This is very important "a blockchain verified my me"** or in other words verified by my full node.

So I can copy that blockchain to my RPi3 and just wait it to sync a few blocks that were mined while I was copying the files over my LAN network.

If you are thinking that downloading and verifying a full blockchain even in a x64 hardware take to long for you. I am sorry but you have to do that. You can't get a trusted source for a blockchain besides your own blockchain. If you already have one it's great because in that way you can copy to another computers controlled by you and only you. Bitcoin is trust less system! We don't trust anyone and we verify everything. And the ability of anyone verifying their own blockchain is the key of the success of bitcoin, the decentralization. A full P2P decentralized network that no one controls and that no one can shutdown.

So I will copy the files from my full node on a x64 machine to my RPi3.

```
$ rsync -av ~/.bitcoin/blocks/ pi@rpi3_local_address:~/.bitcoin/blocks/
$ rsync -av ~/.bitcoin/chainstate/ pi@rpi3_local_address:~/.bitcoin/chainstate/
```

Start the node

```
$ BTC_start
Bitcoin server starting
```

When I started the node it was only 50 blocks behind. So it synced very fast.

Let's check if is everything ok!

```
$ BTC_status

bitcoind is running

Linux RaspberryRPi3 4.9.32-v7-arm #1 SMP Sat Jun 17 13:52:41 BST 2017 armv7l BCM2835 GNU/Linux

Sat 24 Feb 03:56:34 WET 2018

 03:56:34 up 2 days,  2:28,  5 users,  load average: 0.32, 0.29, 0.26

OK!!! bitcoind is running

Number of blocks 510946
up to date
100.0 % Done 

(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)

Your Tor IP is:
   Current IP Address: NOT.MY.TOR.ADDRESS
      Congratulations. This browser is configured to use Tor.
      Congratulations. This browser is configured to use Tor.
Number of Tor connections: 3
170G    /home/pi/storage2/blocks/
3.0G    /home/pi/storage2/chainstate/

Full node running for days-hours:minutes:seconds
   07:18:31
```

This is my final [bitcoin.conf](https://github.com/InserirAquiNome/crypto/blob/draft/config/bitcoin.conf)

## Next step...

I am also thinking on putting a node on an RPi zero W. 

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/full_node5.jpg "Logo Title Text 1")

https://www.raspberrypi.org/products/raspberry-pi-zero-w/

An RPi zero W is a small [SoC](https://en.wikipedia.org/wiki/System_on_a_chip) computer of half of size of an RPi model A+.

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

## Notes

In this article I made reference to [bitcoin](https://bitcoin.org/bitcoin.pdf) whitepaper created by Satoshi. But the whitepaper of bitcoin is not a gospel and bitcoin is not a religion, and also that's why it's important you run a full node. Because sometime along the way we may need to change something that is not or is against some idea in the whitepaper. The only way to do that is you and only can support that change, running your own full node!

Always remember that bitcoin is a voting system and it's first application was finance. You vote with your node on your computer, phone, tablet, etc... and even with a [SoC](https://en.wikipedia.org/wiki/System_on_a_chip) computer.

## Thanks

Many thanks to all the men and women working on the development of bitcoin. Thanks for improving bitcoin with your work and thanks for beside all the improvement that we have and will have in this project in the future, everyone can run it in their own homes with inexpensive hardware.

People need to learn the value of having a network like this that runs on every hardware that anyone can afford. 

If the bitcoin network remains decentralized like today, it will never die. Because for that they need to shutdown node by node and make sure that none of those nodes comes back online.

Plz! Run a full bitcoin node and experience bitcoin and try to see beyond the price. I guarantee that will help you to face corrections and pullbacks because then you will know it will go up again.


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
