# bitcoind-docker
Build bitcoind on Ubuntu in Docker!

Review the Makefile for commands.

1,2,3 are dockerfiles for each step encapusulating 1)core dev requirements, 2) Berkely DB 4.8, 3) Bitcoin Core.
final is just a wrapper on 3. 

You can run 1,2,3,and then use final or bitcoind which contains 1,2,3.

I don't store the image because it is over 3 gig, I perfer to clone this and use the dockerfile(s) to build the image loacally. Once built it can be rerun as often as desired.

Have fun!

