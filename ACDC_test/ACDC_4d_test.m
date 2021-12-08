%% author:HQR
%% ���ã���ʾpatient001_4d.nii.gz �ļ��µ�����
% weight:232
% height:256
% slice��10
% phase:30
close all;
clear all;
clc;
nii = load_nii( 'C:\Users\HQR\Desktop\ACDC_test\patient001_4d.nii.gz' );  % װ��.nii����
img = nii.img;  % ��Ϊ����ļ���img��head�������֣�����img������ͼ������
save patient001_4d.mat img  % �����ݱ��mat��ʽ
load 'patient001_4d.mat'  % ��������
[weight, height, slice, phase] = size(img);   % ��ȡ.nii�ļ�������ά�ȣ�һ��1��2ά��ͼ��ά�ȣ�����ά����Ƭ
% imshow(img(:,:,100),[]);  �����������ʾ��100����Ƭ��ͼ��
for i = 1:phase   % ��ʼ��Ƭ������Ѱ
    figure(i)   % ��ʼ��ʾͼƬ
    ti = imshow(img(:,:,6,i),[]);  % ��ʾÿһ����Ƭͼ��
    
    if i<16
        set(gcf,'position',[250*(i-1) 600 350 350]);
    else 15<i<30
        set(gcf,'position',[250*(i-16) 300 350 350]);
    end
    pause(0.1);  % ��ֹ��ʾ���쿴����������ʱ
end

