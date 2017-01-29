FROM python:2.7-alpine
MAINTAINER Francesco Uliana <francesco@uliana.it>
RUN pip install virtualenv
COPY . /app
RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt
EXPOSE 5000
CMD []
ENTRYPOINT ["/env/bin/python", "/app/app.py"]
