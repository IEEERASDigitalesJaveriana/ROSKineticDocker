xhost +
docker build -t ros_kinetic_xenial_1.0 .
docker run --gpus all --rm -it \
    --runtime=nvidia\
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/dri:/dev/dri \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    ros_kinetic_xenial_1.0