echo "Running dev Configure"

bash /usr/local/bin/sakai-mysql-configure.sh return

COMPLETE=/usr/local/bin/sakai-dev-complete
if [ -f "$COMPLETE" ]; then
    echo "Dev configure already has run"
else

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
MYSQL_ROOT_PASSWORD=root
fi

if [ -z "$TSUGI_USER" ]; then
TSUGI_USER=ltiuser
fi

if [ -z "$TSUGI_PASSWORD" ]; then
TSUGI_PASSWORD=ltipassword
fi

mysql -u root --password=$MYSQL_ROOT_PASSWORD << EOF
    CREATE DATABASE IF NOT EXISTS sakai DEFAULT CHARACTER SET utf8;
    GRANT ALL ON sakai.* TO '$TSUGI_USER'@'localhost' IDENTIFIED BY '$TSUGI_PASSWORD';
    GRANT ALL ON sakai.* TO '$TSUGI_USER'@'127.0.0.1' IDENTIFIED BY '$TSUGI_PASSWORD';
EOF

echo "Updating build scripts..."
cd /root/sakai-build
git pull

bash /root/sakai-build/common/sakai-common-configure.sh

echo "Installing phpMyAdmin"
rm -rf /var/www/html/phpMyAdmin
cd /root
unzip phpMyAdmin-5.1.1-all-languages.zip
mv phpMyAdmin-5.1.1-all-languages /var/www/html/phpMyAdmin
rm phpMyAdmin-5.1.1-all-languages.zip

# if COMPLETE
fi

touch $COMPLETE

echo ""
if [ "$@" == "return" ] ; then
  echo "Tsugi Dev Returning..."
  exit
fi

exec bash /usr/local/bin/monitor-tomcat.sh

# Should never happen
# https://stackoverflow.com/questions/2935183/bash-infinite-sleep-infinite-blocking
echo "Tsugi Dev Sleeping forever..."
while :; do sleep 2073600; done
