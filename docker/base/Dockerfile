
# Sakai base PHP docker

# docker build --tag sakai_base .
# docker run -p 8080:80 -p 3306:3306 -e BOB=42 -dit sakai_base:latest

# To redo
# docker container prune
# docker image rm sakai_dev:latest sakai_mysql:latest sakai_base:latest

# Pull base image.
FROM ubuntu:20.04

COPY sakai-base-software.sh /usr/local/bin/
COPY sakai-base-prepare.sh /usr/local/bin/
COPY sakai-base-configure.sh /usr/local/bin/
COPY compile-sakai.sh /usr/local/bin

# Install.
RUN bash /usr/local/bin/sakai-base-software.sh
RUN bash /usr/local/bin/sakai-base-prepare.sh

#  apt-get install -y mailutils

# Setup files
COPY monitor-tomcat.sh /usr/local/bin/

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root


EXPOSE 80 443
ENTRYPOINT ["bash", "/usr/local/bin/sakai-base-configure.sh"]

# Define default command.  (Should never get here)
CMD ["bash"]
