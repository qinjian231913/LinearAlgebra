//
//  QJVector.h
//  LinearAlgebra
//
//  Created by TING on 11/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QJVector : NSObject


/// 根据一个数组来生成向量
/// @param array 数组里面存放的是向量的每个维度的值
- (instancetype)initWithArray:(NSArray<NSNumber *> *)array;

@end

NS_ASSUME_NONNULL_END
