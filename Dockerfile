FROM rocker/r-ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ADD . /

RUN apt update && \
    apt install gcc curl && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt install libffi-dev && \
    apt install python3.11-venv libcurl4-openssl-dev libxml2-dev libssl-dev chromium-browser chromium-chromedriver pandoc gsl-bin libgsl0-dev libv8-dev librsvg2-dev r-cran-rjava libfribidi-dev libharfbuzz-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev -y && \
    update-alternatives --install /usr/bin/python python3 /usr/bin/python3.11 10 && \
    apt-get install screen -y && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.11 get-pip.py && \
    python3.11 -m venv env && \
    . env/bin/activate && \
    python3.11 -m pip install -r requirements.txt && \
    Rscript --vanilla install2.R
