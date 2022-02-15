
sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C.UTF-8
locale -a
env

echo ======= Update 1
apt -y update

echo ======= Upgrade
apt -y upgrade
apt-get install -y build-essential
apt-get install -y software-properties-common
apt-get install -y byobu curl git htop man unzip vim wget zip
apt-get install -y apt-utils
apt-get install -y mysql-client-8.0
apt-get install -y nfs-common
if [ ! -f "/usr/bin/crontab" ]; then
    apt-get install -y cron
fi

# Install sdkman
cd /root
curl -s "https://get.sdkman.io" | bash
source "/root/.sdkman/bin/sdkman-init.sh"

sdk install java 11.0.12-tem
sdk install maven 3.8.1

source "/root/.sdkman/bin/sdkman-init.sh"

TOMCAT_VERSION=9.0.21
useradd -m -U -d /opt/tomcat -s /bin/false tomcat
cd /root
curl -O http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION:0:1}/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
tar -xf /root/apache-tomcat-$TOMCAT_VERSION.tar.gz -C /opt/tomcat
chown -R tomcat: /opt/tomcat
chmod +x /opt/tomcat/latest/bin/*.sh

echo ======= Installing Node and Friends
apt-get install -y nodejs
node --version
apt-get install -y npm
# https://phoenixnap.com/kb/update-node-js-version
npm install -g n
PATH="$PATH"
n stable
PATH="$PATH"

npm --version
echo === Installing certbot - https://certbot.eff.org/lets-encrypt/ubuntufocal-apache
snap install core
snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot

echo === Installed versions
echo -n "Node " ; node --version
echo -n "npm " ; npm --version
php --version
mysql --version
lsb_release -a

# Cleanup is outside this file

