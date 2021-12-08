%% author:HQR
%% ���ã���ʾpatient001_frame01.nii.gz �� patient001_frame12.nii.gz �ļ���
% weight:232
% height:256
% slice��10
close all;
clear all;
clc;
nii = load_nii( 'C:\Users\HQR\Desktop\ACDC_test\patient001_frame01_gt.nii.gz' );  % װ��.nii����
img = nii.img;  % ��Ϊ����ļ���img��head�������֣�����img������ͼ������
save patient001_frame01_gt.mat img  % �����ݱ��mat��ʽ
load 'patient001_frame01_gt.mat'  % ��������
[weight, height, slice] = size(img);   % ��ȡ.nii�ļ�������ά�ȣ�һ��1��2ά��ͼ��ά�ȣ�����ά����Ƭ
% imshow(img(:,:,100),[]);  �����������ʾ��100����Ƭ��ͼ��
for i = 1:slice   % ��ʼ��Ƭ������Ѱ
    figure(i)   % ��ʼ��ʾͼƬ
    ti = imshow(img(:,:,i),[]);  % ��ʾÿһ����Ƭͼ��
     set(gcf,'position',[360*(i-1) 500 500 500]);
    pause(0.1);  % ��ֹ��ʾ���쿴����������ʱ
end

nii1 = load_nii( 'C:\Users\HQR\Desktop\ACDC_test\patient001_frame12_gt.nii.gz' );  % װ��.nii����
img1 = nii1.img;  % ��Ϊ����ļ���img��head�������֣�����img������ͼ������
save patient001_frame12_gt.mat img1  % �����ݱ��mat��ʽ
load 'patient001_frame12_gt.mat'  % ��������
[weight1, height1, slice1] = size(img1);   % ��ȡ.nii�ļ�������ά�ȣ�һ��1��2ά��ͼ��ά�ȣ�����ά����Ƭ
% imshow(img(:,:,100),[]);  �����������ʾ��100����Ƭ��ͼ��
for j = 1:slice1   % ��ʼ��Ƭ������Ѱ
    figure(10+j)   % ��ʼ��ʾͼƬ
    ti = imshow(img1(:,:,j),[]);  % ��ʾÿһ����Ƭͼ��
     set(gcf,'position',[360*(j-1) 50 500 500]);
    pause(0.1);  % ��ֹ��ʾ���쿴����������ʱ
end


