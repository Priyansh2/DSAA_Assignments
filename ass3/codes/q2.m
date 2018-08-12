image = imread('LAKE.TIF');
c = 2;
N = 8;
Q_matrix = [16  11  10  16  24  40  51  61
            12  12  14  19  26  58  60  55
            14  13  16  24  40  57  69  56
            14  17  22  29  51  87  80  62
            18  22  37  56  68  109 103 77
            24  35  55  64  81  104 113 92
            49  64  78  87  103 121 120 101
            72  92  95  98  112 100 103 99]; %quantization matrix 


F = create_mat_dct();
block1 = image(45:45+7, 420:420+7);
subplot(3, 5, 1);
imshow(block1); %original image 
block1_recreate = uint8(complete_dct(block1,F,Q_matrix,c,0));

block2 = image(298:298+7, 427:427+7);
subplot(3, 5, 6);
imshow(block2);%orginal image
block2_recreate = uint8(complete_dct(block2,F,Q_matrix,c,1));

block3 = image(230:230+7, 30:30+7);
subplot(3, 5,11);
imshow(block3); %original image
block3_recreate = uint8(complete_dct(block3,F,Q_matrix,c,2));

function [final_image] = complete_dct(block,F,qm,c,temp)

dct = myDCT(block, F);
subplot(3,5,2+temp*5);
imshow(uint8(dct));
q_dct = myDCT_quantization(dct, qm, c);
subplot(3,5,3+temp*5);
imshow(uint8(q_dct));
deq_dct = myDCT_dequantization(q_dct,qm, c);
subplot(3,5,4+temp*5);
imshow(uint8(deq_dct));
final_image = myIDCT(deq_dct, F);
subplot(3,5,5+temp*5);
imshow(uint8(final_image)); %final image 
end

%{
Comment :- All the three blocks/images are seems to be smooth , less sharp
as compared to their respective original images . Also they appear to be
less distinctive with each other which is overall consequence of 'lossy
compression' which we have done in this question. 
%}