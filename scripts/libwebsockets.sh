#!/usr/bin/env bash
git clone git://git.libwebsockets.org/libwebsockets $DEPS_HOME/dl/libwebsockets
cd $DEPS_HOME/dl/libwebsockets
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$DEPS_HOME ..
make && make install
