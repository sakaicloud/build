
# Tsugi plus mysql
# docker build --tag sakai_dev .
# docker run -p 8080:80 -p 3306:3306 -e TSUGI_SERVICENAME=TSFUN -dit sakai_dev:latest

# Navigate to http://localhost:8080

# To log in and dig around...
# docker attach d37...

# To re-generate
# docker container prune
# docker image rm sakai_dev:latest

FROM sakai_mysql:latest

COPY sakai-dev-software.sh /usr/local/bin
COPY sakai-dev-configure.sh /usr/local/bin

RUN bash /usr/local/bin/sakai-base-software.sh

COPY ./www /root/www
COPY ./phpMyAdmin-5.1.1-all-languages.zip /root/phpMyAdmin-5.1.1-all-languages.zip

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

EXPOSE 80 443 3306
ENTRYPOINT ["bash", "/usr/local/bin/sakai-dev-configure.sh"]

# Define default command.
CMD ["bash"]
