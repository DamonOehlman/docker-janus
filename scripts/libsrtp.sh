#!/usr/bin/env bash
wget "https://github.com/cisco/libsrtp/archive/v${SRTP_VERSION}.tar.gz"
tar xfv "v${SRTP_VERSION}.tar.gz"
cd "libsrtp-${SRTP_VERSION}"
./configure --prefix=/usr --enable-openssl
make shared_library && make install
