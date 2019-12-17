//
//  QJMatrix.h
//  LinearAlgebra
//
//  Created by TING on 12/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

/*
   矩阵的类
*/

#import <Foundation/Foundation.h>
#import "QJVector.h"

NS_ASSUME_NONNULL_BEGIN

@interface QJMatrix : NSObject

// 矩阵用一个二维数组表示
@property (nonatomic , strong) NSMutableArray<NSMutableArray<NSNumber *> *> *matrixArr;
@property (nonatomic , assign , readonly) NSInteger rowNum; // 矩阵行数
@property (nonatomic , assign, readonly) NSInteger columnNum; // 矩阵列数
@property (nonatomic , assign, readonly) NSInteger size; // 矩阵元素个数


/// 根据二维数组生成矩阵
/// @param array 二维数组
+ (QJMatrix *)matrixWithArray:(NSMutableArray *)array;

/// 生成零矩阵
/// @param row 矩阵行数
/// @param colum 矩阵列数
+ (QJMatrix *)zeroMatrixWithRow:(NSInteger)row colum:(NSInteger)colum;

/// 单位矩阵
/// 单位矩阵是一个方阵，其特点是从左上角到右下角的对角线上的元素是1，其余元素是0
/// 单位矩阵的性质：对于一个单位矩阵U，U点乘任意矩阵A或者A点乘U的结果仍然是A本身，也就是U*A = A*U = A。
/// 不过要注意的是如果A不是方阵，那么U*A 和 A*U中的U的形状(也就是行列数)是不一样的
/// @param num 单位矩阵的行列数
+ (QJMatrix *)unitMatrixWithCount:(NSInteger)num;

/// 根据二维数组初始化矩阵
/// @param array 二维数组
- (instancetype)initWithArray:(NSMutableArray *)array;


/// 加上一个矩阵(矩阵相加是把两个矩阵对应位置的元素分别相加)
/// @param matrix 另一个矩阵
- (QJMatrix *)addMatrix:(QJMatrix *)matrix;

/// 减去一个矩阵(矩阵相减是把两个矩阵对应位置的元素分别相减)
/// @param matrix 另一个矩阵
- (QJMatrix *)minusMatrix:(QJMatrix *)matrix;

/// 乘以一个数(标量)
/// @param number 要乘的数
- (QJMatrix *)multiplyNumber:(CGFloat)number;

/// 除以一个数(标量)
/// @param number 要除的数
- (QJMatrix *)divideNumber:(CGFloat)number;

/// 矩阵取负
- (QJMatrix *)negativeMatrix;

/// 获取矩阵某行的向量
/// @param row 行号
- (QJVector *)vectorInRow:(NSInteger)row;

/// 获取矩阵某列的向量
/// @param colum 列号
- (QJVector *)vectorInColum:(NSInteger)colum;

/// 获取矩阵的某个元素
/// @param row 行号
/// @param colum 列号
- (NSNumber *)itemInRow:(NSInteger)row colum:(NSInteger)colum;

/// 矩阵转置。就是指将矩阵的行和列互换，行变列，列变行，满足转置后的矩阵T' [ i ] [ j ] = T [ j ] [ i ]
- (QJMatrix *)transposition;

/// 交换矩阵的两行
/// @param row1 行1
/// @param row2 行2
- (void)swapRow1:(NSInteger)row1 andRow2:(NSInteger)row2;

#pragma mark - 矩阵和向量点乘(没有特殊声明的向量都是指列向量)
/*
 矩阵和向量点乘的结果是向量(列向量)，所以可以把矩阵理解成向量的函数，这个函数将一个向量转变成另一个向量
 矩阵和向量点乘的前提条件是矩阵的列数等于向量的元素个数，得到的结果向量的元素个数等于矩阵的行数
 一个矩阵(M)和一个向量(V)点乘，取出M第0行向量点乘V的到的值(一个标量)就是结果向量的第0个元素；取出M第1行向量点乘V的到的值就是结果向量的第1个元素……
 我们可以借助多元一次方程组来理解矩阵和向量的点乘，方程组中a、b、c、d是未知数，将方程组中未知数放等号左边并且的顺序调整一致，等号右边是常数，如下所示：
 2a + 3b +  c -  d =  19;
  a -  b + 2c - 3d = -10;
 5a - 2b +  c +  d =  11;
 3a +  b - 3c + 2d =  16;
 我们可以把方程组中变量前面的常数(这个常数是分正负的,方程中没有某个未知数的话那这个未知数的常数就是0)看作是一个矩阵，矩阵如下：
 2,3,1,-1
 1,-1,2,-3
 5,-2,1,1
 3,1,-3,2
 方程组的未知数看成一个向量
 (a,b,c,d)
 方程组等式右边的常量看成是结果向量
 (19,-10,11,16)
 然后将常数组成的矩阵和未知数组成的向量进行点乘，就得到了上面的方程组
 */

