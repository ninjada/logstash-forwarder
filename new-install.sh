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
#sudo curl -O http://ninjada.com/logstash/logstash-forwarder-0.3.1-1.x86_64.rpm;
sudo curl -O http://ninjada.com/logstash/logstash-forwarder-0.4.0-1.x86_64.rpm;
sudo rpm -ivh /home/ec2-user/logstash-forwarder/logstash-forwarder-0.4.0-1.x86_64.rpm;

# Init depends on file at /etc/sysconfig/logstash-forwarder
#sudo cp /home/ec2-user/logstash-forwarder/logstash-forwarder1 /etc/sysconfig/logstash-forwarder;

sudo sed -i "s|args=''|args='-config /etc/logstash-forwarder -spool-size 100'|g" /etc/init.d/logstash-forwarder;

# Copy correct Logstash-forwarder Config file 
cd /home/ec2-user/logstash-forwarder;
sudo cp $srvVarn /etc/logstash-forwarder;

# Copy Logrotate Files
sudo cp logrotate.hourly /etc/cron.hourly/;
sudo cp logrotate.hourly.conf /etc/;

# Chkconfig
#sudo chkconfig --add logstash-forwarder;
#sudo service logstash-forwarder start;

# Varnishncsa specifics
# sudo chkconfig varnishncsa on;
# sudo service varnishncsa start;
# sudo sed -i 's/DAEMON_OPTS="-a -w $logfile -D -P $pidfile"/DAEMON_OPTS="-f -w $logfile -D -P $pidfile"/g' /etc/init.d/varnishncsa;

# Add SSL Cert
# TBC
