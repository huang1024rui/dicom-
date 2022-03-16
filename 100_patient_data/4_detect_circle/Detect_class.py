# -*- coding: utf-8 -*—
# Date: 2022/3/16 0016
# Time: 9:49
# Author: HQR
import torch
import torch.nn as nn
import cv2
import numpy as np

color_dist = {
    'red': {'Lower1': np.array([0, 43, 46]), 'Lower2': np.array([156, 43, 46]),
            'Upper1': np.array([10, 255, 255]), 'Upper2': np.array([180, 255, 255])},
    'yellow': {'Lower': np.array([15, 160, 50]), 'Upper': np.array([35, 255, 255])},
    'blue': {'Lower': np.array([78, 43, 43]), 'Upper': np.array([130, 255, 255])},
    }
# epsilon是"代表实际轮廓和近似轮廓之间的最大距离并代表近似精度的参数"
epsilon = 0.0005

# 定义一个展示图片的函数
def cv_show(name, img):
    cv2.namedWindow(name, cv2.WINDOW_NORMAL)
    cv2.resizeWindow(name, 500, 500)
    cv2.imshow(name, img)

class Detect_Circle(nn.Module):
    '''
    # 1. 读取蓝色边框(MV)，进行轮廓近似，并保存
    # 2. 读取黄色边框(LV)，进行轮廓近似，并保存，
    # 3. 读取红色边框(RV)，并把三个边框相加，再次提取整个的最外层边框，进行颜色填充，把这个填充物减去蓝色边框和黄色边框，最终得到红色边框区域，并保存。
    # 4. 最终把单通道的图像变为3通道，每个通道对应着MC,LV,RV
    # 各个文件保存：
    # Image_comtours_Fill = img_contours,
    # Original_image = img,
    # MC = Red_contours_fill,
    # LV = Yellow_con_fill,
    # RV = Blue_con_fill
    # 整体思想是：提边框，轮廓近似，填充边框。
    '''
    def __init__(self, input_img):
        super(Detect_Circle, self).__init__()
        self.img = cv2.imread(input_img)  # 读入图像（直接读入灰度图）
        self.hsv = cv2.cvtColor(self.img, cv2.COLOR_BGR2HSV)

        ## Yellow
        # find the yellow contours
        self.Yellow_mask = cv2.inRange(self.hsv, color_dist['yellow']['Lower'], color_dist['yellow']['Upper'])
        self.Yellow_contour = cv2.bitwise_and(self.hsv, self.hsv, mask=self.Yellow_mask)
        # fill the contours
        self.color = cv2.cvtColor(self.Yellow_contour, cv2.COLOR_BGR2GRAY)
        self.Yellow_contour_gray1 = self.color
        self.Yellow_contours, self.Yellow_hierarchy = cv2.findContours(self.Yellow_contour_gray1, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
        self.Yellow_contours_approx = cv2.approxPolyDP(self.Yellow_contours[0], epsilon, True)  # 轮廓线近似
        self.Yellow_con_fill = cv2.fillPoly(self.Yellow_contour_gray1, [self.Yellow_contours_approx], (255, 0, 0))

        ## Blue
        # find the blue contours
        self.Blue_mask = cv2.inRange(self.hsv, color_dist['blue']['Lower'], color_dist['blue']['Upper'])
        self.Blue_contour = cv2.bitwise_and(self.hsv, self.hsv, mask=self.Blue_mask)
        # 多边形近似
        self.Blue_contour_gray1 = cv2.cvtColor(self.Blue_contour, cv2.COLOR_BGR2GRAY)
        self.Blue_contours, self.Blue_hierarchy = cv2.findContours(self.Blue_contour_gray1, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
        if (np.count_nonzero(self.Blue_hierarchy) == 0):
            self.Blue_con_fill = np.zeros(self.Yellow_con_fill.shape)
        else:
            self.Blue_contours_approx = cv2.approxPolyDP(self.Blue_contours[0], epsilon, True)  # 轮廓线近似
            self.Blue_con_fill = cv2.fillPoly(self.Blue_contour_gray1, [self.Blue_contours_approx], (255, 0, 0))

        ## Red
        # find the red contours
        self.Red_mask1 = cv2.inRange(self.hsv, color_dist['red']['Lower1'], color_dist['red']['Upper1'])
        self.Red_mask2 = cv2.inRange(self.hsv, color_dist['red']['Lower2'], color_dist['red']['Upper2'])
        self.Red_mask = self.Red_mask1 + self.Red_mask2  # 红色有两种色域，需要特殊处理
        self.Red_contour = cv2.bitwise_and(self.hsv, self.hsv, mask=self.Red_mask)
        # fill the contours
        self.Red_Blue_Yellow_cont = self.Blue_contour + self.Yellow_contour + self.Red_contour  # 因为红色边框不全，只能用减的方法进行处理
        # cv_show('Blue_Yellow_cont', Red_Blue_Yellow_cont)
        self.Red_Blue_Yellow_cont_gray = cv2.cvtColor(self.Red_Blue_Yellow_cont, cv2.COLOR_BGR2GRAY)  # 所有的轮廓进一步处理
        self.Red_Blue_Yellow_contours, self.hierarchy = cv2.findContours(self.Red_Blue_Yellow_cont_gray, cv2.RETR_TREE,
                                                               cv2.CHAIN_APPROX_NONE)  # 再次寻找轮廓，是最外层的轮廓
        self.Red_Blue_Yellow_cont_approx = cv2.approxPolyDP(self.Red_Blue_Yellow_contours[0], epsilon, True)  # 轮廓线近似
        self.contours_all = cv2.fillConvexPoly(self.Red_Blue_Yellow_cont_gray, self.Red_Blue_Yellow_cont_approx, (255, 0, 0))  # 填充边界
        self.Red_contours_fill = self.contours_all - self.Yellow_con_fill - self.Blue_con_fill



    # 显示出结果
    def Detect_all_circle(self):
        # img = cv2.imread(input_img)  # 读入图像（直接读入灰度图）
        # Detect_Circle(img)
        img_contours = np.zeros(self.img.shape)
        img_contours[:, :, 0] = self.Blue_con_fill
        img_contours[:, :, 1] = self.Red_contours_fill
        img_contours[:, :, 2] = self.Yellow_con_fill
        ## 保存原图，调色后的图，心肌(myocardium), 左心室(LV), 右心室(RV)
        return img_contours, self.img, self.Red_contours_fill, self.Yellow_con_fill, self.Blue_con_fill

if __name__ == '__main__':
    # 测试
    arg = 'PA0-ED-2'

    detect_cirlce = Detect_Circle(arg+'.png')

    img_contours, img, Red_contours_fill, Yellow_con_fill, Blue_con_fill = detect_cirlce.Detect_all_circle()

    np.savez(arg + '.npz', Image_comtours_Fill=img_contours, Original_image=img, MC=Red_contours_fill,
             LV=Yellow_con_fill, RV=Blue_con_fill)
    a = np.load(arg + '.npz')

    cv2.imwrite(arg + 'contours.jpg', img_contours)
    cv_show('Image_contours', img_contours)
    cv2.waitKey(0)
