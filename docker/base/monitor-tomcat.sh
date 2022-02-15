#! /bin/bash

while : 
do
  echo Monitoring Tomcat Logs `date`
  tail -F /opt/tomcat/catalina/logs/catalina.out
  echo Tomcat Log Monitoring Failed `date`
  echo Waiting to re-try log monitoring...
  sleep 120
done

# https://stackoverflow.com/questions/2935183/bash-infinite-sleep-infinite-blocking
echo "Sakai Base Sleeping forever..."
while :; do sleep 2073600; done
