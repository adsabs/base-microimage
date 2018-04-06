#!/bin/bash

if [ ! -z ${ADS_DEBUG} ] && [ ${ADS_DEBUG} = "True" ]; then
    mkdir -p /etc/service/gunicorn/
    ln -sf /app/gunicorn.sh /etc/service/gunicorn/run
    /sbin/my_init
else
    rm -rf /etc/service/gunicorn/
    /usr/local/bin/gunicorn --config /gconfig/gunicorn.conf.py --log-config /gconfig/logging.conf wsgi:application
fi
