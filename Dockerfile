FROM debian:stretch

COPY sources.list /etc/apt/sources.list
COPY ikarus-r1870 /root/ikarus

RUN apt-get update && \
    apt-get install -y build-essential libtool libffi-dev libgmp-dev rlwrap && \
    cd /root/ikarus && ./configure --enable-libffi && make && make install && \
    cd / && rm -rf /root/ikarus && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]

