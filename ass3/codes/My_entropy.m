function [entropy] = My_entropy(im)
p = imhist(im); %freq. distribution of colors of image vs colour in range (0-255)  
[row , col] = size(im); %row = height , col = width
total_elements = row*col;
%total_elements
pi = double(p)/double(total_elements); %pi is probablity of each element i
entropy = -sum(pi.*log2(pi+1e-08));
%disp(entropy);
%entropy
end