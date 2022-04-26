FROM python:alpine3.8.2
LABEL Client="logistic-python app"
MAINTAINER nirmal
COPY . /myapp
WORKDIR /myapp
RUN pip install -r requirement.txt
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app.py"]

