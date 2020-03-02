#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <srcdir> <destdir>"
    exit 1
else
    m4adir=$1
    destdir=$2
fi

mkdir -p $destdir

if [ -d $m4adir ]; then
    files=$(ls $m4adir)
    for filename in $files
    do
    ffmpeg -y -i $m4adir/$filename -ar 16000 `echo "$destdir/$filename"|sed 's/.m4a/.wav/g'`
    echo "FILE: "$filename" converted successfully" > log.txt
    done
else
    echo "ERROR "$m4adir" dir not found"
fi
