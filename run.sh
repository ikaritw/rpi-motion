#!/bin/sh

IMAGE_NAME=ikaritw/rpi-motion
VIDEO_DIRECTORY=`pwd`/videos

mkdir -p $VIDEO_DIRECTORY
docker run -d \
	--name motion \
	--device=/dev/video0:/dev/video0 \
	-v `pwd`/motion.conf:/etc/motion/motion.conf \
	-v $VIDEO_DIRECTORY:/mnt/motion \
	-p 8081:8081 \
	-p 8080:8080 \
	$IMAGE_NAME
