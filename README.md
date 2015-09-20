# bitcoind-docker
Build bitcoind on Ubuntu in Docker!

Review the Makefile for commands.

bitcoind-dev-base-01, 2, and 3 are dockerfiles for each step encapusulating

1) core dev requirements,

2) Berkely DB 4.8,

3) Bitcoin Core.


bitcoind-dev-base-final is a wrapper on 3.

You run bitcoind-dev-base-01, 2, 3, and then use final. 

Or you can build everything from one dockerfile then use ubuntu.bitcoind.dockerfile, which contains the commands from bitcoind-dev-base-01, 2, and 3.

I don't store the built image, because it is over 3 gig, I prefer to git clone this repo and use the dockerfiles to build 
the image locally. Once built bitcoind can be run as often as desired.

Commands to create bob and alice VMs for Docker:

docker-machine create --driver virtualbox alice

docker-machine create --driver virtualbox bob

Connect to alice:

eval $(docker-machine env alice)

Connect to bob:

eval $(docker-machine env bob)

Some example commands that can be executed after build and running two instances, alice and bob:

docker exec alice bitcoin-cli -regtest getinfo

docker exec alice bitcoin-cli -regtest help

docker exec alice bitcoin-cli -regtest getwalletinfo

docker exec alice bitcoin-cli -regtest settxfee 0.0000001

docker exec alice bitcoin-cli -regtest getwalletinfo

docker exec alice bitcoin-cli -regtest generate 25

docker exec alice bitcoin-cli -regtest getmininginfo

docker exec alice bitcoin-cli -regtest getconnectioncount

docker exec alice bitcoin-cli -regtest getpeerinfo


Have fun!



