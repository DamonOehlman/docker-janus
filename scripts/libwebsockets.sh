#!/usr/bin/env bash
git clone https://libwebsockets.org/repo/libwebsockets $DEPS_HOME/dl/libwebsockets
cd $DEPS_HOME/dl/libwebsockets
git checkout "${WEBSOCKETS_VERSION}"
mkdir build
cd build
# See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
make && make install
