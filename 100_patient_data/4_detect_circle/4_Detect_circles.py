# -*- coding: utf-8 -*—
# Date: 2022/3/16 0016
# Time: 14:39
# Author: HQR

import os
import cv2
import numpy as np
from Detect_all_circle import Detect_Circle

def findAllFile(base):
    # 遍历指定文件夹下所有文件
    # https://zhuanlan.zhihu.com/p/98124110
    for root, ds, fs in os.walk(base):
        for f in fs:
            if f.endswith('.png'):
                fullname = os.path.join(root, f)
                yield fullname, root, f

def main():
    base = 'D:\Python\PyCharmProjects\change_suffix\DataSet'
    # 给文件添加后缀名
    for i, root, f in findAllFile(base):
        # os.rename(i, os.path.join(i + mark))  # 子文件重命名
        (name, suffix) = os.path.splitext(f)
        # create the file
        detect_cirlce = Detect_Circle(i)
        img_contours, img, Red_contours_fill, Yellow_con_fill, Blue_con_fill = detect_cirlce.Detect_all_circle()

        # npz_path
        npz_filepath = root + '_npz'
        if not os.path.exists(npz_filepath):
            os.mkdir(npz_filepath)
        # npz_files
        npz_path = npz_filepath + '/' + name + '_npz' + '.npz'
        np.savez(npz_path, Image_comtours_Fill=img_contours, Original_image=img, MC=Red_contours_fill,
                 LV=Yellow_con_fill, RV=Blue_con_fill)

        # count_path
        count_filepath = root + '_count'
        if not os.path.exists(count_filepath):
            os.mkdir(count_filepath)
        # png_files
        count_path = count_filepath + '/' + name + '_count' + '.png'
        cv2.imwrite(count_path, img_contours)

        # print the result
        print(name, "has been renamed successfully! New name is: ", name + '_count.png')


if __name__ == '__main__':
    main()
