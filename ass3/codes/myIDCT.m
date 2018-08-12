function [IDCT] = myIDCT(im,F)
I = double(im);
T = inv(F);
IDCT = T*I*T';
%idct = @(block_struct) T * block_struct.data * T';
%IDCT = blockproc(I,[8 8],idct);

%IDCT = uint8(round(IDCT));

end