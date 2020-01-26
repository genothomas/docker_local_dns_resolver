#!/bin/bash
curl -o /opt/bind/etc/named.root "ftp://ftp.internic.net/domain/named.root"
/opt/bind/sbin/rndc-confgen > /opt/bind/etc/rndc.conf
cat /opt/bind/etc/rndc.conf | head -n 5 | grep -v "^#" > /opt/bind/etc/rndc.key
/usr/bin/supervisord -c /etc/supervisord.conf --nodaemon
