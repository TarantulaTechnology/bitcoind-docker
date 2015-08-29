
# Create machines for alice and bob
#docker-machine create --driver virtualbox alice
#docker-machine create --driver virtualbox bob

###############################
# ubuntu bitcoin base 01 -- ubuntu + core dev dependencies
###############################
bitcoind-dev-base-01:
	docker build -t ubuntu-bitcoind-dev-base-01 -f bitcoind-dev-base-01.dockerfile .

###############################
# ubuntu bitcoin base 02 -- added required Berkeley 4.8 DB dev
###############################
bitcoind-dev-base-02:
	docker build -t ubuntu-bitcoind-dev-base-02 -f bitcoind-dev-base-02.dockerfile .

###############################
# ubuntu bitcoin base 03 -- added Bitcoin dev
###############################
bitcoind-dev-base-03:
	docker build -t ubuntu-bitcoind-dev-base-03 -f bitcoind-dev-base-03.dockerfile .

###############################
# ubuntu bitcoin base final
###############################
bitcoind-dev-base-final:
	docker build -t ubuntu-bitcoind-dev-base-final -f bitcoind-dev-base-final.dockerfile .

###############################
# ubuntu bitcoin 0.11.0 -- all in one
###############################
bitcoind:
	docker build -t ubuntu-bitcoind-11 -f ubuntu.bitcoind.dockerfile .

###############################
# Alice -- bitcoind 0.11.0 
###############################
alice:
	docker run -it -p 18444:18444 --name=alice --hostname=alice ubuntu-bitcoind-11 bash

###############################
# Bob -- bitcoind 0.11.0 
###############################
bob:
	docker run -it -p 18444:18444 --name=bob --hostname=bob ubuntu-bitcoind-11 bash
