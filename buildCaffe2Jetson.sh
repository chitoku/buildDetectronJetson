#!/bin/bash

sudo nvpmodel -m 0
sudo nvpmodel -q

# Install Dependencies

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      git \
      libgoogle-glog-dev \
      libgtest-dev \
      libiomp-dev \
      libleveldb-dev \
      liblmdb-dev \
      libopencv-dev \
      libopenmpi-dev \
      libsnappy-dev \
      libprotobuf-dev \
      openmpi-bin \
      openmpi-doc \
      protobuf-compiler \
      python-dev \
      python-pip \
      python-numpy \
      graphviz 
                                
pip install --user \
      future \
      numpy \
      protobuf \
      pyyaml \
      typing \
      hypothesis

sudo apt-get install -y --no-install-recommends libgflags-dev





# Clone & Build

cd
git clone https://github.com/pytorch/pytorch.git && cd pytorch
git submodule update --init --recursive
sudo FULL_CAFFE2=1 python setup.py install

# Test the Caffe2 Installation

cd ~ && python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"

      
