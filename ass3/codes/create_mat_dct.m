function [F] = create_mat_dct()
%consider i,j as indice of matrix A of size n by n 
% so 0<=i,j<=n-1
A = zeros(8,8,'double');
n=8;
for i=0:n-1
    for j=0:n-1
        if(i==0)
            %sqrt(1/n)
            A(i+1,j+1) = sqrt(1/n);
        else
            A(i+1,j+1) = sqrt(2/n)*cos((pi*(2*j+1)*i)/(2*n));
        end
    end
end
F = A;
%disp(F);
%T = dctmtx(8);
%disp(T);
end
