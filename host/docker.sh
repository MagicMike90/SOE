#!/bin/bash

sudo wget "https://download.docker.com/linux/ubuntu/dists/trusty/pool/stable/amd64/docker-ce_17.03.1~ce-0~ubuntu-trusty_amd64.deb"

sudo dpkg -i docker-ce_17.03.1~ce-0~ubuntu-trusty_amd64.deb

# Install packages to allow apt to use a repository over HTTPS:
# apt-get install apt-transport-https ca-certificates curl software-properties-common

# # Add Docker’s official GPG key:
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# # Set up the stable repository
# add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

# apt-get update

# sudo apt-get install docker-ce
