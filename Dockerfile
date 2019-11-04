FROM rocker/r-ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ADD requirements.txt /requirements.txt
ADD . /


RUN apt update && \
    apt install software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install python3.7 python3-pip libcurl4-openssl-dev libxml2-dev libssl-dev -y && \
    pip3 install virtualenv && \
    virtualenv -p /usr/bin/python3.7 venv && \
    . /venv/bin/activate && \
    pip3 install -r /requirements.txt && \
    Rscript --vanilla install2.R

CMD /venv/bin/gunicorn -b :$PORT main:app