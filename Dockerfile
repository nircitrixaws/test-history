FROM python:alpine3.10
LABEL Client="logistic-python app"
MAINTAINER nirmal
COPY . /myapp
WORKDIR /myapp
RUN pip install --upgrade pip
RUN apk add --no-cache --virtual .build-deps mariadb-dev ... \
    && pip install ...\
    && apk add --virtual .runtime-deps mariadb-client-libs \
    && apk del .build-deps
RUN pip install -r requirement.txt
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]
