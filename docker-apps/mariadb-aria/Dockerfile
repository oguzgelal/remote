FROM yobasystems/alpine-mariadb

# mariadb does not appear to load conf.d files by default
#ADD 00_aria.cnf /etc/mysql/conf.d/00_aria.cnf

COPY 00_aria.cnf .
RUN cat /00_aria.cnf >> /etc/mysql/my.cnf
