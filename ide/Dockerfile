FROM ubuntu:24.04

RUN apt-get update \
	&& apt-get -y install \
	sudo curl git ca-certificates build-essential unzip tmux locales

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV TERM="xterm-256color"
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN git clone https://github.com/flleonx/dotfiles.git && sh /dotfiles/setup.sh 
