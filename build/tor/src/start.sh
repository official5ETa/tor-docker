#!/bin/bash

cp -vf /etc/tor/torrc_template /etc/tor/torrc
sed -i "s/<TOR_HOST>/$TOR_HOST/" /etc/tor/torrc

service tor start
tor