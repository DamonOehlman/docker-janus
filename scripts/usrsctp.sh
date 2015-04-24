#!/usr/bin/env bash
svn co http://sctp-refimpl.googlecode.com/svn/trunk/KERN/usrsctp $DEPS_HOME/dl/usrsctp
cd $DEPS_HOME/dl/usrsctp
./bootstrap
./configure --prefix=$DEPS_HOME && make && make install
