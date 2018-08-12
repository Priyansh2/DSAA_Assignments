function [imqDCT] = myDCT_quantization(imDCT,qm,c)
%c is number 
%imDct is block(matrix) of size 8 by 8 computed after doinf DCT of image by F  
%dividing image (imDCT) by c times the qunatization matrix (c*qm)

imqDCT = zeros(8,8);
for i=1:8
    for j=1:8
        imqDCT(i,j) = round(imDCT(i,j)./(c*qm(i,j)));
    end
end

end