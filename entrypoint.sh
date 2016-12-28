#!/bin/bash

cd /opt/koding_rds_demo
sed -i "s/words:w0rdsw0rds@localhost/root:hello@mysql/" config/settings.py
mysql -u root -phello -h mysql -e "create database words"
python reset_db.py
gunicorn api:APP -b 0.0.0.0 