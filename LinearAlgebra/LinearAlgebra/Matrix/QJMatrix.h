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

@end

NS_ASSUME_NONNULL_END
