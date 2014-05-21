FROM ubuntu:trusty
RUN apt-get install -y cpanminus build-essential

RUN cpanm install DBD::SQLite
RUN cpanm install --force MogileFS::Server

WORKDIR /tmp
ADD mogilefsd.conf /tmp/mogilefsd.conf
RUN adduser mogile
RUN sudo -u mogile mogdbsetup --type SQLite --yes

EXPOSE 7001
CMD ["sudo", "-u", "mogile", "mogilefsd", "-c", "mogilefsd.conf"]
