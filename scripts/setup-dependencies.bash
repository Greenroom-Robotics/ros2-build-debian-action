#!/bin/bash

if [[ -z "$ROSDISTRO_OVERLAY_INDEX_URL" ]]
then
    unset ROSDISTRO_OVERLAY_INDEX_URL
fi

if [[ -z "$GHCR_PAT" ]]
then
    unset GHCR_PAT
fi

# Initialize and update rosdep
sudo apt-get update
sudo rosdep init || true
rosdep update || exit $?
