FROM fferriere/base

MAINTAINER Florian FERRIERE ferriere.florian@gmail.com

RUN apt-get install -y apache2 libapache2-mod-php5 php5-json acl curl vim php5-mysqlnd php5-cli php5-gd php5-intl

RUN a2enmod rewrite

ADD files/entrypoint.sh /usr/local/bin/entrypoint.sh

ADD files/apache/default.conf /etc/apache2/sites-enabled/000-default.conf

RUN echo 'date.timezone = Europe/Paris' >> /etc/php5/cli/php.ini && \
    echo 'date.timezone = Europe/Paris' >> /etc/php5/apache2/php.ini

VOLUME [ "/var/www/", "/var/log/apache2" ]

EXPOSE 80

CMD [ "/usr/local/bin/entrypoint.sh" ]
