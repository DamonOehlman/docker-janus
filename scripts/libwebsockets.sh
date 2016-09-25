#!/usr/bin/env bash
git clone git://git.libwebsockets.org/libwebsockets $DEPS_HOME/dl/libwebsockets
cd $DEPS_HOME/dl/libwebsockets
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$DEPS_HOME -DLWS_WITH_HTTP2=1 -DLWS_SERVER_OPTION_DO_SSL_GLOBAL_INIT=1 -DLWS_IPV6=1 ..
make && make install
