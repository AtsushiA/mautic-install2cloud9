#!/bin/bash
## on Cloud9 LAMP(PHP) template

# add repository for PHP7 install
sudo LC_ALL=C.UTF-8 apt-add-repository ppa:ondrej/php

# upgrade&update
sudo apt-get -y upgrade
sudo apt-get -y update

# disable apache mod PHP5
sudo a2dismod php5

# install PHP7
sudo apt-get -y install -y  php7.0 php7.0-cli php7.0-gd php7.0-mbstring  php7.0-mysqlnd php7.0-xml php7.0-opcache php7.0-mcrypt php7.0-curl  libapache2-mod-php7.0

# enable apache mod PHP7
sudo a2enmod php7.0

# install mautic
wget -O mautic.zip http://mautic.org/download/latest
unzip mautic.zip
rm mautic.zip

# SET Mautic DB CONFIG
cat > ${GOPATH}/app/config/local.php << EOL
<?php
\$parameters = array(
	'db_driver' => 'pdo_mysql',
	'db_host' => 'localhost',
	'db_table_prefix' => null,
	'db_port' => '3306',
	'db_name' => 'c9',
	'db_user' => '${C9_USER}',
	'db_password' => null,
	'db_server_version' => '5.5.53-0ubuntu0.14.04.1',
);
EOL
