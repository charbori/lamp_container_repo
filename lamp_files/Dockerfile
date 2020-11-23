FROM ubuntu:16.04
#MAINTAINER Fer Uria <fauria@gmail.com>
LABEL Description="Cutting-edge LAMP stack, based on Ubuntu 16.04 LTS. Includes .htaccess support and popular PHP7 features, including composer and mail() function." \
	License="Apache License 2.0" \
	Usage="docker run -d -p [HOST WWW PORT NUMBER]:80 -p [HOST DB PORT NUMBER]:3306 -v [HOST WWW DOCUMENT ROOT]:/var/www/html -v [HOST DB DOCUMENT ROOT]:/var/lib/mysql fauria/lamp" \
	Version="1.0"

RUN apt-get update
RUN apt-get upgrade -y

COPY debconf.selections /tmp/
RUN debconf-set-selections /tmp/debconf.selections

RUN apt-get install -y zip unzip
RUN apt-get install -y \
	php7.0 \
	php7.0-bz2 \
	php7.0-cgi \
	php7.0-cli \
	php7.0-common \
	php7.0-curl \
	php7.0-dev \
	php7.0-enchant \
	php7.0-fpm \
	php7.0-gd \
	php7.0-gmp \
	php7.0-imap \
	php7.0-interbase \
	php7.0-intl \
	php7.0-json \
	php7.0-ldap \
	php7.0-mbstring \
	php7.0-mcrypt \
	php7.0-mysql \
	php7.0-odbc \
	php7.0-opcache \
	php7.0-pgsql \
	php7.0-phpdbg \
	php7.0-pspell \
	php7.0-readline \
	php7.0-recode \
	php7.0-snmp \
	php7.0-sqlite3 \
	php7.0-sybase \
	php7.0-tidy \
	php7.0-xmlrpc \
	php7.0-xsl \
	php7.0-zip
RUN apt-get install apache2 libapache2-mod-php7.0 -y
RUN apt-get install postfix -y
#RUN apt-get install git nodejs npm composer nano tree vim curl ftp -y
#RUN npm install -g bower grunt-cli gulp

# php설치 관련 frontend 관련 오류 메시지
# RUN apt-get install software-properties-common -y
# RUN add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe'
RUN apt-get update
RUN apt-get upgrade -y

RUn apt-get install apt-utils -y

RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'"]
RUN DEBIAN_FRONTEND=noninteractive apt install mysql-server mysql-client -y

#RUN apt install mysql-server mysql-client -y

#RUN apt-get install ufw -y
#RUN ufw allow 3306/tcp

COPY init_conf_files/mysql.cnf /etc/mysql/conf.d/mysql.cnf
COPY init_conf_files/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

#RUN touch /var/run/mysqld/mysqld.sock
#RUN touch /var/run/mysqld/mysqld.pid
#RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
#RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
#RUN chmod -R 644 /var/run/mysqld/mysqld.sock

# RUN pkill mysql
# RUN service mysql restart

#update 'password' to whatever you want to use
# RUN mysql -u root -password -e "use mysql; UPDATE user SET authentication_string=PASSWORD('root') WHERE User='root'; flush privileges;"
# RUN "create database member;";

#ENV LOG_STDOUT **Boolean**
#ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC
ENV TERM dumb

COPY index.php /var/www/html/
COPY run-lamp.sh /usr/sbin/

RUN a2enmod rewrite
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN chmod +x /usr/sbin/run-lamp.sh
RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /var/lib/mysql
VOLUME /var/log/mysql
VOLUME /etc/apache2

EXPOSE 80
EXPOSE 8080
EXPOSE 3306

CMD ["/usr/sbin/run-lamp.sh"]
