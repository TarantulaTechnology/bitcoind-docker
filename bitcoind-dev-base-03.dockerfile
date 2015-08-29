FROM ubuntu-bitcoind-dev-base-02

####################################
# Bitcoin Core
####################################
RUN cd /src \
&& git clone https://github.com/bitcoin/bitcoin.git \
&& cd bitcoin \
&& git checkout v0.11.0 \
# Compile
&& ./autogen.sh \

&& ./configure CPPFLAGS="-I/src/db-4.8.30.NC/build_unix/build/include/ -O2" LDFLAGS="-L/src/db-4.8.30.NC/build_unix/build/lib/" \
&& make \
&& make install \

# add mkdir and echor for conf
&& mkdir /root/.bitcoin \
&& touch /root/.bitcoin/bitcoin.conf \
&& echo "rpcuser=alicebob\nrpcpassword=alicebob" > /root/.bitcoin/bitcoin.conf 