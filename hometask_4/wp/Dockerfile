FROM centos:centos7
RUN yum update -y && yum install -y epel-release yum-utils && yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum update -y && yum-config-manager --enable remi-php72 && yum install -y nginx wget && yum install -y php-cli php-fpm php-mysql php-json \
    php-opcache php-mbstring php-xml php-gd php-curl
RUN rm /etc/php-fpm.d/www.conf && chown -R root:nginx /var/lib/php && mkdir -p /run/php-fpm 
ADD conf/www.conf /etc/php-fpm.d/www.conf
RUN mkdir -p /var/www/html/epam && cd /tmp && wget https://wordpress.org/latest.tar.gz && tar xf latest.tar.gz && \
    mv /tmp/wordpress/* /var/www/html/epam && chown -R nginx: /var/www/html/epam 
ADD conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80/tcp
EXPOSE 443/tcp

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm; exec nginx -g 'daemon off;';"]
