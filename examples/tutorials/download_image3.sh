#!/usr/bin/env sh


EXAMPLE=~/images/image3

wget -O $EXAMPLE/class3.txt "http://image-net.org/api/text/imagenet.synset.geturls?wnid=n00007846"
wget -i $EXAMPLE/class3.txt

wget --input-file=class3.txt


