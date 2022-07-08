FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

# RUN useradd -rm -d /home/shuff_box -s /bin/bash -g root -u 1001 shuff_box
# USER shuff_box
# WORKDIR /home/shuff_box
RUN apt-get update
RUN apt-get update -y

# network tools
RUN apt-get -y install mtr whois dnsutils

# python dependencies
RUN apt-get install -y -qq \
    build-essential \
    checkinstall \
    libffi-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    libreadline-dev \
    liblzma-dev

COPY scripts/omz.sh .
COPY ./config/.zshrc .zshrc_temp
RUN chmod +x omz.sh && ./omz.sh
RUN chsh -s $(which zsh)

COPY scripts/tools.sh .
RUN chmod +x tools.sh && ./tools.sh

RUN alias traceroute=mtr

cmd ["zsh"]