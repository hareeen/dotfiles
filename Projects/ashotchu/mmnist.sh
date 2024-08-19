# Download moving MNIST dataset

mkdir -p data/moving_mnist
cd data/moving_mnist

wget http://www.cs.toronto.edu/~nitish/unsupervised_video/mnist_test_seq.npy
wget https://github.com/golbin/TensorFlow-MNIST/raw/master/mnist/data/train-images-idx3-ubyte.gz

wget https://github.com/chengtan9907/OpenSTL/releases/download/v0.1.0/mnist_cifar_test_seq.npy.tar
tar -xzvf mnist_cifar_test_seq.npy.tar
rm mnist_cifar_test_seq.npy.tar
