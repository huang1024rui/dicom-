%% 必须要放到最硬的文件夹中
clear all;
close all;
clc
  
num=[0 1 2 3 4 5 6 7 8 9];
i=6;
%  此时test文件夹中有:文件夹1, 文件夹2， 文件1.txt, 文件2.txt  
ED_pathImage = ['C:\Users\HQR\Desktop\10PA-ED_ES\data_process\PA' num2str(num(i)) '\ED\*.dcm' ];
ED_filesImage = dir (ED_pathImage);
ED_len = length(ED_filesImage);
for k =1:1:(ED_len)
    Name_or = ED_filesImage(k).name;
    %Name_or = ['PA' num2str(num(i)) '-ED ('  num2str(k) ').dcm'];
    Name_pro = ['PA' num2str(num(i)) '-'  num2str(k) '.dcm'];
    eval(['!rename' 32 Name_or 32 Name_pro]);
end
%% -------------------------------------%% 
ED_pathImage = ['C:\Users\HQR\Desktop\10PA-ED_ES\data_process\PA' num2str(num(i)) '\ED\*.dcm' ];
ED_filesImage = dir (ED_pathImage);
ED_len = length(ED_filesImage);
for k =1:1:(ED_len)
    Name_or = ED_filesImage(k).name;
    %Name_or = ['PA' num2str(num(i)) '-ED ('  num2str(k) ').dcm'];
    Name_pro = ['PA' num2str(num(i)) '-ED'  num2str((ED_len+1) - k) '.dcm'];
     % '!'的意思是调用系统函数，32是ASCII码值，表示空格
    eval(['!rename' 32 Name_or 32 Name_pro]);
end

