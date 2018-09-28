FROM mariadb:10.3.9

ENV MYSQL_ROOT_PASSWORD admin

COPY database /docker-entrypoint-initdb.d/
