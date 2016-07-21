#!/usr/bin/env bash
git clone https://github.com/sctplab/usrsctp.git $DEPS_HOME/dl/usrsctp
cd $DEPS_HOME/dl/usrsctp
./bootstrap
./configure --prefix=$DEPS_HOME && make && make install
