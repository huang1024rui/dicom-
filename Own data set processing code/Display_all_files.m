
%% 显示所有数据
clear all;
close all;
clc
num=[0 1 2 3 4 5 6 7 8 9];

for i=1:1:10
    %---------ED----------
    ED_pathImage = ['C:\Users\HQR\Desktop\10PA-ED_ES\data_process\PA' num2str(num(i)) '\ED'];
    ED_filesImage = dir (ED_pathImage);
    ED_len = length(ED_filesImage);
    %---------ES-----------
    ES_pathImage = ['C:\Users\HQR\Desktop\10PA-ED_ES\data_process\PA' num2str(num(i)) '\ES'];
    ES_filesImage = dir (ES_pathImage);
    ES_len = length(ES_filesImage);
    %--------------------------------%
    for k = 1:1:(ED_len-2)
        %--------ED---------
        ED_imageName = [ 'PA' num2str(num(i)) '-ED' num2str(k) '.dcm'];
        ED_data = dicomread([ED_pathImage '\' ED_imageName]);
        figure(1);
        subplot(1,2,1);   
        imshow(ED_data,[] );  title(ED_imageName);
        pause(0.1);
        %-------ES--------------
        ES_imageName = [ 'PA' num2str(num(i)) '-ES' num2str(k) '.dcm'];
        if (i==1)||(i==4)
            if k<= (ES_len-2)
            ES_data = dicomread([ES_pathImage '\' ES_imageName]);
            else
            ES_data = zeros(size(ED_data));
            end
        else
            if k<= (ED_len-ES_len)
                ES_data = zeros(size(ED_data));
            else
                ES_data = dicomread([ES_pathImage '\' ES_imageName]);
            end
        end
        subplot(1,2,2);   
        imshow(ES_data,[] );  title(ES_imageName);
        pause(0.1);
    end
end

