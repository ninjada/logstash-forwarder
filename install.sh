#!/bin/bash

# Download + Install logstash-forwarder rpm

cd /home/ec2-user/logtash-forwarder;
sudo curl -O http://packages.elasticsearch.org/logstashforwarder/centos/logstash-forwarder-0.3.1-1.x86_64.rpm;
sudo rpm -ivh /home/ec2-user/logstash-forwarder/logstash-forwarder-0.3.1-1.x86_64.rpm;

# Copy logstash forwarder init script 
sudo curl -o /etc/init.d/logstash-forwarder http://logstashbook.com/code/4/logstash_forwarder_redhat_init;
sudo chmod +x /etc/init.d/logstash-forwarder;

# Init depends on file at /etc/sysconfig/logstash-forwarder
cd /home/ec2-user/logstash-forwarder;
sudo cp /home/ec2-user/logstash-forwarder/logstash-forwarder1 /etc/sysconfig/logstash-forwarder;

# Create and configure /etc/logstash-forwarder 
cd /home/ec2-user/logstash-forwarder;
sudo cp /home/ec2-user/logstash-forwarder/logstash-forwarder2 /etc/logstash-forwarder;

# Chkconfig
sudo chkconfig --add logstash-forwarder;
sudo service logstash-forwarder start;

# Add SSL Cert
# TBC
