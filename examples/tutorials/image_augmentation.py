import Image
import ImageOps
import os

#File used to perform following actions on the image.
# 1) RGB -> Grayscale.
# 2) Original Image -> Mirror image.

path1 = "/home/bhushan/Approach_6_DB/cat"

listing = os.listdir(path1)
i=0  
for file in listing:
	print file
	name = "cat"
	img = Image.open(path1+'/'+file)
	img.save(name+"_"+str(i)+".JPG")
	i=i+1
	grayscale = ImageOps.grayscale(img)
	grayscale.save(name+"_"+str(i)+".JPG")
	i=i+1
	mirror = ImageOps.mirror(img)
	mirror.save(name+"_"+str(i)+".JPG")
	i=i+1
	grayscale_mirror = ImageOps.mirror(grayscale)
	grayscale_mirror.save(name+"_"+str(i)+".JPG")
	i=i+1
print i
