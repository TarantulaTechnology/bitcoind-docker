FROM ubuntu

####################################
# Dependency
####################################
RUN apt-get -y update && apt-get install -y \
      build-essential         \
      wget                    \
      git                     \
      autoconf                \
      libboost-all-dev        \
      libssl-dev              \
      libprotobuf-dev         \
      protobuf-compiler       \
      libqt4-dev              \
      libqrencode-dev         \
      libtool                 \
      libdata-hexdumper-perl  \
      bsdmainutils            \
      curl			      \
      pkg-config

####################################
# Source
####################################
RUN mkdir -p src && cd src \

####################################
# Berkeley DB 4.8.30
####################################
&& wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz \
&& echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c \
&& tar -xvf db-4.8.30.NC.tar.gz \
&& cd db-4.8.30.NC/build_unix \
&& mkdir -p build \
&& BDB_PREFIX=$(pwd)/build \
&& ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX \
&& make install \

####################################
# Bitcoin Core
####################################
&& cd ../.. \
&& git clone https://github.com/bitcoin/bitcoin.git \
&& cd bitcoin \
&& git checkout v0.11.0 \
# Compile
&& ./autogen.sh \
&& ./configure CPPFLAGS="-I${BDB_PREFIX}/include/ -O2" LDFLAGS="-L${BDB_PREFIX}/lib/" \
&& make \
&& make install \

# add mkdir and echo for conf
&& mkdir /root/.bitcoin \
&& touch /root/.bitcoin/bitcoin.conf \
&& echo "rpcuser=alicebob\nrpcpassword=alicebob" > /root/.bitcoin/bitcoin.conf 

####################################
# test
####################################
#bitcoind --help
#bitcoin-cli --help

