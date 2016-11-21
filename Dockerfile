FROM python:3.5

RUN echo "deb http://ftp.ru.debian.org/debian/ jessie-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list && \
    echo "deb http://ftp.ru.debian.org/debian/ jessie main contrib non-free"           > /etc/apt/sources.list && \
    echo "deb http://ftp.ru.debian.org/debian/ jessie-updates main contrib non-free"   >> /etc/apt/sources.list &&\
    echo "deb http://security.debian.org jessie/updates main contrib non-free"         >> /etc/apt/sources.list  

RUN apt-get update && apt-get install  -t jessie-backports  -y \ 
     openjdk-8-jdk \ 
     maven \ 
     git \
     curl \
  && rm -rf /var/lib/apt/lists/*

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y adduser \
  geoip-database \
  libc6 \
  libcurl3-gnutls \
  libogg0 \
  libspeex1 \
  libtheora0 \
  libvorbis0a \
  libxml2 \
  libxslt1.1  \
  debconf \
  ffmpeg \
  sox \
  lame \
  libsox-fmt-mp3 \
 && rm -rf /var/lib/apt/lists/*
