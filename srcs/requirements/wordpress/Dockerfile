FROM	alpine:3.17

ARG	PHP_VERSION=81 \
	DB_NAME \
	DB_USER \
	DB_ROOT_PASSWORD \
	DB_PASSWORD

 RUN	apk update && apk upgrade && apk add --no-cache \
	mariadb-client \
 	php${PHP_VERSION} \
 	php${PHP_VERSION}-fpm \
 	php${PHP_VERSION}-mysqli \
 	php${PHP_VERSION}-json \
 	php${PHP_VERSION}-curl \
 	php${PHP_VERSION}-dom \
 	php${PHP_VERSION}-exif \
 	php${PHP_VERSION}-fileinfo \
 	php${PHP_VERSION}-mbstring \
 	php${PHP_VERSION}-openssl \
 	php${PHP_VERSION}-xml \
 	php${PHP_VERSION}-zip \
 	php${PHP_VERSION}-redis \
 	php-phar \
 	wget \
 	unzip && \
 	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
 	/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
 	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
 	/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
 	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
 	/etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
 	rm -f /var/cache/apk/*

WORKDIR	/var/www

RUN	wget https://wordpress.org/latest.zip && unzip latest.zip && \
	cp -rf wordpress/* . && rm -rf wordpress latest.zip
	
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
	
COPY	./conf/wp-config-create.sh .

RUN	sh wp-config-create.sh && rm wp-config-create.sh && \
	chmod -R 0777 wp-content/

COPY	./conf/install.sh .

ENTRYPOINT	["sh","install.sh"]
# CMD	/usr/sbin/php-fpm81 -F
