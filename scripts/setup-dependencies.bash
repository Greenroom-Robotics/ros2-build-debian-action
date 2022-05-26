ROS2_DISTRO="$1"

# Install required tools
sudo apt update && sudo apt install -y \
  debhelper \
  dh-python \
  python3-bloom \
  python3-catkin-pkg \
  python3-colcon-common-extensions \
  fakeroot || exit $?

# Initialize and update rosdep
sudo rosdep init || true
rosdep update || exit $?
