#!/bin/sh
dtvar=hourly_`date +%Y%m%d_%H_%M`.dat

cp /var/bwmon/data/usage.js /var/bwmon/data/$dtvar
sleep 2

rm "/var/bwmon/data/usage.js" 
rm /tmp/www/usage.js
rm /tmp/www/usage_stats.js
rm /tmp/traffic_*.tmp
rm /tmp/sorted_*.tmp
