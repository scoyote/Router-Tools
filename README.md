This repositiory contains tools that I am using to extract detailed MAC level information on my local network. I am using bwmon running on a dd-wrt powered router to generate the proper counters, then the attached python programs to analyze the output. 

My router does not have enough memory to run python locally effectiely, so until I upgrade I am stuck having to run this remote. A good TODO would be to upgrade the router, then have this run at 5AM to send an update email to whom it may concern.

This all began when I got flagged by comcast for going over 250GB/month for several months. This should not have been happening and I wanted to find out what was causing the trouble. Interestingly enough, there were no routers on the market that provided mac level monitoring or even the capability of mac level monitoring so I had a couple of options. The first was to use a RPi to function as the router, but that was a little more than I wanted to do for my main router so I went with a Buffalo router flashed at the factory to dd-wrt operating system. With an open OS for the router, I could then run shell scripts that periodically collect counters on every device on the network for up and downstream packets. I found that someone had already created these scripts https://github.com/vortex-5/ddwrt-bwmon so I am using that as the main kernel. THey are fairly easy to understand and they work well without much modification. 

The other wrinkle in my setup is that my router does not have any permanent storage, so if it ever goes down, the bwmon kernel and all associated shell scripts that I have included in my setup have to be re-installed to the router. I used to have this happen as a cron job sitting on a Rpi to look for the files then scp them over if they aremissing. Apparently this no longer happens... I need to restart this process.

Remember, this router has volitile memory…

Here are some handy SCPs that I use specific to my installation.

Backup the bwmon directory:
scp -i ~/.ssh/router -r root@192.168.11.1:/var/bwmon ~/Documents/repositories/Router-Tools/

If the router goes down, you have to do this to restore BWMON:
scp -i ~/.ssh/router -r ~/Documents/repositories/Router-Tools/bwmon root@192.168.11.1:/var
scp -i ~/.ssh/router mac-names.txt root@192.168.11.1:/tmp/var/bwmon/www/mac-names.js
The cron jobs are saved in the dd-wrt app, which appears not to be volitile. We should check that out sometime.

Grab the daily updates:
scp -i ~/.ssh/router root@192.168.11.1:/var/bwmon/data/*.dat ~/Documents/routerdata
