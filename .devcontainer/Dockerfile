# This is an auto generated Dockerfile for ros:desktop-full
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive 

# Requirements
# BEGIN INSTALL packages
RUN apt-get update
RUN apt-get install -q -y --no-install-recommends     dirmngr     gnupg2     && rm -rf /var/lib/apt/lists/*
RUN echo "deb http://snapshots.ros.org/kinetic/final/ubuntu xenial main" > /etc/apt/sources.list.d/ros1-snapshots.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4B63CF8FDE49746E98FA01DDAD19BAB3CBF125EA
ENV LANG=C.UTF-8#RUN
ENV LC_ALL=C.UTF-8
ENV ROS_DISTRO=kinetic
RUN apt-get update && apt-get upgrade -y

# install ros packages
RUN apt-get install -y --no-install-recommends ros-kinetic-desktop-full=1.3.2-0*
RUN apt-get install -y --no-install-recommends ros-kinetic-rqt*
RUN apt-get install -y --no-install-recommends build-essential python-rosdep python-rosinstall python-vcstools
RUN apt-get install -y --no-install-recommends dbus-tests mesa-utils nano python-pip

# install ros moveit
RUN apt-get install -y --no-install-recommends ros-kinetic-moveit*
RUN apt-get install -y --no-install-recommends ros-kinetic-franka-description

#END INSTALL PACKAGES
RUN rm -rf /var/lib/apt/lists/*

# Setup workspace ROS
COPY  ./ros_entrypoint.sh /
RUN bash /ros_entrypoint.sh
RUN rosdep init && rosdep update --rosdistro $ROS_DISTRO

# Correction warning node turtle: process 3135: D-Bus library appears to be incorrectly set up; 
# failed to read machine uuid: UUID file '/etc/machine-id' should contain a hex string of length 32, not length 0, with no other text
# See the manual page for dbus-uuidgen to correct this issue.
RUN mkdir -p /var/lib/dbus/
RUN touch /var/lib/dbus/machine-id
RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Add user
RUN adduser --quiet --disabled-password qtuser && usermod -a -G audio qtuser

# Setup the shell
# Edit /root/.bashrc
RUN echo "\n# Set ROS Kinetic" >> /root/.bashrc
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc
RUN echo "\n# Set ROS Network" >> /root/.bashrc
RUN echo "export ROS_HOSTNAME=localhost" >> /root/.bashrc
RUN echo "export ROS_MASTER_URI=http://localhost:11311" >> /root/.bashrc

CMD ["/bin/bash"]