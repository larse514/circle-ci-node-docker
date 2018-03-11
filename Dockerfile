FROM circleci/node:8.4.0
MAINTAINER andrew.larsen@vernonsoftwaresolutoins.com

# Install awscli
RUN sudo apt-get install -y rsync awscli
RUN sudo npm install -g yarn@1.0.0

RUN set -x \
    VER="17.12.1-ce" \
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz \
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz \
    mv /tmp/docker/* /usr/bin
WORKDIR /

ENTRYPOINT ["/bin/bash"]
