A Set of Docker Images for Sakai
--------------------------------

These are some docker images for Sakai.  They live in a hierarchy so you can make
everything from a developer environment on localhost all the way up to an AWS image
that uses Aurora and EFS.  Or the nightly servers somewhere in-between.


For now we build three images - the `sakai_dev:latest` image is a developer instance
with all of the pieces running on one server.

    $ bash build.sh

    $ docker images
    REPOSITORY    TAG       IMAGE ID       CREATED              SIZE
    sakai_dev     latest    879bd23549af   About a minute ago   2.24GB
    sakai_mysql   latest    9caa50b6f148   2 minutes ago        2GB
    sakai_base    latest    f22565fcecf4   3 minutes ago        1.72GB

    $ docker run -p 8080:8080 --name sakai_base -dit sakai_base:latest
    $ docker logs 73c...e21
    $ docker attach 73c...e21
    $ docker exec -it sakai_base bash

    $ docker run -p 8080:8080 -p 3306:3306 --name sakai_mysql -dit sakai_mysql:latest
    $ docker logs 73c...e21
    $ docker attach 73c...e21
    $ docker exec -it sakai_mysql bash

Old:

    $ docker run -p 8080:80 -e TSUGI_SERVICENAME=TSFUN -e MYSQL_ROOT_PASSWORD=secret --name ubuntu -dit sakai_dev:latest
