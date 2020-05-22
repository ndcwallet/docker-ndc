FROM ubuntu:18.04

LABEL maintainer "Tanvir Rahaman <tanvirtex@gmail.com>"

ARG NDC_VERSION=1.0.0.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        gpg \
        gpg-agent \
        dirmngr 

RUN  apt-get install build-essential libboost-dev libboost-system-dev libboost-filesystem-dev  -qq \
      libboost-program-options-dev libboost-thread-dev libssl-dev libminiupnpc-dev git curl zlib1g-dev -qq \
      build-essential libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4 -qq \
      openssl software-properties-common libffi-dev gnupg2 build-essential automake autoconf libtool -qq \
      libxml2 libxml2-dev zlib1g-dev python curl gzip screen doxygen graphviz libboost-all-dev -qq \
      libminiupnpc-dev libzmq3-dev curl zlib1g-dev build-essential libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev -qq \
      libxslt1-dev libcurl4-openssl-dev software-properties-common -qq \
      libffi-dev gnupg2 libevent-pthreads-2.1-6 libzmq3-dev -qq \
      add-apt-repository -y ppa:bitcoin/bitcoin \
      apt-get update -qq 

RUN apt-get install libdb4.8-dev libdb4.8++-dev -qq
      
      

RUN wget  https://github.com/ndcwallet/ndc/releases/download/v1.0.0.1/ubuntu-18_daemon  && mv ubuntu-18_daemon  ~/ndcd
  
RUN mv ndcd /usr/local/bin/ 
RUN rm -rf ndcd /root/.gnupg/ 
    


VOLUME ["/ndc"]

EXPOSE 17799 17798

COPY ["bin", "/usr/local/bin/"]
COPY ["docker-entrypoint.sh", "/usr/local/bin/"]
ENTRYPOINT ["docker-entrypoint.sh"]

