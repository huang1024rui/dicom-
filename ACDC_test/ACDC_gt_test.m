%% author:HQR
%% 作用：显示patient001_frame01.nii.gz 和 patient001_frame12.nii.gz 文件夹
% weight:232
% height:256
% slice：10
close all;
clear all;
clc;
nii = load_nii( 'C:\Users\HQR\Desktop\ACDC_test\patient001_frame01_gt.nii.gz' );  % 装载.nii数据
img = nii.img;  % 因为这个文件有img和head二个部分，其中img部分是图像数据
save patient001_frame01_gt.mat img  % 将数据变成mat格式
load 'patient001_frame01_gt.mat'  % 加载数据
[weight, height, slice] = size(img);   % 获取.nii文件的三个维度，一般1、2维是图像维度，第三维是切片
% imshow(img(:,:,100),[]);  这个是正常显示第100个切片的图像
for i = 1:slice   % 开始切片数据轮寻
    figure(i)   % 开始显示图片
    ti = imshow(img(:,:,i),[]);  % 显示每一张切片图像
     set(gcf,'position',[360*(i-1) 500 500 500]);
    pause(0.1);  % 防止显示过快看不见，简单延时
end

nii1 = load_nii( 'C:\Users\HQR\Desktop\ACDC_test\patient001_frame12_gt.nii.gz' );  % 装载.nii数据
img1 = nii1.img;  % 因为这个文件有img和head二个部分，其中img部分是图像数据
save patient001_frame12_gt.mat img1  % 将数据变成mat格式
load 'patient001_frame12_gt.mat'  % 加载数据
[weight1, height1, slice1] = size(img1);   % 获取.nii文件的三个维度，一般1、2维是图像维度，第三维是切片
% imshow(img(:,:,100),[]);  这个是正常显示第100个切片的图像
for j = 1:slice1   % 开始切片数据轮寻
    figure(10+j)   % 开始显示图片
    ti = imshow(img1(:,:,j),[]);  % 显示每一张切片图像
     set(gcf,'position',[360*(j-1) 50 500 500]);
    pause(0.1);  % 防止显示过快看不见，简单延时
end


