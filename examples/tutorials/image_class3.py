import Image
import ImageOps
import os


path1 = "/home/bhushan/class3_dataset"

listing = os.listdir(path1)
i=1  
for file in listing:
	os.rename(os.path.join(path1, file), os.path.join(path1, "class3_"+str(i)+'.jpg'))
	i = i+1
