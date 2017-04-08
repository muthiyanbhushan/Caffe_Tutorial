# Caffe_Tutorial
Step by step implementation of caffe model

#Readme file 

DATASET:
	Dataset is a collection of samples:
	A dataset is composed of 
	- Training data
	- Testing data
	- Validation data

	Each set is composed of 
		data = images
		labels = class_name

create separate directory for each image dataset
by following commands

$ mkdir class1_dataset
$ mkdir class2_dataset
$ mkdir class3_dataset

$ cd class1_dataset

#run the following command to get and store the dataset for class1
move the script file for class 1 in this folder.
then do

$ ./download_image1.sh 

press ctrl + c to exit the script file

It will download the dataset for class 1.

delete the .sh file from the directory and store only the images in it.

$ rm -rf download_image1.sh 


#run the following command to get and store the dataset for class2
move the script file for class 2 in this folder.
then do

$ ./download_image2.sh 

press ctrl + c to exit the script file

It will download the dataset for class 2.

delete the .sh file from the directory and store only the images in it.

$ rm -rf download_image2.sh 


#run the following command to get and store the dataset for class3
move the script file for class 3 in this folder.
then do

$ ./download_image3.sh 

press ctrl + c to exit the script file

It will download the dataset for class 3.

delete the .sh file from the directory and store only the images in it.

$ rm -rf download_image3.sh 

have 3 folders for different classes.

we have to rename the images in all the three folders in respective class.

In rename_class1.py change the path of to folder in your derectory.

Run
$ python rename_class1.py

similarly, do it for classs2 and class3

$ python rename_class2.py

$ python rename_class3.py


This will rename the files with their respective class name.

create two directories "train" and "val" 

$ mkdir train

$ mkdir val

manually move the images from all the folders in train and validation datasets.

I would suggest to atleast have 300 images out of average 1800 images in validation dataset for each class remaining images will be for training of the model.
NOTE: Make sure that cut paste the images because we don't want the train and test images to be same.
This will avoid testing of the images which are already trained. That means model will be trained properly and will not be biased.

In simple terms: If you evaluate on the same data that you used for training, your precision and recall will be biased because your model has already seen the data. 

once your train and validation dataset is ready 

we need to create label files for training and validation dataset.
as train.txt and val.txt

copy the file create_train.py in train folder
and create_val.py in val folder

run the files as below

$ python create_train.py >> /path/to/caffe/example/tutorial/train.txt
$ python create_val.py >> /path/to/caffe/example/tutorial/val.txt

this will create our train and validation label files.

now move your train and val dataset of images folder named as "train" and "val" to the "/path/to/caffe/example/tutorial" folder 

Until now we have created the dataset and the label files.
Now we have long wy to go.

1) We need to create lmdb file:

LMDB(Lightening Memory Mapped Database):
	LMDB is B-Tree based database management library modeled lossely on the BerkelyDB API, but much simplified version. The entire database is exposed in a memory mapand all data fetches return data directly from the mapped memory. So, no malloc's occur during the data fetches. It requires no page caching layer of its own. Library is extremely simple and it is extremely high performance and memory efficient.

follow the script file to create the lmdb files.

Change the directory path as per your paths.

Google logging tool is used to create lmdb:
Google glog defines a series of macros that simplify many common logging tasks. Google glog is a library that implements application-level logging. This library provides logging APIs based on C++-style streams and various helper macros. We can log a message by simply streaming things to LOG.

LMDB files will be created in the same folder where your training dataset is there i.e in examples/tutorials folder.

now create new directory in models folder named "tutorial" again (for simplicity)

$ mkdir ~/caffe/models/tutorials

$ cd ~/caffe/models/tutorials

paste the "solver.prototxt" and "train_model.prototxt" files here.

solver file tells you the following information:
1) Maximum number of iterations.
2) network architecture to train the model.
	In our case we will be using existing Alexnet model which has 7 layers.
3) Average loss.
4) Base learning rate.
5) Point of snapshots so that we can start our training from there if something goes wrong in between.
6) We need to mention the mode in which we want to train our model.
	CPU or GPU mode.

Please check the attached profiling files in the profiling folders.
There is a good comparison for the performance of the model and you will get the clear idea of how different models work.
I have used Torch to do profiling of different models.

"train_model.prototxt" defines your network model to train.


Copy "train.sh" file in "examples/tutorials" folder.

"train.sh" file starts your training of the model. Make sure to change the path of the solver file to "models/tutorials".

Make sure that everything works perfect.

Now once your model is trained.
We need to test the model.
Move "test.py", "con_binary_to_npy.py" and "make_mean.sh" files to "examples/tutorials" folder.

$ cd ~/caffe/examples/tutorials/
$ ./make_mean.sh

This will create the image mean from the lmdb files.

--why to have the mean of the images ?
ans: Mean is what will be subtracted from your input data to center it. For neural
networks the data need to have zero mean, while the input images usually have positive
mean, hence the need of the subtraction. The mean subtracted should be the same that
was used for training, so using mean from the file associated with the model is correct.
 
$ python examples/tutorials/con_binary_to_npy.py examples/tutorials/mean.binaryproto examples/tutorials/out.npy

This will create the .npy format for the mean file and will be given to the testing model.

Now we need to test our model.

Copy "testing.py" and the test image "image.jpg" to "examples/tutorials" folder.
 
The output will be the predicted class with the prediction rate.

 

