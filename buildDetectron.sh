#/bin/bash

DETECTRON=/home/nvidia/detectron
git clone https://github.com/facebookresearch/detectron ${DETECTRON}

pip install -r $DETECTRON/requirements.txt

cd $DETECTRON && make


