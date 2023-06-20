FROM rocker/r-ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ADD . /

RUN apt update && \
    apt install -y wget curl unzip libnss3 libgconf-2-4 && \
    CHROMIUM_REVISION=$(curl -sS "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2FLAST_CHANGE?alt=media") && \
    wget https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F${CHROMIUM_REVISION}%2Fchrome-linux.zip -O chromium.zip && \
    unzip chromium.zip -d /opt/chromium && \
    ln -s /opt/chromium/chrome-linux/chrome /usr/bin/chromium && \
    apt install -y gcc software-properties-common libffi-dev python3.11-venv libcurl4-openssl-dev libxml2-dev libssl-dev pandoc gsl-bin libgsl0-dev libv8-dev librsvg2-dev r-cran-rjava libfribidi-dev libharfbuzz-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    update-alternatives --install /usr/bin/python python3 /usr/bin/python3.11 10 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.11 get-pip.py && \
    python3.11 -m venv env && \
    . env/bin/activate && \
    python3.11 -m pip install -r requirements.txt && \
    Rscript --vanilla install2.R
