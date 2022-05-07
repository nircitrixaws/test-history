FROM python:alpine3.7
LABEL Client="logistic-python app"
MAINTAINER nirmal
COPY . /myapp
WORKDIR /myapp
RUN pip install --upgrade pip
RUN apk update &&\
apk add python3 python3-dev mariadb-dev build-base &&\
pip3 install mysqlclient &&\
apk del python3-dev mariadb-dev build-base &&\
apk add mariadb-client-libs
#RUN /bin/sh -c "apk add --no-cache bash"
RUN pip install -r requirement.txt
RUN pip install cryptography
RUN python3 -m pip install PyMySQL[rsa]
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]
