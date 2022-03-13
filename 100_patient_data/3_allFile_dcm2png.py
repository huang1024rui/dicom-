# -*- coding: utf-8 -*—
# Date: 2022/3/11 0011
# Time: 22:08
# Author: 
import os
import SimpleITK as sitk

def findAllFile(base):
    # 遍历指定文件夹下所有文件
    # https://zhuanlan.zhihu.com/p/98124110
    for root, ds, fs in os.walk(base):
        for f in fs:
            fullname = os.path.join(root, f)
            yield fullname, root, f

def main():
    base = 'F:/100_patient_data/'
    # 给文件添加后缀名
    for i, root, f in findAllFile(base):
        # os.rename(i, os.path.join(i + mark))  # 子文件重命名
        (name, suffix) = os.path.splitext(f)
        # read the image
        img = sitk.ReadImage(i)
        # rescale intensity range from [-1000,1000] to [0,255]
        img = sitk.IntensityWindowing(img, 0, 5000, 0, 255)
        # convert 16-bit pixels to 8-bit
        img = sitk.Cast(img, sitk.sitkUInt8)
        # file_path
        save_filepath = root + '_png'
        if not os.path.exists(save_filepath):
            os.mkdir(save_filepath)
        # image_files
        save_path = save_filepath + '/' + name + '_png' + '.png'

        sitk.WriteImage(img, save_path)
        # print the result
        print(i, "has been renamed successfully! New name is: ", name + '_png.png')


if __name__ == '__main__':
    main()
