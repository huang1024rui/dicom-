# dicom-
打开MICCAI2009/ACDC/York心脏左心室数据集
## 1. York数据集
- 加拿大多伦多儿童医院的影像诊断科提供33名儿里受试着，共**7980张二维图像**，这些图像采用通用公司的核磁共振扫描仪扫拍获得。
	- **大多数受试者表现出多种心脏异常**，如心肌病、主动脉返流、心室增大和缺血，少数被试者表现出左心室相关异常，提供了一个现实而具有挑战性的数括。
	- 所有受试者平均年龄在18岁以下。每个患者的图像序列由$\color{red}\text{20 phase}$组成，沿着受试者的长轴获取的$\color{red}\text{slice}$数量介于$\color{red}\text{8-15片}$之间。切片(slice)与切片(slice)之间的间距在$\color{red}\text{6-13mm}$之间。
	- 每个图像切片由$\color{red}\text{256× 256}$个像素组成，像素间距为$\color{red}\text{0.93-1.64mm}$。
	- 每一个切片的$\color{red}\text{左心室心内膜}$和$\color{red}\text{心外膜轮廓}$都是可见的，并且被临床专家医生手动分割，以提供标准轮廓。$\color{red}\text{左心室心内膜轮廓}$是画在乳头状肌和小梁后面，每一个轮廓都是从最靠近后室间沟的左右心室交界处开始绘制的。
	> 关于文件内容的一些注意事项：
	> - `manual_seg_32points{z,t}` 包含时间帧 t 的分割的 65x2 向量，以及沿长轴的切片编号 z。 向量的前 32x2 值包含形成分割的心内膜标志，元素 34:65x2 包含心外膜分割。 第 33 行等于 [0 0] 以区分心内膜和心外膜轮廓。 如果索引 z,t 处不存在分段，则 `manual_segs_32points{z,t}==-99999`。
	> - `sol_yxzt(y,x,z,t)` 包含第 y 行 x 列的像素，取自第 t 帧和来自沿长轴切片编号 z。

## 2.MICCAI2009数据集
- 在MICCAI2009心脏分割挑战比赛中，提供了$\color{red}\text{45组Cine-MR心脏数据集}$以及专家标记的专家轮廓，这些数据都是来源于临床实际数据。采用1.5T通用公司的Signa核磁共振成像(MR)设备获得电影序列的稳态自由进动(SSFP)的 **MR心脏短轴(SAX)图像**。
	- 45个cine-MR图像包括的病人及其病理特性：
		- $\color{green}\text{健康(N,healthy,n=12)}$
		- $\color{green}\text{肥大(HPY,hypertrophy,n=12)}$
		- $\color{green}\text{心力衰竭与梗死(HF-I, heart failure with infarction,n=12) }$
		- $\color{green}\text{心力衰竭没有梗死(HF-NI, heart failure without infarction, n=12)}$
	- 所有的图像都是在**10-15秒的屏气**过程中获得的，时间分辨率为$\color{red}\text{20 phase}$。从$\color{red}\text{二尖瓣到心尖}$共获得$\color{red}\text{6-12张}$SAX图像($\color{red}\text{厚度是8mm}$，$\color{red}\text{间隙是8 mm}$,$\color{red}\text{FOV=320 mm x 320 mm}$)，每个图像切片由$\color{red}\text{256×256个像素}$组成。
	- 在这些SAX MR采集中，按照包括$\color{red}\text{乳头状肌}$和$\color{red}\text{心室小梁}$在内的惯例，由经验丰富的心脏病专家在$\color{red}\text{收缩末期}$和$\color{red}\text{舒张末期}$的所有切片上绘制$\color{red}\text{心内膜}$和$\color{red}\text{心外膜轮廓}$。
	- 所有的轮廓都被另一位心脏病专家证实了准确性。手动分割的轮廓作为评价标准。45组数据集将随机分为三组:$\color{red}\text{15组用于训练，15组用于测试，15组用于在线竞赛}$。
