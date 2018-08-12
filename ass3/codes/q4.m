image = imread('LAKE.TIF');
image_info = imfinfo('LAKE.TIF');
h = image_info.Height;
w = image_info.Width;
N = 8;
Q_matrix = [16  11  10  16  24  40  51  61
            12  12  14  19  26  58  60  55
            14  13  16  24  40  57  69  56
            14  17  22  29  51  87  80  62
            18  22  37  56  68  109 103 77
            24  35  55  64  81  104 113 92
            49  64  78  87  103 121 120 101
            72  92  95  98  112 100 103 99]; 

F = create_mat_dct();
temp = 1;
final_image = zeros(h, w,'uint8');
for c=1:15
    for i=1:8:h
        for j=1:8:w
            input_patch = image(i:i+7 , j:j+7); 
            output_patch = complete_dct(input_patch,F,Q_matrix,c);
            for k=1:8
                for l=1:8
                    final_image(i+k-1,j+l-1) = output_patch(k,l);
                end
            end
        end
    end
    %figure
    %subplot(5,4,temp);
    if(c==10)
        imwrite(final_image,'output_image_c_10.png'); %image for c=10
    elseif(c==4)
        imwrite(final_image,'output_image_c_4.png'); %image for c=4
    end

    imshow(final_image,'Border','tight'); %show all images cooresponding to all c's
    entropy = My_entropy(final_image); %entropy of particular c
    rmse = RMSE(image,final_image); %rmse of particular c
    fprintf("for c=%d :- entropy=%f , rmse=%f\n",c,entropy,rmse);
end
                    
function [final_image] = complete_dct(block,F,qm,c)

dct = myDCT(block, F);
q_dct = myDCT_quantization(dct, qm, c);
deq_dct = myDCT_dequantization(q_dct,qm, c);
final_image = myIDCT(deq_dct, F);
end      


%{
Comment :- As we can clearly see that with increase in the value of
'c'(compression factor) , there will be more distortions perceptible.
for c = 1,2 one can clearly see the various parts in image but as we went
further to c= 3 ,4 or higher we feel whole image to be distorted. As per
question I would say for c=4 , the distortions seems to be just
perceptible (output image corresponding to c=4 is given). For c =10 , 
there is an output image in which there is so much
distortion. 
%}



