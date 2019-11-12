FROM rocker/r-ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ADD requirements.txt /requirements.txt
ADD . /


RUN apt update && \
    apt install software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install python3.7 python3-pip libcurl4-openssl-dev libxml2-dev libssl-dev -y && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.7 10 && \
    python -m pip install -r /requirements.txt && \
    Rscript --vanilla install2.R
