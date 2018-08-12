image = imread('LAKE.TIF');
image_info = imfinfo('LAKE.TIF');
h = image_info.Height;
w = image_info.Width;
c = 2;
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
for i = 1:N:h
    for j = 1:N:w
        I = image(i:i+7, j:j+7); %for each 8 by 8 block do dct processing 
        dct = myDCT(I,F);
        %imshow(uint8(dct));
        q_dct = myDCT_quantization(dct, Q_matrix, c);
        %imshow(uint8(q_dct));
        for x = 1:N %replacing old(original) patch by new(transformed/converted) patch
            for y = 1:N
                final_image(i+x-1, j+y-1) = q_dct(x, y);  
            end
        end 
        %imshow(uint8(final_image));
    end
end
figure
imshow(final_image);
imwrite(final_image,'q3_output_image.png');


%{
Comment :- As from ouput image one can clearly see that it is almost black
in colour with some little amounts of white dots . This happen because of
the quantization process of dct while compressing the image which make most
of the entries of image (final image ) matrix to be 0 and hence black
colour appears everywhere 
%}