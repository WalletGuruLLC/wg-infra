#!/bin/sh -x
# Install Docker
sudo apt update
sudo apt install docker.io git fish -y
sudo systemctl start docker
docker --version

# Install Docker Compose
sudo apt install docker-compose-v2

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Install dependencies for Rafiki
cd /opt
mkdir rafiki
cd rafiki
git clone https://github.com/interledger/rafiki.git
cd rafiki
sudo apt-get install npm -y
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 20
nvm use

# install pnpm
npm install -g corepack
corepack enable

# if moving from yarn run
pnpm clean

# install dependencies
yes | pnpm i

# start the local environment
pnpm localenv:compose up -d
