#!/usr/bin/env sh


EXAMPLE=~/images

wget -O $EXAMPLE/class2.txt "http://image-net.org/api/text/imagenet.synset.geturls?wnid=n02121808"
wget -i $EXAMPLE/class2.txt

wget --input-file=/class2.txt


