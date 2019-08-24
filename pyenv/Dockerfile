FROM ubuntu:18.04

RUN sed -i".back" -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp\/pub\/Linux/g' /etc/apt/sources.list

# tzdataが止まってしまわないように設定
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV USER shinshu
ENV HOME /home/$USER

# 一般ユーザアカウント
ARG UID="0"
RUN useradd -u $UID -m $USER

# 起動時の設定
USER $USER
WORKDIR /home/$USER
ENTRYPOINT ["/bin/bash"]

# anyenvのクローン
RUN git clone https://github.com/riywo/anyenv $HOME/.anyenv

ENV PATH $HOME/.anyenv/bin:$PATH

RUN echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile \
 && echo 'eval "$(anyenv init -)"' >> ~/.bash_profile

RUN yes | anyenv install --init

RUN anyenv install pyenv

RUN bash -lc "pyenv install 2.7.15" \
 && bash -lc "pyenv install 3.7.2"

RUN bash -lc "pyenv global 3.7.2 2.7.15"

RUN bash -lc "pyenv rehash"

