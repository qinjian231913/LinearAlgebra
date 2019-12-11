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

#pragma mark -

- (QJVector *)addVector:(QJVector *)vector{
    
    return nil;
}


#pragma mark -
- (NSString *)description
{
    return [NSString stringWithFormat:@"(%@)", [self->_dimensionArr componentsJoinedByString:@","]];
}

@end
