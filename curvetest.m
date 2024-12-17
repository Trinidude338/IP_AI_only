clear all;
close all
clc;

L = zeros([128, 128, 3]);
start = 100;
oscillations = 20;
amplitude = 2;

while(1)
	for x = 1:128
		L2(uint8((sin((x+start)/oscillations)+1)*amplitude)+32, x, :) = 1;
	end
	imshow(L2);
	L2 = L;
	start = start + 1;
	pause(0.016);
end

%x = 1:128;
%y = sin(x);

%plot(x, y);
