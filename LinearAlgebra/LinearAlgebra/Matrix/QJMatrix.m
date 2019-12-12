//
//  QJMatrix.m
//  LinearAlgebra
//
//  Created by TING on 12/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

#import "QJMatrix.h"

@implementation QJMatrix

- (instancetype)initWithArray:(NSMutableArray *)array
{
    self = [super init];
    if (self) {
        self.matrixArr = array;
    }
    return self;
}

- (void)setMatrixArr:(NSMutableArray<NSMutableArray<NSNumber *> *> *)matrixArr{
    if (![self validateArray:matrixArr]) {
        NSLog(@"二维数组数据不合法！");
    }else{
        self->_matrixArr = matrixArr;
    }
    
}

// 验证构建矩阵的数组的合法性
// 数组必须是一个二维数组，每个元素必须是NSNmber类型，二维数组中每个元素(一个数组)的元素个数要相等
- (BOOL)validateArray:(NSMutableArray *)array{
    if(array.count == 0) return YES;
    
    id subArr = array.firstObject;
    if(![subArr isKindOfClass:[NSArray class]]) return NO;
    
    NSInteger subArrCount = ((NSArray *)subArr).count; // 子数组中元素个数
    
    for (id obj in array) {
        if(![obj isKindOfClass:[NSArray class]]) return NO;
        
        NSArray *sArr = (NSArray *)obj;
        
        if(sArr.count != subArrCount) return NO;
        
        for (id subObj in sArr) {
            if(![subObj isKindOfClass:[NSNumber class]]) return NO;
        }
    }
    
    return YES;
}

#pragma mark - 类方法
+ (QJMatrix *)matrixWithArray:(NSMutableArray *)array{
    return [[QJMatrix alloc] initWithArray:array];
}

// 生成零矩阵
+ (QJMatrix *)zeroMatrixWithRow:(NSInteger)row colum:(NSInteger)colum{
    NSMutableArray *zeroArr = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i < row ; i++) {
        NSMutableArray *rowArr = [NSMutableArray array];
        for (NSInteger j = 0; j < colum; j++) {
            [rowArr addObject:@(0)];
        }
        [zeroArr addObject:rowArr];
    }
    
    return [QJMatrix matrixWithArray:zeroArr];
}

#pragma mark -
// 矩阵行数
- (NSInteger)rowNum{
    return self->_matrixArr.count;
}

// 矩阵列数
- (NSInteger)columnNum{
    if(!self->_matrixArr.count) return 0;
    
    return ((NSArray *)self->_matrixArr.firstObject).count;
}

// 矩阵元素个数
- (NSInteger)size{
    return self.rowNum * self.columnNum;
}

// 矩阵相加
- (QJMatrix *)addMatrix:(QJMatrix *)matrix{
    if (self.rowNum!=matrix.rowNum || self.columnNum!=matrix.columnNum) {
        NSLog(@"相加的两个矩阵的行数和列数要相同");
        return nil;
    }
    
    NSMutableArray *matrixArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.rowNum; i++) {
        NSMutableArray *rowArr = [NSMutableArray array];
        for (NSInteger j = 0; j < self.columnNum; j++) {
            [rowArr addObject:@([self.matrixArr[i][j] floatValue] + [matrix.matrixArr[i][j] floatValue])];
        }
        [matrixArr addObject:rowArr];
    }
    
    return [QJMatrix matrixWithArray:matrixArr];
}

// 两个元素相减
- (QJMatrix *)minusMatrix:(QJMatrix *)matrix{
    if (self.rowNum!=matrix.rowNum || self.columnNum!=matrix.columnNum) {
        NSLog(@"相减的两个矩阵的行数和列数要相同");
        return nil;
    }
    
    return [self addMatrix:[matrix negativeMatrix]];
}

// 乘以一个数
- (QJMatrix *)multiplyNumber:(CGFloat)number{
    NSMutableArray *matrixArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.rowNum; i++) {
        NSMutableArray *rowArr = [NSMutableArray array];
        for (NSInteger j = 0; j < self.columnNum; j++) {
            [rowArr addObject:@([self.matrixArr[i][j] floatValue] * number)];
        }
        [matrixArr addObject:rowArr];
    }
    
    return [QJMatrix matrixWithArray:matrixArr];
}

// 除以一个数
- (QJMatrix *)divideNumber:(CGFloat)number{
    NSAssert(fabs(number) > ZERO_FLOAT, @"除数不能为0！");
    return [self multiplyNumber:1/number];
}

/// 矩阵取负
- (QJMatrix *)negativeMatrix{
    return [self multiplyNumber:-1];
}

// 获取矩阵某行的向量
- (QJVector *)vectorInRow:(NSInteger)row{
    if (row >= self.rowNum) {
        NSLog(@"行号不存在！");
        return nil;
    }
    
    return [QJVector vectorWithArray:self.matrixArr[row]];
}

// 获取矩阵某列的向量
- (QJVector *)vectorInColum:(NSInteger)colum{
    if (colum >= self.columnNum) {
        NSLog(@"列号不存在！");
        return nil;
    }
    
    NSMutableArray *temArr = [NSMutableArray array];
    for (NSArray *arr in self.matrixArr) {
        [temArr addObject:arr[colum]];
    }
    
    return [QJVector vectorWithArray:temArr];
}

/// 获取矩阵的某个元素
- (NSNumber *)itemInRow:(NSInteger)row colum:(NSInteger)colum{
    if (row>=self.rowNum || colum>=self.columnNum) {
        NSLog(@"不存在！");
        return nil;
    }
    
    return self.matrixArr[row][colum];
}

#pragma mark -
- (NSString *)description{
    NSMutableArray *temArr = [NSMutableArray array];
    
    for (NSArray *arr in self->_matrixArr) {
        [temArr addObject:[arr componentsJoinedByString:@" "]];
    }
    
    return [@"\n" stringByAppendingFormat:@"%@\n",[temArr componentsJoinedByString:@"\n"]];
}

@end
