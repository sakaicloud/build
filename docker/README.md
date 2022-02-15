A Set of Docker Images for Sakai
--------------------------------

These are some docker images for Sakai.  They live in a hierarchy so you can make
everything from a developer environment on localhost all the way up to an AWS image
that uses Aurora and EFS.  Or the nightly servers somewhere in-between.


For now we build three images - the `sakai_dev:latest` image is a developer instance
with all of the pieces running on one server.

    $ docker images    (make sure they all build)

    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    sakai_base          latest              b7199f92080c        3 minutes ago       585MB

    $ docker run -p 8080:8080 --name sakai_base -dit sakai_base:latest
    $ docker exec -it sakai_base bash
    $ docker attach 73c...e21

Old:

    $ docker run -p 8080:80 -e TSUGI_SERVICENAME=TSFUN -e MYSQL_ROOT_PASSWORD=secret --name ubuntu -dit sakai_dev:latest
