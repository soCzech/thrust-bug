FROM nvidia/cuda:11.0-devel-ubuntu20.04
# install cuddnn
# https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.1/ubuntu18.04-x86_64/devel/cudnn8/Dockerfile
ENV CUDNN_VERSION 8.0.5.39
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcudnn8=$CUDNN_VERSION-1+cuda11.0 \
    libcudnn8-dev=$CUDNN_VERSION-1+cuda11.0 \
 && apt-mark hold libcudnn8 \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    git \
    unzip \
    build-essential \
    libtool \
 && rm -rf /var/lib/apt/lists/*

RUN wget -qO- "https://cmake.org/files/v3.17/cmake-3.17.5-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

RUN wget https://download.pytorch.org/libtorch/cu110/libtorch-cxx11-abi-shared-with-deps-1.7.1%2Bcu110.zip \
        -q -O /tmp/libtorch-cxx11-abi-shared.zip \
 && unzip /tmp/libtorch-cxx11-abi-shared.zip -d /usr/local \
 && rm /tmp/libtorch-cxx11-abi-shared.zip

