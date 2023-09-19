docker run  -it \
            --gpus all \
            -d \
            -v /home/selflab/catkin_kiss/src/ai-imu-dr:$HOME/src/ai-imu \
            --env="DISPLAY" \
            --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
            --name ai-imu-1.0 \
            --ipc=host \
            eric/ai-imu:1.0 \
            /bin/bash