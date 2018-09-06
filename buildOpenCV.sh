#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

sudo apt-get install qtbase5-dev

sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

cd
rm -rf buildOpenCVTX2
git clone https://github.com/jetsonhacks/buildOpenCVTX2.git
cd buildOpenCVTX2
git apply ${SCRIPT_DIR}/OpenCV_Xavier.patch

./buildOpenCV.sh
