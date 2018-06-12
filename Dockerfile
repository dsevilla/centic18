FROM jupyter/scipy-notebook

MAINTAINER dsevilla@um.es

EXPOSE 8888

USER root

RUN apt-get update \
    && apt-get install -y \
            apt-transport-https \
            ca-certificates curl iptables libdevmapper1.02.1 \
    software-properties-common \
    && wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/edge/amd64/docker-ce_18.05.0~ce~3-0~ubuntu_amd64.deb \
    && dpkg -i docker-ce*.deb  \
    && curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
