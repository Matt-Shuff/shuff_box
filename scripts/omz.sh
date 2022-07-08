#!/bin/bash
apt-get update
apt-get upgrade -y

apt-get install curl zsh git apt-utils -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv .zshrc_temp ~/.zshrc