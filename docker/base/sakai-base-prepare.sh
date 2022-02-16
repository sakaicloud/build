
echo ======= Installing Postfix
echo "postfix postfix/mailname string example.com" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
apt-get install -y mailutils

echo ====== Check out build scripts if they are not already there
if [ ! -d "/root/build" ]; then
    git clone https://github.com/sakaicloud/build.git /root/build
fi

echo ====== Check out sakai source if they are not already there
if [ ! -d "/root/sakai" ]; then
    git clone https://github.com/sakaiproject/sakai.git /root/sakai
    cd /root/sakai
    git fetch --all
    git checkout 22.x
fi

# We compile Sakai to populate the .m2 folder - while we have a great network connection
echo ======= Compile Sakai
source "/root/.sdkman/bin/sdkman-init.sh"
bash /usr/local/bin/compile-sakai.sh
echo ======= Compile Sakai Done

echo ======= Cleanup Start
df
apt-get -y autoclean
apt-get -y clean
apt-get -y autoremove
rm -rf /var/lib/apt/lists/*
echo ======= Cleanup Done
df
echo ======= Cleanup Done

