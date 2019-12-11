//
//  QJVector.h
//  LinearAlgebra
//
//  Created by TING on 11/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

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


@end

NS_ASSUME_NONNULL_END
