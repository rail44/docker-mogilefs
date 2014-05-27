FROM ubuntu:trusty
RUN apt-get install -y cpanminus build-essential

RUN cpanm install --force MogileFS::Server

RUN mkdir /node
RUN mkdir /node/device
WORKDIR /node
ADD ./mogstored.conf /node/mogstored.conf
EXPOSE 7500
CMD ["mogstored", "-c", "./mogstored.conf"]
