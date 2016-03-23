#!/usr/bin/env bash

acbuild --debug begin

acbuild --debug set-name example.com/mysql

acbuild --debug dep add quay.io/appcontainers/ubuntu:latest
acbuild --debug set-user root 

acbuild --debug port add dns udp 53
#acbuild --debug run -- chmod 755 /
acbuild --debug run -- apt-get update
acbuild --debug run -- apt-get -y install mysql-server-5.6
acbuild --debug copy /root/mysql/my.cnf /etc/mysql/conf.d/my.cnf
acbuild --debug copy /root/mysql/br.sql br.sql
acbuild --debug copy /root/mysql/run.sh /usr/local/bin/run
acbuild --debuf run -- chmod 755 /usr/local/bin/run
acbuild --debug port add mysql tcp 3306
acbuild --debug mount add mysql /var/lib/mysql
acbuild --debug set-exec -- /usr/local/bin/run ;
acbuild --debug write --overwrite /root/mysqldb.aci

acbuild --debug end

