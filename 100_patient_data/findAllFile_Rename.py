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
  mark='.dcm'
  base = 'F:/100_patient_data/'
  # 给文件添加后缀名
  for i, root, f in findAllFile(base):
      # os.rename(i, os.path.join(i + mark))  # 子文件重命名
      print(i, "has been renamed successfully! New name is: ", i + mark)


if __name__ == '__main__':
    main()
