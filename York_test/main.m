clc
clear
load('D:\PyCharm\PyCharm_Project\Pre-treat\orginal_data\33Cases\seg\manual_seg_32points_pat1.mat');
load('D:\PyCharm\PyCharm_Project\Pre-treat\orginal_data\33Cases\vol\sol_yxzt_pat1.mat');
show_segs(manual_seg_32points, sol_yxzt, 500, 5, 20);
% show_segs_all(manual_seg_32points, sol_yxzt, 500);
