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
{
    NSMutableArray *_dimensionArr; // 向量维度数组
}

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array
{
    self = [super init];
    if (self) {
        self->_dimensionArr = [array mutableCopy];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(%@)", [self->_dimensionArr componentsJoinedByString:@","]];
}

@end
