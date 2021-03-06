FROM centos:7

MAINTAINER StackInstance <info@stackinstance.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install httpd mysql-devel mysql-libs mod_ssl
RUN yum -y install php72w php72w-cli php72w-ldap php72w-mbstring php72w-mysql php72w-pear-MDB2-Driver-mysqli php72w-pecl-memcached php72w-xml php72w-gd php72w-pear php72w-devel php72w-bcmath
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
ADD extra.sh /tmp/
RUN ["chmod", "+x", "/tmp/extra.sh"]
RUN /tmp/extra.sh

EXPOSE 80 443 8080

CMD /usr/sbin/httpd -c "ErrorLog /dev/stdout" -DFOREGROUND
