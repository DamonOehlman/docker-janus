FROM ubuntu:14.04

# bootstrap environment
ENV DEPS_HOME="/root/deps"
ENV SCRIPTS_PATH="/tmp/scripts"

# use aarnet mirror for quicker building while developing
RUN sed -i 's/archive.ubuntu.com/mirror.aarnet.edu.au\/pub\/ubuntu\/archive/g' /etc/apt/sources.list

# install baseline package dependencies
RUN apt-get -y update && apt-get install -y libmicrohttpd-dev \
  libjansson-dev \
  libnice-dev \
  libssl-dev \
  libsrtp-dev \
  libsofia-sip-ua-dev \
  libglib2.0-dev \
  libopus-dev \
  libogg-dev \
  libini-config-dev \
  libcollection-dev \
  pkg-config \
  gengetopt \
  libtool \
  automake \
  build-essential \
  subversion \
  git

ADD scripts/bootstrap.sh $SCRIPTS_PATH
RUN $SCRIPTS_PATH/bootstrap.sh

ADD scripts/usrsctp.sh $SCRIPTS_PATH
RUN $SCRIPTS_PATH/usrsctp.sh

ADD scripts/libwebsockets.sh $SCRIPTS_PATH
RUN $SCRIPTS_PATH/libwebsockets.sh
