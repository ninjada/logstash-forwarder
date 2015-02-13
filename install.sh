#!/bin/bash
# General Script to Download, Install & Configure Logstash-forwarder for AWS EC2 Instance
# By NinjadaWhite jadawhite@gmail.com
# Download + Install logstash-forwarder rpm

# Server Config Types
srvVarn='/home/ec2-user/logstash-forwarder/cfg/prod-varnish.cfg'
srvCont='/home/ec2-user/logstash-forwarder/cfg/prod-content.cfg'
srvData='/home/ec2-user/logstash-forwarder/cfg/prod-data-service.cfg'
srvWeb='/home/ec2-user/logstash-forwarder/cfg/prod-web-eph.cfg'
srvWebApi='/home/ec2-user/logstash-forwarder/cfg/prod-web-api-eph.cfg'

# Install  logstash-forwarder
cd /home/ec2-user/logtash-forwarder;
sudo curl -O http://ninjada.com/logstash/logstash-forwarder-0.3.1-1.x86_64.rpm;
sudo rpm -ivh /home/ec2-user/logstash-forwarder/logstash-forwarder-0.3.1-1.x86_64.rpm;

# Copy logstash forwarder init script 
sudo curl -o /etc/init.d/logstash-forwarder http://ninjada.com/logstash/logstash_forwarder_redhat_init;
sudo chmod +x /etc/init.d/logstash-forwarder;

# Init depends on file at /etc/sysconfig/logstash-forwarder
cd /home/ec2-user/logstash-forwarder;
sudo cp /home/ec2-user/logstash-forwarder/logstash-forwarder1 /etc/sysconfig/logstash-forwarder;

# Create and configure /etc/logstash-forwarder 
sudo cp $srvVarn /etc/logstash-forwarder;

# Copy Logrotate Files
sudo cp logrotate.hourly /etc/cron.hourly/;
sudo cp logrotate.hourly.conf /etc/;

# Chkconfig
sudo chkconfig --add logstash-forwarder;
sudo service logstash-forwarder start;

# Add SSL Cert
# TBC
