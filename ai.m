function main()
	load net;
	[name, path] = uigetfile("./*.png");
	L = imread([path name]);
	x = predict(net, double(L));
	disp(x);
end

clear all;
close all;
clc;
main()
