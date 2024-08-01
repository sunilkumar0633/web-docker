FROM centos:latest

RUN rm -f /etc/yum.repos.d/*

WORKDIR /etc/yum.repos.d

COPY ./local.repo /etc/yum.repos.d/

RUN yum install -y httpd zip wget

WORKDIR /var/www/html

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page292/grandcoffee.zip

RUN unzip grandcoffee.zip

RUN rm -f grandcoffee.zip &&\
    cp -rf html/* . &&\
        rm -rf html
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
