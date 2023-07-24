#!/bin/bash

cp -f /etc/tor/torrc_template /etc/tor/torrc
sed -i "s/<TOR_HOST>/$TOR_HOST/" /etc/tor/torrc

chown -R debian-tor: /var/lib/tor/hidden_service/
chmod 700 /var/lib/tor/hidden_service/

service tor start
su - debian-tor -c "tor"

sleep infinity