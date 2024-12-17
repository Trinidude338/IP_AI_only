%
%	Take a single snap and let the user inspect it
%

clear all;
close all;
clc;

cam	= webcam;

for i = 1:100; snapshot(cam); end

frame 	= snapshot(cam);
dis	= imshow(frame);
impixelinfo(dis);
waitfor(dis);
