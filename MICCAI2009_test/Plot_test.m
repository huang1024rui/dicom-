clc
clear
z_pos = 4;
time_pos = 1;
a = load('C:\Users\HQR\Desktop\test\IM-0001-0048-icontour-manual.txt');
I=dicomread('IM-0001-0048.dcm');
% b_im = manual_seg_32points{z_pos,time_pos};
% b_im1_x = b_im(1:32,1);
% b_im1_y = b_im(1:32,2);
% b_im2_x = b_im(34:65,1);
% b_im2_y = b_im(34:65,2);


% [i_yval i_xval i_zval i_tval] = size(sol_yxzt);
picture = reshape(I,256,256);

figure;
imshow(picture,'DisplayRange',[]);
line(a(:,1),a(:,2),'Color','b','MarkerSize',5,'MarkerFaceColor','r');
% % pause(0.1);
% line(b_im2_x,b_im2_y,'Color','r','MarkerSize',5,'MarkerFaceColor','r');