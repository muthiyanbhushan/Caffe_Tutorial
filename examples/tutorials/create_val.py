import Image
import ImageOps
import os


path1 = "/home/bhushan/val"

listing = os.listdir(path1)
i=0  
for file in listing:
	
	if "class1" in file:
		print file,"0"
		continue
	if "class2" in file:
		print file,"1"
	if "class3" in file:
		print file,"2"
	

