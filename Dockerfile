FROM ubuntu:latest as builder
RUN apt -y update
RUN apt -y install make gcc git strace ltrace
ADD . /src/
RUN cd /src && dpkg -i ibmmq-runtime_9.3.3.1_amd64.deb && dpkg -i ibmmq-sdk_9.3.3.1_amd64.deb && dpkg -i ibmmq-gskit_9.3.3.1_amd64.deb && dpkg -i ibmmq-client_9.3.3.1_amd64.deb
RUN echo /opt/mqm/lib64 > /etc/ld.so.conf.d/ibm_mq.conf && ldconfig
RUN cd /src/mqperf && make clean all
ENV MQ_CONNECT_TYPE=CLIENT
RUN for bin in /src/bin/linux/* ; do install $bin /usr/local/bin/;done
