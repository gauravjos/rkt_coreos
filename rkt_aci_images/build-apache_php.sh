#!/usr/bin/env bash

acbuild --debug begin

acbuild --debug set-name example.com/apache2_php

acbuild --debug dependency add quay.io/appcontainers/ubuntu
acbuild --debug set-user root 

acbuild --debug port add dns udp 53
acbuild --debug run -- chmod 755 /
acbuild --debug run -- apt-get update
acbuild --debug run -- apt-get -y install apache2 apache2-utils php5-common php5-mysql php5-gd
acbuild --debug copy /root/app /app
acbuild --debug copy /root/run.sh /run.sh

acbuild --debug port add http tcp 80

acbuild --debug set-exec -- /run.sh ;
acbuild --debug write --overwrite /root/apache2_php.aci

acbuild --debug end

