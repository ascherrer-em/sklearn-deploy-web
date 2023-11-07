#!/bin/bash

echo "Starting gunicorn"
/usr/local/bin/gunicorn -c gunicorn_dev.conf.py app:app --reload
echo "Done"