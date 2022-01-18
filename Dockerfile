FROM ubuntu:20.04
MAINTAINER sgrinter@goliathus.org

RUN apt-get update -qq -y && apt-get upgrade -qq -y
RUN apt-get install wget unzip \
    libc6 libstdc++6 zlib1g libsdl1.2debian curl bzip2 libjpeg62 -qq -y
    
RUN useradd -m -d /home/container -s /bin/bash container

RUN wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb
RUN apt-get install ./libssl1.0.0_1.0.2n-1ubuntu5.7_amd64.deb

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]