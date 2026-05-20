FROM ubuntu

RUN apt update
RUN apt install –y apache2
RUN apt install –y apache2-utils
RUN apt clean

EXPOSE 80

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

CMD ["apache2ctl", "-D", "FOREGROUND"]