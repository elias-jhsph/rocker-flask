FROM rocker/r-ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ADD requirements.txt /requirements.txt
ADD . /


RUN apt update && \
    apt install gcc && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install python3.7-dev python3-pip libcurl4-openssl-dev libxml2-dev libssl-dev chromium-browser chromium-chromedriver pandoc gsl-bin libgsl0-dev libv8-dev librsvg2-dev r-cran-rjava -y && \
    update-alternatives --install /usr/bin/python python3 /usr/bin/python3.7 10 && \
    python3.7 -m pip install -r /requirements.txt && \
    Rscript --vanilla install2.R
