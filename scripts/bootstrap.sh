#!/usr/bin/env bash

# dependency locations (no sudo required)
mkdir -p $DEPS_HOME/dl
mkdir -p $DEPS_HOME/share

cat << EOF > $DEPS_HOME/share/config.site
CPPFLAGS=-I$DEPS_HOME/include
LDFLAGS=-L$DEPS_HOME/lib
EOF
