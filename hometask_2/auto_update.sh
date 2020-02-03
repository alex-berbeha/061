#!/bin/bash
value=$(crontab -l | grep -ic auto_update)
if [ $value -eq 0 ]
then
        path=`pwd`/auto_update.sh
        crontab -l > cron.txt
        echo "0 0 * * 0 $path > /var/log/update-\`date +\%Y\%m\%d\`.log 2>&1" >> cron.txt
        crontab -u root cron.txt
        rm cron.txt
fi
apt-get -y update && apt-get -y upgrade


#or you can use this script
#if ! [ -f /etc/cron.weekly/auto_apdate ]
#then
#   echo "#!/bin/bash" > /etc/cron.weekly/auto_apdate
#   echo "apt-get -y update && apt-get -y upgrade > /var/log/update-\`date +\%Y\%m\%d\`.log 2>&1" >> /etc/cron.weekly/auto_apdate
#   chmod +x /etc/cron.weekly/auto_apdate
#fi
#apt-get -y update && apt-get -y upgrade

if ! [ -f /etc/logrotate.d/update_log.conf ]
then

    echo "/var/log/update-* {" > /etc/logrotate.d/update_log.conf
    echo "  weekly" >> /etc/logrotate.d/update_log.conf
    echo "  rotate 3" >> /etc/logrotate.d/update_log.conf
    echo "  missingok" >> /etc/logrotate.d/update_log.conf
    echo "}" >> /etc/logrotate.d/update_log.conf
fi


