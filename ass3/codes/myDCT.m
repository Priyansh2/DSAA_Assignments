function [DCT] = myDCT(im,F)
%assuming im is the matrix of input image 
% F - DCT matrix
  
    I = double(im);
    DCT = F * I * F';
%DCT = blockproc(I,[8 8],dct);
 
end