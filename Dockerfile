FROM ubuntu:16.04

LABEL maintainer="Sergey Galkin <sergey.gals@gmail.com>"

RUN apt-get update && \
    apt-get install -y openvpn iptables bash easy-rsa openvpn-auth-ldap && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* /var/lib/apt/lists/*

ENV OPENVPN /etc/openvpn

VOLUME ["/etc/openvpn"]

EXPOSE 2345/udp

CMD ["ovpn_run"]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*