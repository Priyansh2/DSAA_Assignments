function [imdqDCT] = myDCT_dequantization(imqDCT,qm,c)
%point to point multiplication of matrix (imqDCT and qm) 
%in addition of simgle multiplication of c to that element

imdqDCT = zeros(8,8);
for i=1:8
    for j=1:8
        imdqDCT(i,j) = imqDCT(i,j).*(c*qm(i,j));
    end
end
end