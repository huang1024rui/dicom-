%% ����Ҫ�ŵ���Ӳ���ļ�����
clear all;
close all;
clc
  
num=[0 1 2 3 4 5 6 7 8 9];
i=6;
%  ��ʱtest�ļ�������:�ļ���1, �ļ���2�� �ļ�1.txt, �ļ�2.txt  
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
     % '!'����˼�ǵ���ϵͳ������32��ASCII��ֵ����ʾ�ո�
    eval(['!rename' 32 Name_or 32 Name_pro]);
end
