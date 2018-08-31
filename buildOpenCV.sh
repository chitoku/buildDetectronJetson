#!/bin/bash

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

sudo apt-get install qtbase5-dev

cd
git clone https://github.com/jetsonhacks/buildOpenCVTX2.git
cd buildOpenCVTX2
git apply $PWD/OpenCV_Xavier.patch


