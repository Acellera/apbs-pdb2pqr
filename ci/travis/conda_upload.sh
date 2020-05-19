#!/bin/bash
# (c) 2015-2018 Acellera Ltd http://www.acellera.com
# All Rights Reserved
# Distributed under HTMD Software License Agreement
# No redistribution in whole or part
#

export ANACONDA_TOKEN=$ANACONDA_TOKEN_BASIC
export CHANNEL=acellera
export PACKAGE_NAME=htmd-pdb2pqr

conda activate base
conda install anaconda-client -y -q

echo "Uploading to channel: $CHANNEL : PACKAGE $PACKAGE_NAME"

anaconda -t $ANACONDA_TOKEN upload  $HOME/miniconda/conda-bld/noarch/$PACKAGE_NAME-[0-9]*.tar.bz2 -u $CHANNEL

if [ $? -ne 0 ]; then
    exit 1
fi



