FROM ubuntu 
MAINTAINER marc agas <marc.agas@stellarloyalty.com>

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y iputils-ping
RUN apt-get install -y curl
RUN apt-get install -y vim

RUN apt-get update
RUN apt-get install -y gnupg

# ssh
RUN mkdir ~/.ssh

RUN export NVM_DIR="$HOME/.nvm"
RUN export NODE_VERSION=10.10.0

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN . $NVM_DIR/nvm.sh || true
RUN [ -s "$NVM_DIR/nvm.sh" ] && . [ "$NVM_DIR/nvm.sh" || true ]
RUN nvm alias default $NODE_VERSION
RUN nvm use default

# git
RUN apt-get install --assume-yes git

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install --no-install-recommends -y yarn

CMD echo "done......"

