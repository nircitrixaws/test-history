FROM mysql:latest
ENV MYSQL_USERNAME=root
ENV MYSQL_ROOT_PASSWORD=admin
ENV MYSQL_HOST=backendsvc
#backendsvc is the db pod exposed service name(mention the backend pod service to the MY_SQL_HOST
ENV MYSQL_SERVER_PORT=3306
ENV MYSQL_DATABASE=shipping
EXPOSE 3306
COPY ./ /docker-entrypoint-initdb.d/
