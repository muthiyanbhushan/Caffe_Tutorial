-- first CNN + pool

net = nn.Sequential()

----First layer ------

net:add(nn.SpatialConvolution(3,6,5,5,2,2,2,2))
net:add(nn.ReLU())
------second layer -----
net:add(nn.SpatialConvolution(6,6,5,5,1,1,2,2))
net:add(nn.ReLU())
net:add(nn.SpatialMaxPooling(2,2,2,2))
--------- third layer
net:add(nn.SpatialConvolution(6,6,5,5,1,1,2,2))
net:add(nn.ReLU())
net:add(nn.SpatialMaxPooling(2,2,2,2))
---output --------
net:add(nn.View(-1))
--net:add(nn.Linear(393216,1000))

return net


