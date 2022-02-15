

sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C.UTF-8
locale -a
env

echo ======= Update 1
apt -y update

echo ======= Upgrade
apt -y upgrade
apt-get install -y ca-certificates
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
echo ======= Update 2
apt update
add-apt-repository -y ppa:ondrej/php
add-apt-repository -y ppa:ondrej/apache2
add-apt-repository -y universe
apt update
apt-get install -y apache2
apt-get install -y php8.0
apt-get install -y libapache2-mod-php8.0 php8.0-mysql php8.0-curl
apt-get install -y php8.0-mbstring php8.0-zip php8.0-xml php8.0-gd
apt-get install -y php8.0-apcu
apt-get install -y php8.0-intl
apt-get install -y php8.0-memcached php8.0-memcache
a2enmod -q rewrite dir expires headers
phpenmod mysqlnd pdo_mysql intl

echo === Installed versions
echo -n "Node " ; node --version
echo -n "npm " ; npm --version
php --version
mysql --version
lsb_release -a

# Cleanup is outside this file

