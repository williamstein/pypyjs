FROM i386/debian:10

ENV DEBIAN_FRONTEND=noninteractive PYTHONUNBUFFERED=0 LANG=C.UTF-8 LC_ALL=C.UTF-8
LABEL maintainer="SageMath, Inc. <office@sagemath.com>"

USER root

RUN \
     apt-get update \
  && apt-get install -y vim libreadline-dev libz-dev libssl-dev libffi-dev libgc-dev \
     rsync ssh curl wget git dpkg-dev make python pypy cmake python3

RUN \
     git clone https://github.com/emscripten-core/emsdk.git \
  && cd emsdk \
  && ./emsdk install  sdk-upstream-main-32bit  \
  && ./emsdk activate  sdk-upstream-main-32bit    \
  && echo 'source "/emsdk/emsdk_env.sh"' >> /root/.bashrc

RUN \
     git clone https://github.com/williamstein/pypyjs \
  && cd pypyjs \
  && git submodule update --init --recursive
