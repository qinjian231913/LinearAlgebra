//
//  QJVector.h
//  LinearAlgebra
//
//  Created by TING on 11/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

/*
    向量的类(注意：一个向量如果没有特殊声明一般就是指列向量)
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define ZERO_FLOAT (0.000001f) // 用于判断一个浮点数是否为0

@interface QJVector : NSObject

@property (nonatomic , strong) NSMutableArray *dimensionArr; // 向量维度数组
@property (nonatomic , assign, readonly) NSInteger count; // 向量元素个数
@property (nonatomic , assign, readonly) CGFloat normal; // 向量的模(向量的长度)
@property (nonatomic , strong, readonly) QJVector *normalize; // 向量的单位向量
@property (nonatomic , assign, readonly) BOOL isZero; // 是否是零向量

// 根据数组生成一个向量
+ (QJVector *)vectorWithArray:(NSArray<NSNumber *> *)array;


///  生成一个零向量
/// @param dimension 零向量维度
+ (QJVector *)zeroVectorWithDimension:(NSInteger)dimension;

/// 根据一个数组来生成向量
/// @param array 数组里面存放的是向量的每个维度的值
- (instancetype)initWithArray:(NSArray<NSNumber *> *)array;

/*
 下面例子以二维向量为例(结论对于N维向量也适用)
 vector1 = (x1 , y1)
 vector2 = (x2 , y2)
 */

/// 加上另一个向量（vector1 + vector2 = (x1+x2 , y1+y2)）
/// @param vector 另外一个向量
- (QJVector *)addVector:(QJVector *)vector;

/// 减去另一个向量（vector1 - vector2 = (x1-x2 , y1-y2)）
/// @param vector 另外一个向量
- (QJVector *)minusVector:(QJVector *)vector;

/// 乘以一个数(标量)
/// @param number 要乘的数
- (QJVector *)multiplyNumber:(CGFloat)number;

/// 除以一个数(标量)
/// @param number 要除的数
- (QJVector *)divideNumber:(CGFloat)number;

/// 获取向量的某个元素
/// @param idx 元素下标
- (NSNumber *)itemAtIndex:(NSInteger)idx;


/// 向量取负
- (QJVector *)negativeVector;

#pragma mark - 向量点乘及应用
/*
 向量点乘：
 向量点乘必须先转换成同一方向的向量再进行计算
 计算方式一几何意义：vector1在x轴上的投影乘以vector2在x轴上的投影再加上两个向量在y轴上的投影的乘积
 vector1*vector2 = x1*x2 + y1*y2;
 
 计算方式二几何意义：先将一个向量投影到另一个向量上，然后将投影向量的长度和另一个向量的长度相乘
 两个向量的夹角是θ，|vector1|表示vector1的模，那vector1再vector2上的投影的长度就是|vector1|*cosθ
 vector1*vector2 = |vector1|*|vector2|*cosθ
 
 向量点乘的应用：
 推荐系统，可以判断两组数据的相似度，把两组数据看出两个向量，两个向量的夹角越接近0并且两个向量的模越接近就表明两组数据相似度越高
 */

/// 点乘一个向量，结果返回的是一个标量
/// @param vector 点乘的向量
- (CGFloat)dotMultiplyVector:(QJVector *)vector;


/// 计算两个向量夹角的余弦值(根据vector1*vector2 = x1*x2 + y1*y2 = |vector1|*|vector2|*cosθ来计算)
///  cosθ > 0为锐角，cosθ = 0为直角，cosθ < 0为钝角
/// @param vector 另一个向量
- (CGFloat)cosValueWithVector:(QJVector *)vector;

/// 计算两个向量夹角(用弧度表示)
/// @param vector 另一个向量
- (CGFloat)radianWithVector:(QJVector *)vector;

/// 计算两个向量夹角(用角度表示)
/// @param vector 另一个向量
- (CGFloat)angleWithVector:(QJVector *)vector;

/// 计算一个向量再另一个向量上的投影向量的模
/// @param vector 另一个向量
- (CGFloat)projectionNormalOnVector:(QJVector *)vector;

/// 计算一个向量再另一个向量上的投影向量
/// @param vector 另一个向量
- (QJVector *)projectionOnVector:(QJVector *)vector;

@end

NS_ASSUME_NONNULL_END
