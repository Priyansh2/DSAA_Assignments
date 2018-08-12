function [rmse] = RMSE(im1,im2)
%RMSE - Root Mean Square Error
%two images im1 and im2 of arbitrary size 
[h , w] = size(im1);
error = double(0.0);

for i=1:h
    for j=1:w
        a = double(im1(i,j));
        b = double(im2(i,j));
        error = error + double((a-b).^2); %calculating sum of sqaures
    end
end
rmse = double(sqrt(double(error)/double(h*w)));
end 