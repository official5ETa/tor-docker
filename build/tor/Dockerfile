FROM ubuntu

ENV TOR_HOST=127.0.0.1:80

WORKDIR /home/tor
COPY src/start.sh ./
COPY src/hostname.sh /usr/local/bin/tor-hostname

RUN apt  update \
 && apt  install -y wget gpg apt-transport-https \
 && wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg \
 \
 && apt  update \
 && apt  install -y tor \
 && rm   -vrf /var/lib/apt/lists/*

COPY src/torrc /etc/tor/torrc_template

RUN mkdir -vp /run/tor              \
 && chown -vR debian-tor:           \
        /run/tor                    \
        /etc/tor/torrc_template     \
 && chmod -vR a=rx                  \
        /etc/tor/torrc_template     \
        /usr/local/bin/tor-hostname \
        start.sh                    \
 && chmod -v  a+w                   \
        /etc/tor

USER debian-tor
ENTRYPOINT ["./start.sh"]