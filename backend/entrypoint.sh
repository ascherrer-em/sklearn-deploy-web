#!/bin/bash

echo "Starting gunicorn"
/usr/local/bin/gunicorn -c gunicorn.conf.py app:app --reload
echo "Done"