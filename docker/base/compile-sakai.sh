#! /bin/bash

cd /root/sakai
export MAVEN_OPTS='-Xms512m -Xmx1024m -Djava.util.Arrays.useLegacyMergeSort=true'
mvn -T 2 -e -Dmaven.test.skip=true clean install

