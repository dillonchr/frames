#!/bin/bash

while :
do
    OUTPATH="test-$(date +%s).jpg"
    ffmpeg -f video4linux2 -video_size 640x480 -loglevel quiet -i /dev/video2 -frames:v 1 -y $OUTPATH
    if [ "$?" -eq "0" ]; then
        DATE=$(date -r $(echo $OUTPATH | tr -dc '0-9'))
        convert -background '#00000080' -font FiraMono-Regular.otf -fill white label:"$OUTPATH" miff:- | composite -gravity southeast -geometry +0+3 - $OUTPATH "$OUTPATH-anno.jpg"
        rm $OUTPATH
        cp "$OUTPATH-anno.jpg" out.jpg
    fi
done

