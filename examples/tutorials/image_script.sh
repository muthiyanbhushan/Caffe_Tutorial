#!/usr/bin/env sh

import urllib
import image_scraper 

wget -O class1.txt "http://image-net.org/api/text/imagenet.synset.geturls?wnid=n02084071"
wget -i class1.txt
wget -O class2.txt "http://image-net.org/api/text/imagenet.synset.geturls?wnid=n02121808"
wget -i class2.txt
wget -O class3.txt "http://image-net.org/api/text/imagenet.synset.geturls?wnid=n00007846"
wget -i class3.txt

wget --input-file=class1.txt
wget --input-file=class2.txt
wget --input-file=class3.txt


wget -i class1.txt


def line_read1():
	i=0
	name="class1"
	#read file
	file=open("class1.txt","r")
	lines1=file.readlines()
	file.close()
	
	#look for patterns
	for line in lines1: 
	urllib.urlretrieve(line, name+"_"+str(i)+".JPG")
	image-scraper -s /home/bhushan/class1/(name+"_"+str(i)+".JPG") line

def line_read2():
	i=0
	name="class2"
	#read file
	file=open("class2.txt","r")
	lines1=file.readlines()
	file.close()
	
	#look for patterns
	for line in lines2: 
	urllib.urlretrieve(line, name+"_"+str(i)+".JPG")
	image-scraper -s /home/bhushan/class2/(name+"_"+str(i)+".JPG") line 

def line_read3():
	i=0
	name="class3"
	#read file
	file=open("class3.txt","r")
	lines1=file.readlines()
	file.close()
	
	#look for patterns
	for line in lines3: 
	urllib.urlretrieve(line, name+"_"+str(i)+".JPG")
	image-scraper -s /home/bhushan/class3/(name+"_"+str(i)+".JPG") line

main()
	line_read1()
	line_read2()
	line_read3()











