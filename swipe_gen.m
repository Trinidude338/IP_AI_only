clear all;
close all;
clc;

L = ones([128 128 3]);
L = L .* 255;
S = [0 1 0; 1 1 1; 0 1 0];
numImg = 40000;

!rm -r trainingdata/up
!mkdir trainingdata/up
!rm -r trainingdata/down
!mkdir trainingdata/down
!rm -r trainingdata/left
!mkdir trainingdata/left
!rm -r trainingdata/right
!mkdir trainingdata/right
out = createArray([128, 128, 3, numImg], "uint8");
D = 1;
count = 1;

%makeCurve(64, 1, 20, 2)
while(D<=numImg*4)
	%from down to up
	L2 = L;
	randomOffset = randi([1, 100]);
	for i = 1:100
		n = makeCurve(64, i+randomOffset, 20, 2);
		randomint = randi([0, 1]);
		first = ((60+n)+randomint)-2;
		last = ((60+n)+randomint)+2;
		for j = first:last
			L2(i, j, :) = 0;
		end
	end
	L2 = imopen(imclose(L2, S), S);
	imwrite(L2, "trainingdata/up/"+count+".png");
	%from up to down
	L2 = L;
	randomOffset = randi([1, 100]);
	for i = 25:100
		n = makeCurve(64, i+randomOffset, 20, 2);
		randomint = randi([0, 1]);
		first = ((60+n)+randomint)-2;
		last = ((60+n)+randomint)+2;
		for j = first:last
			L2(i, j, :) = 0;
		end
	end
	L2 = imopen(imclose(L2, S), S);
	imwrite(L2, "trainingdata/down/"+count+".png");
	%from right to left
	L2 = L;
	randomOffset = randi([1, 100]);
	for j = 1:100
		n = makeCurve(64, j+randomOffset, 20, 2);
		randomint = randi([0, 1]);
		first = ((60+n)+randomint)-2;
		last = ((60+n)+randomint)+2;
		for i = first:last
			L2(i, j, :) = 0;
		end
	end
	L2 = imopen(imclose(L2, S), S);
	imwrite(L2, "trainingdata/left/"+count+".png");
	%from left to right
	L2 = L;
	randomOffset = randi([1, 100]);
	for j = 28:128
		n = makeCurve(64, j+randomOffset, 20, 2);
		randomint = randi([0, 1]);
		first = ((60+n)+randomint)-2;
		last = ((60+n)+randomint)+2;
		for i = first:last
			L2(i, j, :) = 0;
		end
	end
	L2 = imopen(imclose(L2, S), S);
	imwrite(L2, "trainingdata/right/"+count+".png");
	D = D + 4;
	count = count + 1;
end

function data = makeCurve(x, phase, oscillations, amplitude)
	data = uint8((sin((x+phase)/oscillations)+1)*amplitude);
end
