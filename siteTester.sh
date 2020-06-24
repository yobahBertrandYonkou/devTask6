#!/bin/bash
sudo sleep 10

nstatus=200

status=$(curl -o /dev/null/ -s -w "%{http_code}" 192.168.99.100:32000)


if [ "$status" == "$nstatus" ]
then
echo "Server up and running"
else
echo "Error detected"
echo "Status code $status"
echo "Sending mail to developer"
sudo python3 /var/lib/jenkins/workspace/repoGetter/mail.py
echo "Mail Successful"
exit 1
fi