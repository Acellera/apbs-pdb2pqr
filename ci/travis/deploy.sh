#!/usr/bin/env bash

# Build for conda from PyPI
source deactivate test

export TAG_DESCRIBE=$(git describe)
export BUILD_VERSION=$(echo $TAG_DESCRIBE | sed 's/-/ /g'  | awk '{print $1}')
export BUILD_NUMBER=0

conda build --python 3.5 package/htmd-pdb2pqr/ -c acellera

bash -x ./ci/travis/conda_upload.sh;
