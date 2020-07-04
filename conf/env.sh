#!/usr/bin/env bash

set -a

# path to the data to be backed up
DATA_PATH=
# host to push the data to
TARGET_HOST=
# path to where the data should be put on the TARGET_HOST
TARGET_PATH=
# path to private key file for ssh (put the public key in the user's 'authorized_keys' on the TARGET_HOST
KEY_PATH=
# path to 'known_hosts' file
KNOWN_HOSTS_PATH=
# user on TARGET_HOST who has write access to TARGET_PATH and has public key in 'authorized_keys' file
TARGET_USER=