#!/usr/bin/env bash

acbuild --debug begin

acbuild --debug set-name example.com/apache2_ubuntu

acbuild --debug dep add quay.io/appcontainers/ubuntu
acbuild --debug set-user root 

acbuild --debug port add dns udp 53
#acbuild --debug copy /etc/network/interfaces /etc/network/interfaces
#acbuild --debug run apt-get update
acbuild --debug run -- chmod 755 /
acbuild --debug run -- apt-get update
acbuild --debug run -- apt-get -y install apache2 apache2-utils
#acbuild --debug mount add html /var/www/html

acbuild --debug port add http tcp 80

acbuild --debug set-exec -- /usr/sbin/apache2ctl -D 'FOREGROUND' ;
acbuild --debug write --overwrite apache2_ubuntu.aci

acbuild --debug end

