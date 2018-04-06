#!/bin/bash

mkdir -p /tmp/cache
rm -fr /tmp/cache/*

# if stale, gunicorn refuses to start
rm /tmp/gunicorn*.pid

pushd /app
gunicorn --config /gconfig/gunicorn.conf.py --log-config /gconfig/logging.conf wsgi:application
