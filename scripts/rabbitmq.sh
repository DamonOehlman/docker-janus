#!/usr/bin/env bash
git clone https://github.com/alanxz/rabbitmq-c $DEPS_HOME/dl/rabbitmq-c
cd $DEPS_HOME/dl/rabbitmq-c
git submodule init
git submodule update
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make && make install
