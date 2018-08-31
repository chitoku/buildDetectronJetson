#!/bin/bash

sudo apt-get install python-scipy python-matplotlib
pip install --user scipy 

pip install --user cython

COCOAPI=/home/nvidia/cocoapi
git clone https://github.com/cocodataset/cocoapi.git ${COCOAPI}
cd ${COCOAPI}/PythonAPI
sudo make install

