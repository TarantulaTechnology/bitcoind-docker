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

