FROM circleci/node:10.15.0-browsers
MAINTAINER andrew.larsen@vernonsoftwaresolutoins.com

# Install awscli
RUN sudo apt-get install python-pip python-dev build-essential \
&& sudo pip install --upgrade pip \
&& sudo pip install --upgrade virtualenv 
RUN sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \ 
sudo unzip awscli-bundle.zip && \
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN sudo npm install -g yarn@1.0.0

RUN set -x \
    VER="17.12.1-ce" \
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz \
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz \
    mv /tmp/docker/* /usr/bin
WORKDIR /

#Install make
RUN sudo apt-get install --reinstall make

ENTRYPOINT ["/bin/bash"]
