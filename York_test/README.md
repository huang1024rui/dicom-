The dataset was first compiled and used as part of the following paper:

Alexander Andreopoulos, John K. Tsotsos, Efficient and Generalizable Statistical Models
of Shape and Appearance for Analysis of Cardiac MRI, Medical Image Analysis,
Volume 12, Issue 3, June 2008, Pages 335-357.

Use is free of charge; We respectfully ask that if you use this dataset,
you cite the above paper as its source.

The authors would like to acknowledge Dr. Paul Babyn, Radiologist-in-Chief,
and Dr. Shi-Joon Yoo, Cardiac Radiologist, of the Hospital for Sick
Children, Toronto, for the data sets and their assistance with this
research project.

Disclaimer: The dataset is provided for research purposes only and
there are no warranties provided nor liabilities assumed by York
University nor the researchers involved in the production of the dataset. 


------------------------------------------------------------------------------------


To visualize the segmentation of subject 18 at temporal frame 20 and at z-value 5,
do the following:

1. Place show_segs.m, show_segs_all.m, sol_yxzt_pat18.mat and manual_seg_32points_pat18.mat 
   in the same directory and change the matlab workspace to that directory.
2. call: load('sol_yxzt_pat18.mat');
3. call: load('manual_seg_32points_pat18.mat');
4. call: show_segs(manual_seg_32points, sol_yxzt, 500, 5, 20);

To visualize all the segmentations corresponding to subject 18, replace step 4 by:
4. call: show_segs_all(manual_seg_32points, sol_yxzt, 500);


Some Notes on the file contents:
manual_seg_32points{z,t} contains a 65x2 vector of the segmentation at time frame t, 
and slice number z along the long axis. The first 32x2 values of the vector 
contain the endocardial landmarks forming the segmentation, and
elements 34:65x2 contain the epicardial segmentation. Row number 33
equals [0 0] to distinguish between the endocardial and epicardial contours. If no
segmentation exists at index z,t, manual_segs_32points{z,t}==-99999.

sol_yxzt(y,x,z,t) contains the pixel at row y, column x, taken from frame t and from
slice number z along the long axis.

# 读取tensor图片
第一步：
文件格式是tensor
a = rescaled_vol4D_tensor[6,0,:,:,10].cpu().squeeze()
第二步：
plt.imshow(a)
plt.show()

