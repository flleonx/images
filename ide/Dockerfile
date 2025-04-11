FROM ubuntu:24.04

run apt-get update \
	&& apt-get install \
	sudo curl git ca-certificates build-essential dbus unzip tmux locales

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH"

ENV SUDO_USER=fake

ENV TERM="xterm-256color"
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN curl https://mise.run | sh
RUN mise use -g neovim starship go golangci-lint node ripgrep fzf zoxide

RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc
RUN echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
RUN echo 'eval "$(fzf --bash)"' >> ~/.bashrc

RUN git clone https://github.com/flleonx/kickstart.nvim.git /tmp/nvim && \
	mkdir -p ~/.config && \
	mv /tmp/nvim ~/.config/nvim
RUN nvim "+Lazy! install" +MasonToolsInstallSync +q!

RUN go install github.com/go-delve/delve/cmd/dlv@latest
