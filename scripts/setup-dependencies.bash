ROS2_DISTRO="$1"


# Initialize and update rosdep
sudo apt update
sudo rosdep init || true
rosdep update || exit $?
