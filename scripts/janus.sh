#!/usr/bin/env bash

# create a self signed cert for the server
mkdir -p $DEPS_HOME/certs/
openssl req \
  -new \
  -newkey rsa:4096 \
  -days 365 \
  -nodes \
  -x509 \
  -subj "/C=US/ST=CA/L=San Francisco/O=int80 DBA/CN=janus.poz.party" \
  -keyout $DEPS_HOME/certs/janus.key \
  -out $DEPS_HOME/certs/janus.pem

wget https://github.com/meetecho/janus-gateway/archive/$JANUS_RELEASE.tar.gz -O  $DEPS_HOME/dl/janus.tar.gz

cd $DEPS_HOME/dl
tar xf janus.tar.gz
cd janus*
./autogen.sh

# TODO: fix websocket support as it should work
./configure --prefix=$DEPS_HOME --disable-rabbitmq --disable-docs
make
make install

# make the janus configuration
cat << EOF > $DEPS_HOME/etc/janus/janus.cfg
[general]
configs_folder=$DEPS_HOME/etc/janus
plugins_folder=$DEPS_HOME/lib/janus/plugins
debug_level=4

[webserver]
base_path=/janus
threads=unlimited
http=no
https=yes
secure_port=8089

[admin]
admin_base_path=/admin
admin_threads=unlimited
admin_http=no
admin_https=yes
admin_secure_port=7889
; admin_acl=127.0.0.1

[certificates]
cert_pem=$DEPS_HOME/certs/janus.pem
cert_key=$DEPS_HOME/certs/janus.key
EOF
