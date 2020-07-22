#!/usr/bin/env bash

git clone https://gitlab.freedesktop.org/libnice/libnice.git $DEPS_HOME/dl/libnice
cd $DEPS_HOME/dl/libnice
meson --prefix=/usr build && ninja -C build && ninja -C build install
