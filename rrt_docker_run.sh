#!/usr/bin/env bash
xhost +local:docker

if [ $# -gt 0 ]; then
	if [ "$1" == "same" ]; then
		docker exec -it rrt_docker bash
	else
		docker run --name rrt_docker --rm -it --net=host --privileged \
			-v /home/$USER/rrt-tutorial:/root/rrt-tutorial \
			-e DISPLAY=$DISPLAY \
			-w /root/rrt-tutorial \
			--env="DISPLAY" \
			--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
			 rrt_docker:$1
	fi
else
	echo "please provide docker tag name."
fi
