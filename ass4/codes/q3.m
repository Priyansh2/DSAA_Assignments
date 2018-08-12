    
    I = imread('images/7.jpg'); %reading the original image 
    if ndims(I)>=3 %if dimension of image >=3 then convert into gray scale format 
        %disp(1);
        I = rgb2gray(I);
    end
    I_double = im2double(I);
    [V,E] = eig(cov(I_double)); 
    [Lv,Bv] = size(V); %Lv is the length of eigen vector matrix and Bv is the width of eigen vector matrix 
    [Le,Be] = size(E); %Le is the length of eigen value matrix and Be is the width of eigen value matrix 
    changed_I = double(I)*V; %comverted image when multiplied by eigen vector 
    Eigen_mat = zeros(Le,2,'double');
     for i=1:Le %creating required the eigen matrix 
         Eigen_mat(i,1) = E(i,i);
         Eigen_mat(i,2) = i;
     end
     [m,n] = size(Eigen_mat);
     mean = sum(Eigen_mat)/m; %computing mean of first col of eigen matrix and stored it in 'eigval_avg'
     eigval_avg = mean(1); 
     c = 10; %compression factor

     for i=1:4
         subplot(2,2,i); %plotting particular image under 4 different compression percentage 
         [original_image , percent_compression] = image_reconstruction(c,eigval_avg,changed_I,Eigen_mat,V,Le);
         imshow(original_image);
         title(['compression',num2str(uint8(percent_compression)) '%' ]);
         c=c*10;
     end
 function [reconstructed_image percent_compress] = image_reconstruction(compr_factor,eigval_avg,changed_img,eig_mat,eig_vector,len_eigval)
     count=0;
     rate=0;
     [row ,col] = size(changed_img);
     for i=1:len_eigval
         if double(eigval_avg/compr_factor) > eig_mat(i,1)
             for j=1:row
                 changed_img(j,i)=0; 

             end
             
             count=count+1;
         end
     end
     rate = (count*100)/len_eigval;
     reconstructed_image = uint8(changed_img*transpose(eig_vector));
     percent_compress = rate;
 end
     
 %{
Conclusion:-
Compression only succeeds when we are able to keep the variant high 
frequencies and removed the low frequencies in the image
}%