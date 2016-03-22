#!/usr/bin/env bash

acbuild begin

acbuild set-name example.com/nginx

acbuild dependency add registry-1.docker.io/library/nginx:latest

acbuild mount add html /usr/share/nginx/html

acbuild port add http tcp 80

acbuild set-exec -- /usr/sbin/nginx -g "daemon off;"

acbuild write nginx.aci

acbuild end



