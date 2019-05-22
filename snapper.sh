#!/bin/bash

while :
do
    OUTPATH="test-$(date +%s).jpg"
    ffmpeg -f video4linux2 -video_size 640x480 -loglevel quiet -i /dev/video0 -frames:v 1 -y $OUTPATH
    cp $OUTPATH out.jpg
done

