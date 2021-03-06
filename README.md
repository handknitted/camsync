The aim of this script is to copy image files from a motioneyeOS machine and delete them to ensure space remains for continued operation.

It is intended that the script can be entered into crontab and run periodically to suit the space available and the data consumption rate.

The script is minimal and uses 'find' and 'rsync' in a straightforward way.  Particularly any user should consider whether the 'find' command is suitable and there is very little safeguard to prevent it deleting important data if set up is not correct.

Open a console on the motioneyeos machine then:

    mkdir /data/bin
    mkdir -p /data/conf/keys
    # when generating the ssh key use /data/conf/keys/id_rsa as the path to
    # store the key as the /root path is read-only 
    ssh-keygen
    # you will need to copy the id_rsa.pub contents to the 'authorized_keys'
    # file on the target user's account on the target machine
    
Copy the `bin/sync.sh` script to the motioneyeos machine at `/data/bin`, the `conf/env.sh` (completed with the appropriate values for your set up) to `/data/conf/.`.

How to add to cron

On the motioneyeos machine, as root (this might be revised as it's not a good practice to have root running things in cronif somebody else could)

    EDITOR="vi" crontab -e
    
and add a line

    5 02 * * * . /data/conf/env.sh && /data/bin/sync.sh 
    
or something like.  This line sets the script to run once a day at five minutes past two a.m. I think.