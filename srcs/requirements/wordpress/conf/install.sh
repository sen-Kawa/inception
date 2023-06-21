#!bin/sh
wp core install --url=kaheinz.42.fr --title=Inception --admin_user=kaheinz --admin_password=docker --admin_email=ka@42.fr --skip-email

wp user create pedro pedro@42.fr --user_pass=docker

/usr/sbin/php-fpm81 -F
