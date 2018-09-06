#!/bin/bash

sudo apt-get install python-scipy python-matplotlib
sudo pip install scipy 

sudo pip install cython

COCOAPI=/home/nvidia/cocoapi
git clone https://github.com/cocodataset/cocoapi.git ${COCOAPI}
cd ${COCOAPI}/PythonAPI
sudo make install

