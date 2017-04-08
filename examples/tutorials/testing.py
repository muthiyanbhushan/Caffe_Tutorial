import numpy as np
import matplotlib.pyplot as plt
import os

# Make sure that caffe is on the python path:
caffe_root = './'  # this file is expected to be in {caffe_root}/examples
import sys
sys.path.insert(0, caffe_root + 'python')

import caffe

# Set the right path to your model definition file, pretrained model weights,
# and the image you would like to classify.
MODEL_FILE = '/home/bhushan/caffe/models/tutorials/deploy.prototxt'
PRETRAINED = '/home/bhushan/caffe/models/tutorials/approach_4_GoogleNet_iter_60000.caffemodel'
IMAGE_FILE = 'examples/tutorials/image.jpg'
caffe.set_mode_cpu()
net = caffe.Classifier(MODEL_FILE, PRETRAINED,
	               mean=np.load(caffe_root +'examples/tutorials/out.npy').mean(1).mean(1),
	               channel_swap=(2,1,0),
	               raw_scale=255,
	               image_dims=(256, 256))
input_image = caffe.io.load_image(IMAGE_FILE)
#plt.imshow(input_image)

prediction = net.predict([input_image])  # predict takes any number of images, and formats them for the Caffe net automatically
print prediction
#plt.plot(prediction[0])
print 'predicted class:', max(prediction[0]), prediction[0].argmax()
# plt.show()
