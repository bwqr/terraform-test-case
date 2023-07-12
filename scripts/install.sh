#!/bin/bash -v

yum -y update
yum -y install httpd
systemctl enable httpd && systemctl start httpd
