FROM ubuntu:20.04

# system config
ENV DEPS_HOME="/root/janus"
ENV SCRIPTS_PATH="/tmp/scripts"
ENV DEBIAN_FRONTEND="noninteractive"
ENV DEBCONF_NONINTERACTIVE_SEEN="true"
ENV TZ_ZONE="UTC"

# dpeendency versions
ENV SRTP_VERSION="2.2.0"
ENV WEBSOCKETS_VERSION="3.2-stable"

# janus config
ENV JANUS_CONFIG_PATH="/root/janus/etc/janus"
ENV JANUS_RELEASE="0.10.3"
ENV JANUS_CERT_SUBJECT="/C=AU/ST=NSW/L=Sydney/O=JanusDemo/CN=janus.test.com"

# configure the default timezone
RUN ln -fs /usr/share/zoneinfo/${TZ_ZONE} /etc/localtime

# install baseline package dependencies
RUN apt-get -y update && apt-get install -y \
  libmicrohttpd-dev \
  libjansson-dev \
  libssl-dev \
  libsofia-sip-ua-dev \
  libglib2.0-dev \
  libopus-dev \
  libogg-dev \
  libcurl4-openssl-dev \
  liblua5.3-dev \
  libconfig-dev \
  pkg-config \
  gengetopt \
  libtool \
  automake \
  build-essential \
  subversion \
  git \
  cmake \
  wget \
  python3-pip \
  ninja-build
RUN apt-get install -y libnanomsg-dev

RUN dpkg-reconfigure --frontend noninteractive tzdata

ADD scripts ${SCRIPTS_PATH}

RUN ${SCRIPTS_PATH}/python-tools.sh
RUN ${SCRIPTS_PATH}/bootstrap.sh
RUN ${SCRIPTS_PATH}/libnice.sh
RUN ${SCRIPTS_PATH}/libsrtp.sh
RUN ${SCRIPTS_PATH}/usrsctp.sh
RUN ${SCRIPTS_PATH}/libwebsockets.sh
RUN ${SCRIPTS_PATH}/mqtt.sh
RUN ${SCRIPTS_PATH}/rabbitmq.sh
RUN ${SCRIPTS_PATH}/janus.sh

CMD ["/root/janus/bin/janus"]
