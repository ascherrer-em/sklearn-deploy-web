#!/bin/bash

echo "Starting application"
cd /usr/src/app
echo `ls /usr/src/app`
/usr/local/bin/gunicorn -c gunicorn.conf.py app:app --reload
echo "Done!"