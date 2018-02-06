# Armory 

## A short introduction

This is some of my personal notes from my own experience on build the Armory wallet software.

Armory wallet supports cold storage and for that purpose you need to keep you private keys offline. That's the definition of cold storage.
This means that you need a machine that will remain offline since the OS and Armory wallet was installed. This machine can't ever touch the internet again.
Because there is a physical separation from this machine to the internet it's called an air gaped machine. This machine is also called the signer machine because it signs the transactions. The only way that a machine can sign a transaction is because it's holds the private keys.
And that's the problem with wallets that keep the private keys online if someone steals the private keys they can sign your transactions and move your bitcoin around.

Using Armory with two machines is not easy but Armory is a very powerful software.

The Armory wallet with cold storage needs two machines: the offline machine or signer and the online machine.

The online machine needs to run a full bitcoin node.

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

Besides the reference client there is alternatives like knots and bitcoinj. All this clients came to consensus on the bitcoin network agreeing what are the rules of the network, or in other words this clients vote on the network on what is bitcoin. 

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

The bitcoin network have rules but don't have rulers. The rules are enforced by software running on nodes and this nodes are controlled by anyone that are willing to do it. And because the hardware required doesn't need to be powerful, anyone can run their own node. A cheap old computer can do it like a dual core with 4GB of ram on even a small RPi3 can run a full node. 

To change the rules everyone controlling the nodes need to change the software running on it.

And if anyone can run a full node, the bitcoin network is decentralized and anyone can participate on it.

This is the revolution of bitcoin as decentralized and incorruptible voting system of equal participants.

And we are still grasping it's potential.
Bitcoin is a young technology and it's needs to grow, scale and embrace every challenge on it's path.

In our days we ear everyone talking about bitcoin and the blockchain revolution. 
Governments and banks say that the true revolution is the blockchain. In other words their blockchain and a voting system centralized here only a few can say what is valid or not.
And if you believe them, you will not understand what is the bitcoin and what it matters so much and why is beautiful.

## Building Armory

Follow the guide available on the git repository of Armory https://github.com/goatpig/BitcoinArmory/blob/master/linuxbuild/Linux_build_notes.md

Some notes about the process 

1. Clone Armory git repository 

   You can clone the repository using the master branch
   
   `$ git clone https://github.com/goatpig/BitcoinArmory.git`

   Or you can choose which branch you want to clone

   `$ git clone -b v0.96.3.992 --single-branch https://github.com/goatpig/BitcoinArmory.git`


2. Verify source authenticity

   ```bash
   $ cd BitcoinArmory/
   $ git tag -v v0.96.3.992
   $ git checkout v0.96.3.992
   ```

3. Clone libfcgi git repository

   ```bash
   $ mkdir libfcgi
   $ cd libfcgi
   $ git clone https://github.com/goatpig/libfcgi.git
   ```
    
4. Copy libfcgi to BitcoinArmory directory

   ```bash
   $ cp -av  libfcgi/. BitcoinArmory/cppForSwig/fcgi/
   $ rm BitcoinArmory/.gitmodules

   $ cd BitcoinArmory/
   $ ./autogen.sh
   $ ./configure
   $ make
   ```

## Armory Wallets

Armory is a very power full wallet when used properly.

Paper Wallets

Multi sign Wallets

Lock boxes 

...

## Air gaped machines 

Ideas

## Alternatives

bitkey

TREZOR wallet


## Support my work

![alt text](https://github.com/InserirAquiNome/crypto/blob/master/static/image/donate.png "Logo Title Text 1")
