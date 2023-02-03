FROM rocker/r-ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ADD requirements.txt /requirements.txt
ADD . /


RUN apt update && \
    apt install gcc && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install libffi-dev && \
    apt install python3.7-dev python3.7 python3-pip libcurl4-openssl-dev libxml2-dev libssl-dev chromium-browser chromium-chromedriver pandoc gsl-bin libgsl0-dev libv8-dev librsvg2-dev r-cran-rjava libfribidi-dev libharfbuzz-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev -y && \
    update-alternatives --install /usr/bin/python python3 /usr/bin/python3.7 10 && \
    apt-get install screen -y && \
    python -m pip install pip --upgrade && \
    python3.7 -m pip install -r /requirements.txt && \
    Rscript --vanilla install2.R
