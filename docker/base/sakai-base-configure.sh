#! /bin/bash 

echo "Running Base Configure"

COMPLETE=/usr/local/bin/sakai-base-complete
if [ -f "$COMPLETE" ]; then
    echo "Base configure already has run"
else

# Save the Environment Variables for later cron jobs if we are starting from Docker
if [ ! -f "/root/ubuntu-env.sh" ] ; then
    echo "# created from sakai-base-configure.sh" > /root/ubuntu-env.sh
    env | sort | grep '^SAKAI' | sed 's/^/export /' >>  /root/ubuntu-env.sh
    env | sort | grep '^POSTFIX' | sed 's/^/export /' >>  /root/ubuntu-env.sh
    env | sort | grep '^MYSQL' | sed 's/^/export /' >>  /root/ubuntu-env.sh
    env | sort > /root/sakai-env-raw-dump
fi

# TODO: More stuff here

# if COMPLETE
fi

touch $COMPLETE

echo "Environment variables:"
env | sort

echo ""
if [ "$@" == "return" ] ; then
  echo "Sakai Base Returning..."
  exit
fi

exec bash /usr/local/bin/monitor-tomcat.sh

# Should never happen
# https://stackoverflow.com/questions/2935183/bash-infinite-sleep-infinite-blocking
echo "Sakai Base Sleeping forever..."
while :; do sleep 2073600; done


