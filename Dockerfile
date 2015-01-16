FROM ubuntu:14.04
MAINTAINER MarvAmBass

RUN apt-get update && apt-get install -y \
    wget \
    git

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && \
    echo "source /root/.nvm/nvm.sh" >> /etc/bash.bashrc

ADD entrypoint.sh /opt/entrypoint.sh

RUN chmod a+x /opt/entrypoint.sh; \
    bash -c 'NODE_VERSION=stable /opt/entrypoint.sh'

ENTRYPOINT ["/bin/bash","-c","/opt/entrypoint.sh"]
