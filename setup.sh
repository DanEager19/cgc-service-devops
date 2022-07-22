#!/bin/bash
git clone https://github.com/DanEager19/kitchenware-request-api
git clone https://github.com/DanEager19/chef-bot

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install docker.io curl nodejs npm -f

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo docker-compose up --build -d 