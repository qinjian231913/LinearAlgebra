//
//  QJVector.m
//  LinearAlgebra
//
//  Created by TING on 11/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

/*
 向量类
 */
#import "QJVector.h"

@implementation QJVector

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array
{
    self = [super init];
    if (self) {
        self->_dimensionArr = [array mutableCopy];
    }
    return self;
}

#pragma mark - 类方法
// 生成一个向量
+ (QJVector *)vectorWithArray:(NSArray<NSNumber *> *)array{
    return [[QJVector alloc] initWithArray:array];
}

// 生成一个零向量
+ (QJVector *)zeroVectorWithDimension:(NSInteger)dimension{
    if (dimension < 0) {
        NSLog(@"向量维度不能小于0");
        return nil;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < dimension; i++) {
        [arr addObject:@(0)];
    }
    
    return [QJVector vectorWithArray:arr];
}


#pragma mark -
// 向量元素的个数
- (NSInteger)count{
    return self->_dimensionArr.count;
}

// 向量的模（向量中每个元素的和再开方）
- (CGFloat)normal{
    CGFloat sum = 0;
    for (NSNumber *num in self->_dimensionArr) {
        sum += powf([num floatValue], 2);
    }
    return sqrtf(sum);
}

// 向量的模为0即为零向量
- (BOOL)isZero{
    return self.normal < ZERO_FLOAT;
}

// 向量的单位向量(一个向量的单位向量就是和该向量方向相同并且模为1的向量)，将向量中的每个元素都除以向量的模就得到单位向量
- (QJVector *)normalize{
    if (self.isZero) {
        NSLog(@"不能为零向量");
        return self;
    }
    
    CGFloat tem = 1 / self.normal;
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < self.count; i++) {
        [arr addObject:@([self->_dimensionArr[i] floatValue] * tem)];
    }
    
    return [[QJVector alloc] initWithArray:arr];
}

#pragma mark -
// 加上一个向量
- (QJVector *)addVector:(QJVector *)vector{
    if (self.count != vector.count) {
        NSLog(@"相加的两个向量元素个数必须相同");
        return nil;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
       for (NSInteger i = 0; i < self.count; i++) {
           [arr addObject:@([self.dimensionArr[i] floatValue] + [vector.dimensionArr[i] floatValue])];
       }
    return [[QJVector alloc] initWithArray:arr];
}

// 减去一个向量
- (QJVector *)minusVector:(QJVector *)vector{
    if (self.count != vector.count) {
        NSLog(@"相减的两个向量元素个数必须相同");
        return nil;
    }
    
    NSMutableArray *arr = [NSMutableArray array];
       for (NSInteger i = 0; i < self.count; i++) {
           [arr addObject:@([self.dimensionArr[i] floatValue] - [vector.dimensionArr[i] floatValue])];
       }
    
    return [[QJVector alloc] initWithArray:arr];
}

// 向量乘以一个数
- (QJVector *)multiplyNumber:(CGFloat)number{
    NSMutableArray *arrayCopy = [self->_dimensionArr mutableCopy];
    
    [arrayCopy enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arrayCopy replaceObjectAtIndex:idx withObject:@([obj floatValue] * number)];
    }];

    return [ QJVector vectorWithArray:arrayCopy];
}

// 向量除以一个数
- (QJVector *)divideNumber:(CGFloat)number{
    NSAssert(fabs(number) > ZERO_FLOAT, @"除数不能为0！");
    return [self multiplyNumber:1/number];
}

// 获取向量的某个元素
- (NSNumber *)itemAtIndex:(NSInteger)idx{
    return [self->_dimensionArr objectAtIndex:idx];
}

// 向量取负
- (QJVector *)negativeVector{
    return [self multiplyNumber:-1];
}

#pragma mark - 向量点乘及其应用
// 向量点乘
- (CGFloat)dotMultiplyVector:(QJVector *)vector{
    if (self.count != vector.count) {
        NSLog(@"点乘的两个向量元素个数必须相同");
        return 0;
    }
    
    CGFloat sum = 0;
    for (NSInteger i = 0; i < self.count; i++) {
        sum += [self.dimensionArr[i] floatValue] * [vector.dimensionArr[i] floatValue];
    }
    
    return sum;
}

// 计算两个向量夹角的余弦值cosθ = (vector1*vector)/(|vector1|*|vector2|)
- (CGFloat)cosValueWithVector:(QJVector *)vector{
    if (self.count != vector.count) {
        NSLog(@"两个向量元素个数必须相同");
        return 0;
    }
    
    return [self dotMultiplyVector:vector] / (self.normal * vector.normal);
}

// 计算两个向量夹角(用弧度表示)
- (CGFloat)radianWithVector:(QJVector *)vector{
    CGFloat cosθ = [self cosValueWithVector:vector];
    return acos(cosθ);
}

// 计算两个向量夹角(用角度表示)
- (CGFloat)angleWithVector:(QJVector *)vector{
    CGFloat radian = [self radianWithVector:vector];
    return radian*180/M_PI;
}

/// 计算一个向量再另一个向量上的投影向量的模
/// @param vector 另一个向量
- (CGFloat)projectionNormalOnVector:(QJVector *)vector{
    CGFloat cosθ = [self cosValueWithVector:vector];
    return self.normal * cosθ;
}

// 计算一个向量再另一个向量上的投影向量
// 先计算vector1在vector2上投影的长度，投影向量的方向和vector2是一样的，所以用vector2的单位向量乘以投影的长度就得到了投影向量
- (QJVector *)projectionOnVector:(QJVector *)vector{
    
    return [vector.normalize multiplyNumber:[self projectionNormalOnVector:vector]];
}

#pragma mark -
- (NSString *)description
{
    return [NSString stringWithFormat:@"(%@)", [self->_dimensionArr componentsJoinedByString:@","]];
}

@end
