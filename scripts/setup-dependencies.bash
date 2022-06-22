#!/bin/bash

if [[ -z "$ROSDISTRO_OVERLAY_INDEX_URL" ]]
then
    unset ROSDISTRO_OVERLAY_INDEX_URL
fi

if [[ -z "$GHCR_PAT" ]]
then
    unset GHCR_PAT
else
    curl -s https://$GHCR_PAT@raw.githubusercontent.com/Greenroom-Robotics/rosdistro/main/scripts/setup-rosdep.sh | bash -s
    curl -s https://$GHCR_PAT@raw.githubusercontent.com/Greenroom-Robotics/packages/main/scripts/setup-apt.sh | bash -s
fi

# Initialize and update rosdep
sudo apt-get update
sudo rosdep init || true
rosdep update || exit $?
