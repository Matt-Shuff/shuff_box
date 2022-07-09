#!/bin/zsh
# curl -sL https://aka.ms/InstallAzureCLIDeb | bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
source ~/.zshrc

asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add python
asdf install python latest
asdf global python latest

asdf plugin-add azure-cli
asdf install azure-cli latest
asdf global azure-cli latest

apt-get install ncat -y