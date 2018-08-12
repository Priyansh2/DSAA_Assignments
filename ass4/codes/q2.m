total_time=6;
total_dist=100;
F = 400; %source frequency 
Fs = 8000; %sampling frequency
C = 340; %speed of sound 
Vs = double(total_dist/total_time); %speed of source
f1 = double((F*C)/(C-Vs)); %when source is approaching the receiver
f2 = double((F*C)/(C+Vs)); %when source is moving away from reciver
j=1;
for i=0:1/Fs:6
    t(j)=i;
    j=j+1;
end
for i=1:24000 %when source is approaching receiver
    d = double(50-Vs*(i/Fs));
    if d>0 && t(i)<3
        Y(i) = double(cos(2*pi*f1*t(i))/d);
    end
end

for i=24001:48000 %when source is away from receiver
    d = double(Vs*(i/Fs)-50);
    if d>0 && t(i)>=3
        Y(i) = double(cos(2*pi*f2*t(i))/d);
    end
end
audiowrite('train.wav',Y,8000);
sound(Y,8000);