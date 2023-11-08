#!/bin/bash

echo "Starting gunicorn"
cd /usr/src/app
ls 
/usr/local/bin/gunicorn -c gunicorn.conf.py app:app --reload
echo "Done"