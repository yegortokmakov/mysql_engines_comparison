#!/bin/bash

echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list

wget http://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg

apt-get update

export DEBIAN_FRONTEND=noninteractive
apt-get install mysql-server -y

