#!/bin/sh

sudo chmod 777 /etc/hosts
cat /etc/hosts.local >> /etc/hosts

/usr/sbin/sshd
source "/etc/profile.d/hadoop-env.sh" && echo $PATH && hdfs namenode -format
ldap.sh start
mkdir -p $KNOX_HOME/data/security/
echo '#1.0#' > $KNOX_HOME/data/security/master
# Make sure to read and understand the "Persisting the Master Secret" paragraph : http://knox.incubator.apache.org/books/knox-0-3-0/knox-0-3-0.html
# This is a test/development container - change this in production
echo 'QXZkMG8zMlMvUEE9OjpaR1RuTG9QV0ZiRUZnU0hwTVFpYXpRPT06OjNrejE3MlZSRjlHbkpmaFJIbUFsYnc9PQ==' >> $KNOX_HOME/data/security/master
knoxcli.sh create-cert --hostname nix

mv -f /opt/hadoop/etc/hadoop/gateway-site.xml /opt/hadoop/knox/conf/gateway-site.xml
mv -f /opt/hadoop/etc/hadoop/sandbox.xml      /opt/hadoop/knox/conf/topologies/sandbox.xml

gateway.sh start
start-dfs.sh
/bin/bash
