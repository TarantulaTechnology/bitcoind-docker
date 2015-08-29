FROM ubuntu-bitcoind-dev-base-01

####################################
# Source
####################################
RUN mkdir -p /src && cd /src \

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
&& make install 