/// 矩阵和向量点乘
/// @param vector 要乘以的向量
- (QJVector *)dotMultiplyVector:(QJVector *)vector;

#pragma mark - 矩阵和矩阵点乘
/*
 第一个矩阵M1和第二个矩阵M2进行点乘的结果也是一个矩阵M3（M1 * M2 = M3），M3的行数等于M1的行数，M3的列数等于M2的列数
 矩阵和矩阵相乘的前提条件：M1的列数等于M2的行数，也就是说 m * k 的矩阵和 k * n 的矩阵才能相乘，点乘结果是m * n矩阵
 矩阵和矩阵相乘的过程：M1作为一个整体和M2第0列向量进行点乘，点乘的结果就是M3的第0列；M1作为一个整体和M2第1列向量进行点乘，点乘的结果就是M3的第1列；
 M3[i][j]的值等于M1第i行向量乘以M2第j列向量
 */

/*
 矩阵和矩阵点乘的性质(下面A B C都是矩阵)：
 1.矩阵和矩阵点乘不符合交换律，也就是 A*B != B*A。
    除了方正(行数和列数相等的矩阵)外，A*B是可以点乘的话，那B*A是不可以点乘的，因为第一个矩阵的列数要等于第二个矩阵的行数的条件都不满足
 2.(A*B)*C = A*(B*C)，等号前面能点乘的话说明A的列数等于B的行数，那么A*B的结果列数等于B的列数，那就说明B的列数等于C的行数。
    所以B和C是可以先乘的，点乘的结果的行数等于B的行数，所以A是可以和这个结果进行点乘
 3.A*(B+C) = A*B + A*C;
 4.(B+C)*A = B*A + C*A
 5.矩阵的幂(只有方正才能进行矩阵的幂运算)：A^k = A*A*……*A（k个A相乘）
 6.(A+B)^2 != A^2 + 2AB + B^2。
    (A+B)^2 = (A+B)*(A+B) = A*(A+B)+B*(A+B) = A^2 + AB + BA + B^2，因为AB!=BA所以(A+B)^2 != A^2 + 2AB + B^2
 */

/*
 矩阵在图形变换中的应用：
 1.图形关于x轴翻转，也就是将坐标为(x,y)的点的坐标转变为(x,-y)，也就是要找一个矩阵T点乘列向量(x,y)等于列向量(x,-y)。(也可以把向量看成只有一列的矩阵)
    向量(x,y)元素个数是2，所以矩阵T列数应该是2；计算结果的向量元素个数是2，所以矩阵T的行数应该是2，所以T是一个2*2的矩阵。
    根据矩阵和向量相乘的规则很容易算出矩阵T是：
    (1,0)
    (0,-1)
 2.图形关于y轴翻转，也就是将坐标为(x,y)的点的坐标转变为(-x,y)，同理算的矩阵T为：
    (-1,0)
    (0,1)
 3.图形关于坐标原点翻转，也就是将坐标为(x,y)的点的坐标转变为(-x,-y)，同理算的矩阵T为：
    (-1,0)
    (0,-1)
 4.图形沿x方向错切(y值不变，x值再x轴方向平移一定距离)，也就是将坐标为(x,y)的点的坐标转变为(x+ay,y)，矩阵T为：
    (1，a)
    (0,1)
 5.图形沿y方向错切，也就是将坐标为(x,y)的点的坐标转变为(x,bx+y)，矩阵T为：
    (1，0)
    (b,1)
 6.图形的旋转，将图形以坐标原点为中心旋转θ角度，一个点原坐标为(x,y)，旋转后的坐标经过三角函数计算，结果坐标是(cosθ*x+sinθ*y,-sinθ*x+cosθ*y)，那么矩阵T为：
    (cosθ,sinθ)
    (-sinθ,cosθ)
 7.图形的缩放，每个点x坐标放大a倍，y坐标放大b倍，也就是(x,y)转成成(ax,by)，矩阵T为：
    (a,0)
    (0,b)
 */

/// 矩阵和矩阵点乘
/// @param matrix 第二个矩阵
- (QJMatrix *)dotMultiplyMatrix:(QJMatrix *)matrix;

@end

NS_ASSUME_NONNULL_END
