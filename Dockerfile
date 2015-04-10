FROM ubuntu:14.04
MAINTAINER MarvAmBass

ENV LANG C.UTF-8
ENV HOME /root

RUN apt-get update; apt-get install -y \
    wget \
    git

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

ADD entrypoint.sh /opt/entrypoint.sh

RUN chmod a+x /opt/entrypoint.sh; \
    bash -c 'NODE_VERSION=stable /opt/entrypoint.sh'

ENTRYPOINT ["/opt/entrypoint.sh"]
