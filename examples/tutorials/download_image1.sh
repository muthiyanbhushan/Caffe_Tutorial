#!/usr/bin/env sh

EXAMPLE=~/images

wget -O $EXAMPLE/class1.txt "http://image-net.org/api/text/imagenet.synset.geturls?wnid=n02084071"
wget -i $EXAMPLE/class1.txt

wget --input-file=class1.txt


