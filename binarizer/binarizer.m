%This program takes an image and converts it to ones and zeros.
%Make sure you have the latest Octave version installed (or the image package, 
%which the latest Octave version, 4.0.2, comes with). 
%Use the command pkg load image to load the image package.

I = imread ("R.png");

BW = im2bw(I, .7);

BW = 1-BW