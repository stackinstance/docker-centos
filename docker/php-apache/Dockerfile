FROM centos:7

MAINTAINER StackInstance <info@stackinstance.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install httpd mysql-devel mysql-libs mod_ssl
RUN yum -y install php56w-pecl-apcu php56w-opcache php56w php56w-cli php56w-ldap php56w-mbstring php56w-mcrypt php56w-mysql php56w-pear-MDB2-Driver-mysqli php56w-pecl-memcached php56w-xml php56w-gd php56w-pear php56w-devel
RUN yum -y install httpd-devel pcre-devel gcc make curl

RUN yum -y update bash
RUN yum -y install yum clean all

#
# Global Apache configuration changes
#
RUN sed -i \
    -e 's~^ServerSignature On$~ServerSignature Off~g' \
    -e 's~^EnableSendfile On$~EnableSendfile Off~g' \
    -e 's~^ServerTokens OS$~ServerTokens Prod~g' \
    -e 's~^#ExtendedStatus On$~ExtendedStatus On~g' \
    -e 's~^DirectoryIndex \(.*\)$~DirectoryIndex \1 index.php~g' \
    -e 's~^NameVirtualHost \(.*\)$~#NameVirtualHost \1~g' \
    -e 's~^AllowOverride None \(.*\)$~AllowOverride All \1~g' \
    /etc/httpd/conf/httpd.conf

#
# Disable Apache directory indexes
#
RUN sed -i \
    -e 's~^IndexOptions \(.*\)$~#IndexOptions \1~g' \
    -e 's~^IndexIgnore \(.*\)$~#IndexIgnore \1~g' \
    -e 's~^AddIconByEncoding \(.*\)$~#AddIconByEncoding \1~g' \
    -e 's~^AddIconByType \(.*\)$~#AddIconByType \1~g' \
    -e 's~^AddIcon \(.*\)$~#AddIcon \1~g' \
    -e 's~^DefaultIcon \(.*\)$~#DefaultIcon \1~g' \
    -e 's~^ReadmeName \(.*\)$~#ReadmeName \1~g' \
    -e 's~^HeaderName \(.*\)$~#HeaderName \1~g' \
    -e 's/\/www\/html/\/www\/web/g' \
    /etc/httpd/conf/httpd.conf

#
# Global PHP configuration changes
#
RUN sed -i \
    -e 's~^;date.timezone =$~date.timezone = Europe/Amsterdam~g' \
    -e 's~^;user_ini.filename =$~user_ini.filename =~g' \
    -e 's~^sendmail_path = /usr/sbin/sendmail -t -i$~sendmail_path = /usr/bin/msmtp -C /etc/msmtprc -t -i~g' \
    /etc/php.ini

ADD website.conf /etc/httpd/conf.d/

# Add nodejs
RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -
RUN yum install -y nodejs
RUN npm install npm grunt

# Add bundler
RUN yum -y update && yum -y install -y ruby ruby-dev make
RUN gem install bundler

EXPOSE 80 443

CMD /usr/sbin/httpd -c "ErrorLog /dev/stdout" -DFOREGROUND
