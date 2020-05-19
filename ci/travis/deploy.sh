#!/usr/bin/env bash

export TAG_DESCRIBE=$(git describe)
export BUILD_VERSION=$(echo $TAG_DESCRIBE | sed 's/-/ /g'  | awk '{print $1}')
export BUILD_NUMBER=0

conda build package/htmd-pdb2pqr/ -c acellera

bash -x ./ci/travis/conda_upload.sh;
