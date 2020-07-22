#!/usr/bin/env bash
git clone https://github.com/eclipse/paho.mqtt.c.git $DEPS_HOME/dl/mqtt
cd $DEPS_HOME/dl/mqtt
make && make install
