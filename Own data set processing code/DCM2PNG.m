
%% ����ͼƬ��dcmת��png
clear all;
close all;
clc
num=[0 1 2 3 4 5 6 7 8 9];

for i=2:1:10
    %---------ED----------
    ED_pathImage = ['C:\Users\HQR\Desktop\10PA-ED_ES\jpng_data_process\PA' num2str(num(i)) '\ED'];
    ED_filesImage = dir (ED_pathImage);
    ED_len = length(ED_filesImage);
    for j = 3:ED_len%��һ��ȡͼ��  
          ED_image_name = ED_filesImage(j).name;% ͼ����  
          ED_imag  = dicomread([ED_pathImage ,'\', ED_image_name]);
         % figure;imshow(imag,[0,255])
          ED_img=double(ED_imag); %���Ҷȼ�ӳ�䵽0~255
          low=min(min(ED_img));
          high=max(max(ED_img));
          maxgray=high-low;%���㴰��
          rate=256/maxgray;
          ED_img=ED_img*rate;
          ED_img=ED_img+abs(min(min(ED_img)));%�Ӵ�
          ED_img=uint16(ED_img);%ת��Ϊ8λ��λͼ���ݸ�
          my_save = [ED_pathImage ,'\' 'PA' num2str(num(i)) '-ED' num2str(j-2) '.png'];
          
          imwrite(ED_img,my_save);
    end 
    %---------ES-----------
    ES_pathImage = ['C:\Users\HQR\Desktop\10PA-ED_ES\jpng_data_process\PA' num2str(num(i)) '\ES'];
    ES_filesImage = dir (ES_pathImage);
    ES_len = length(ES_filesImage);
    %--------------------------------%
     for j = 3:ES_len%��һ��ȡͼ��  
          ES_image_name = ES_filesImage(j).name;% ͼ����  
          ES_imag  = dicomread([ES_pathImage ,'\', ES_image_name]);
         % figure;imshow(imag,[0,255])
          ES_img=double(ES_imag); %���Ҷȼ�ӳ�䵽0~255
          low=min(min(ES_img));
          high=max(max(ES_img));
          maxgray=high-low;%���㴰��
          rate=256/maxgray;
          ES_img=ES_img*rate;
          ES_img=ES_img+abs(min(min(ES_img)));%�Ӵ�
          ES_img=uint16(ES_img);%ת��Ϊ8λ��λͼ���ݸ�
          my_save = [ES_pathImage ,'\' 'PA' num2str(num(i)) '-ES' num2str(j-2) '.png'];
          
          imwrite(ES_img,my_save);
    end 
end

