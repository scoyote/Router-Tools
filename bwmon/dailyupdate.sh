#!/bin/sh
dtvar=daily_`date +%Y%m%d`.dat

cp /var/bwmon/data/usage.js /var/bwmon/data/$dtvar

