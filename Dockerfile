#FROM python:3.7.4-alpine3.10
FROM python:alpine3.10
LABEL Client="logistic-python app"
MAINTAINER nirmal
COPY . /myapp
WORKDIR /myapp
#RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev && \
#apk add --no-cache --update python3 && \
#pip3 install --upgrade pip setuptools
#RUN apk update \
#&& apk add --virtual build-deps gcc python3-dev musl-dev \
#&& apk add --no-cache mariadb-dev
#RUN apk add mysql mysql-client
#RUN apk add --no-cache bash
#RUN apk del build-deps
#RUN pip install PyMySQL
RUN pip install --upgrade pip
#RUN apk update &&\
#apk add python3 python3-dev mariadb-dev build-base &&\
#pip3 install mysqlclient &&\
#apk del python3-dev mariadb-dev build-base &&\
#apk add mariadb-client-libs
#RUN /bin/sh -c "apk add --no-cache bash"
RUN pip install -r requirement.txt
#RUN pip install cryptography
#RUN python3 -m pip install PyMySQL[rsa]
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]
