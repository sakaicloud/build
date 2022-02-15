
echo ======= Installing Postfix
echo "postfix postfix/mailname string example.com" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
apt-get install -y mailutils

echo ====== Check out build scripts if they are not already there
if [ ! -d "/root/tsugi-build" ]; then
    git clone https://github.com/tsugiproject/tsugi-build.git /root/tsugi-build
fi
echo ======= Cleanup Start
df
apt-get -y autoclean
apt-get -y clean
apt-get -y autoremove
rm -rf /var/lib/apt/lists/*
echo ======= Cleanup Done
df
echo ======= Cleanup Done
