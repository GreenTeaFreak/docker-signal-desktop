#!/bin/sh

docker run   \
	-e DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.Xauthority:/home/signal/.Xauthority \
	signal-desktop --no-sandbox


