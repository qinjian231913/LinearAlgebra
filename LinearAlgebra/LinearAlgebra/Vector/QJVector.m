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

+ (QJVector *)vectorWithArray:(NSArray<NSNumber *> *)array{
    return [[QJVector alloc] initWithArray:array];
}

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array
{
    self = [super init];
    if (self) {
        self->_dimensionArr = [array mutableCopy];
    }
    return self;
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

// 向量的单位向量(一个向量的单位向量就是和该向量方向相同并且模为1的向量)
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
// 两个向量先将
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


#pragma mark -
- (NSString *)description
{
    return [NSString stringWithFormat:@"(%@)", [self->_dimensionArr componentsJoinedByString:@","]];
}

@end
