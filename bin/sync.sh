#!/usr/bin/env bash

set -exo pipefail


# first, sync all the data
KEY_PATH=${KEY_PATH:?}
echo KEY_PATH ${KEY_PATH}

TARGET_PATH=${TARGET_PATH:?}
echo TARGET_PATH ${TARGET_PATH}

TARGET_HOST=${TARGET_HOST:?}
echo TARGET_HOST ${TARGET_HOST}

TARGET_USER=${TARGET_USER:?}
echo TARGET_USER ${TARGET_USER}

DATA_PATH=${DATA_PATH:-/data/output/Camera1}

rsync -avc -e "ssh -i ${KEY_PATH}" ${DATA_PATH}/ ${TARGET_USER}@${TARGET_HOST}:${TARGET_PATH}/


# don't remove folders more recent than seven days ago
DAYS_TO_KEEP=7

echo Using path for data \[${DATA_PATH}\]

find ${DATA_PATH} -type d -mtime +${DAYS_TO_KEEP} -exec rm -rf {} \;

