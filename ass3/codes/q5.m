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
final_image = zeros(h, w,'uint8');
entropy = zeros(1,100);
rmse = zeros(1,100);
for c=1:100
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
    entropy(c) = My_entropy(final_image); %enropy array 
    rmse(c) = RMSE(image,final_image); %rmse array
end

plot(entropy,rmse); %entropy on y axis and rmse on x axis

 
 function [final_image] = complete_dct(block,F,qm,c)

dct = myDCT(block, F);
q_dct = myDCT_quantization(dct, qm, c);
deq_dct = myDCT_dequantization(q_dct,qm, c);
final_image = myIDCT(deq_dct, F);
end      
