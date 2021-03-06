[labels images] = MNISTDecoder('MNIST/train-labels-idx1-ubyte.mat', 'MNIST/train-images-idx3-ubyte.mat')

fid = fopen('MNIST/train-labels-idx1-ubyte.mat','r','b');
if (fread(fid, 1, 'int32') ~= 2049), 
  disp('wrong labels file')
  return
end
count = fread(fid, 1, 'int32');
labels = fread(fid, count, 'char');
fclose(fid);

fid = fopen('MNIST/train-images-idx3-ubyte.mat','r','b');
if (fread(fid, 1, 'int32') ~= 2051)
  disp('wrong images file')
  return
end
if (fread(fid, 1, 'int32') ~= count)
  disp('images file is incompatible with labels file, check sizes')
  return
end
w = fread(fid, 1, 'int32');
h = fread(fid, 1, 'int32');
images = fread(fid, inf, 'uint8');
fclose(fid);

#note: reshape() works column by column
images = reshape(images, [w*h count]);
images = images';

#uncomment tabbed line below to rescale pixel values to be between 0 and 1
images = double(images) / 255; 