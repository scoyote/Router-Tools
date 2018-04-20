scp -i ~/.ssh/router -r ~/Documents/repositories/Router-Tools/bwmon root@192.168.11.1:/var
scp -i ~/.ssh/router mac-names.txt root@192.168.11.1:/tmp/var/bwmon/www/mac-names.js

echo "Now issue the folllowing commands "
echo "ssh -i ~/.ssh/router root@192.168.11.1"
echo "/var/bwmon/start.sh"
