#!/bin/bash

# Download + Install logstash-forwarder rpm

cd ~/logtash-forwarder; 
sudo curl -O http://packages.elasticsearch.org/logstashforwarder/centos/logstash-forwarder-0.3.1-1.x86_64.rpm;
sudo rpm -ivh logstash-forwarder-0.3.1-1.x86_64.rpm;

# Copy logstash forwarder init script 
cd ~/logstash-forwarder;
sudo cp logstash-forwarder1 /etc/init.d/logstash-forwarder;
sudo chmod +x /etc/init.d/logstash-forwarder;

# Create and configure /etc/logstash-forwarder 
cd ~/logstash-forwarder;
sudo cp logstash-forwarder2 /etc/logstash-forwarder;

# Chkconfig
sudo chkconfig --add logstash-forwarder;
sudo service logstash-forwarder start;
