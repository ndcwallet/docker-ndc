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
    
RUN    wget https://raw.githubusercontent.com/nexbitproject/nexbit/master/script/deps.sh && sh deps.sh
RUN    wget  https://github.com/ndcwallet/ndc/releases/download/v1.0.0.1/ubuntu-18_daemon  && mv ubuntu-18_daemon  ~/ndcd
    
RUN    mv ndcd /usr/local/bin/ 
RUN    rm -rf ndcd /root/.gnupg/ 
    


VOLUME ["/ndc"]

EXPOSE 17799 17798

COPY ["bin", "/usr/local/bin/"]
COPY ["docker-entrypoint.sh", "/usr/local/bin/"]
ENTRYPOINT ["docker-entrypoint.sh"]

