FROM ubuntu:latest as builder
RUN apt -y update
RUN apt -y install make gcc git
ADD . /src/
RUN cd /src && dpkg -i ibmmq-runtime_9.3.3.1_amd64.deb && dpkg -i ibmmq-sdk_9.3.3.1_amd64.deb
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/mqm/lib64"
RUN cd /src/mqperf && make clean all
#RUN /src/bin/linux/mqtest
