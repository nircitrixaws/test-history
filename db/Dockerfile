FROM mysql:latest
ENV MYSQL_USERNAME='root'
ENV MYSQL_PASSWORD=''
ENV MYSQL_SERVER='localhost'
ENV MYSQL_SERVER_PORT='3306'
ENV MYSQL_DATABASE='shipping'
EXPOSE 3306
#files in docker-entrypoint-initdb.d will be executed automatically
COPY ./db/ /docker-entrypoint-initdb.d/
