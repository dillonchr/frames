#!/bin/bash

FILE=$1

DATE=$(date -r $(echo $FILE | tr -dc '0-9'))
convert -background '#00000080' -font FiraMono-Regular.otf -fill white label:"$DATE" miff:- | composite -gravity southeast -geometry +0+3 - $FILE "$FILE-anno.jpg"

if [ "$?" -eq "0" ]; then
    rm $FILE
    cp "$FILE-anno.jpg" out.jpg
fi

