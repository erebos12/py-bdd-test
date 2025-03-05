FROM python:3.9
RUN apt-get update && apt-get install -y wget

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /tests
RUN mkdir -p /tests/reports
COPY requirements.txt features/requirements.txt
COPY behave.ini .
RUN pip install --no-cache-dir -r features/requirements.txt
RUN playwright install # installs the browser binaries i.e. chromium, firefox
RUN playwright install-deps


COPY features features
COPY features/steps features/steps
COPY ./execute_tests.sh execute_tests.sh



