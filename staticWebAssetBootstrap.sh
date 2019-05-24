#!/bin/bash

yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><h1>Don't Panic!</h1></html>" > index.html

# save a copy on s3
aws s3 mb s3://nbd-test-bucket
aws s3 cp ./index.html s3://nbd-test-bucket
