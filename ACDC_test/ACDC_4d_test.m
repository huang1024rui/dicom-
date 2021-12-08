%% author:HQR
%% 作用：显示patient001_4d.nii.gz 文件下的数据
% weight:232
% height:256
% slice：10
% phase:30
close all;
clear all;
clc;
nii = load_nii( 'C:\Users\HQR\Desktop\ACDC_test\patient001_4d.nii.gz' );  % 装载.nii数据
img = nii.img;  % 因为这个文件有img和head二个部分，其中img部分是图像数据
save patient001_4d.mat img  % 将数据变成mat格式
load 'patient001_4d.mat'  % 加载数据
[weight, height, slice, phase] = size(img);   % 获取.nii文件的三个维度，一般1、2维是图像维度，第三维是切片
% imshow(img(:,:,100),[]);  这个是正常显示第100个切片的图像
for i = 1:phase   % 开始切片数据轮寻
    figure(i)   % 开始显示图片
    ti = imshow(img(:,:,6,i),[]);  % 显示每一张切片图像
    
    if i<16
        set(gcf,'position',[250*(i-1) 600 350 350]);
    else 15<i<30
        set(gcf,'position',[250*(i-16) 300 350 350]);
    end
    pause(0.1);  % 防止显示过快看不见，简单延时
end

