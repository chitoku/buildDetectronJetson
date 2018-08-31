#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo -e "\e[43m ### Setting Power Model to MaxN ###"
sudo nvpmodel -m 0
sudo nvpmodel -q

# Install Dependencies

echo -e "\e[45m ### sudo apt-get update ###"
sudo apt-get update
echo -e "\e[45m ### sudo apt-get install ###"
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
      python-setuptools \
      graphviz 

echo -e "\e[41m ### bdist_wheel install ###"
pip install --user wheel
python setup.py bdist_wheel

echo -e "\e[105m ### pip install ###"
pip install --user \
      wheel \
      future \
      numpy \
      protobuf \
      pyyaml \
      typing \
      hypothesis

echo -e "\e[45m ### sudo apt-get install libgflags-dev ###"
sudo apt-get install -y --no-install-recommends libgflags-dev

# Clone & Build

cd
echo -e "\e[100m ### git clone pytorch ###"
git clone https://github.com/pytorch/pytorch.git && cd pytorch
git checkout v0.4.1
git submodule update --init --recursive
git apply ${DIR}/pytorch_CUDA10.patch
echo -e "\e[104m ### PyTorch build ###"
FULL_CAFFE2=1 python setup.py install --user

# Test the Caffe2 Installation

echo -e "\e[44m ### Test the Caffe2 Installation ###"
cd ~ && python -c 'from caffe2.python import core' 2>/dev/null && echo "Success" || echo "Failure"

echo -e "\e[42m ### Test Caffe2 with GPU support  ###"
python2 -c 'from caffe2.python import workspace; print(workspace.NumCudaDevices())'



