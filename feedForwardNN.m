function output = feedForwardNN(Vin, Mw1, Vb1, n, Mw2, Vb2, m)

%Experimental

% this is a MLP, only one hidden layer (i.e. 3 layers)
% input:   Vin = input Neurons Vector
%          Mw1 = weights between input layer and hidden layer matrix
%          Vb1 = bias weights between input layer and hidden layer vector
%          n = number of hidden nuerons
%          Mw2 = weights between hidden layer and output layer matrix
%          Vb2 = bias weights between hidden layer and output layer
%          m = number of output neurons

% make sure parameters are correct

%Get the input data from a file. The way its written, it requires the extra at
%the top to be removed
Vin = importdata('Experimental files/trainingSamp1-2.txt');
%Reshape it into a vector
Vin = reshape(Vin, 784, 1);

n = 15;
m = 36;

if (size(Vin,1) > 1 && size(Vin,2) == 1) Vin = Vin'; end
if (size(Vin,1) ~= 1)
  disp('input needs to be a vector');
  return;
end
Vb1=ones(1,15)*.1;
if (size(Vb1,1) > 1 && size(Vb1,2) == 1) Vb1 = Vb1'; end
if (size(Vb1,1) ~= 1)
  disp('Vb1 needs to be a vector');
  return;
end
Vb2=ones(1,36)*.1;
if (size(Vb2,1) > 1 && size(Vb2,2) == 1) Vb2 = Vb2'; end
if (size(Vb2,1) ~= 1)
  disp('Vb2 needs to be a vector');
  return;
end
if (length(Vb1) ~= n)
  disp('invalid Vb1');
  return;
end
if (length(Vb2) ~= m)
  disp('invalid Vb2');
  return;
end

%Initialize Mw1
Mw1=zeros([784 15]);
Mw1 = Mw1 + .1;

if (sum(size(Mw1) == [length(Vin) n]) ~= 2)
  disp('invalid Mw1 matrix dimensions');
  return;
end

%Initialize Mw2
Mw2= zeros([15 36]);
Mw2 = Mw2 + .1;

if (sum(size(Mw2) == [n m]) ~= 2)
  disp('invalid Mw2 matrix dimensions');
  return;
end

% calculate hidden layer output a = Vin * Mw1
output = sigmoid((Vin * Mw1) + Vb1);
output = sigmoid((output * Mw2) + Vb2);