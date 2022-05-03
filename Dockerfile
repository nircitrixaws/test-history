FROM python:alpine3.7
LABEL Client="logistic-python app"
MAINTAINER nirmal
COPY . /myapp
WORKDIR /myapp
RUN pip install --upgrade pip
RUN apk add gcc musl-dev mariadb-connector-c-dev
RUN pip install -r requirement.txt
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app.py"]
