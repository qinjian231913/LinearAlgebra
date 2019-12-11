//
//  main.m
//  LinearAlgebra
//
//  Created by TING on 11/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QJVector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        QJVector *vector1 = [QJVector vectorWithArray:@[@3,@5]];
        QJVector *vector2 = [QJVector vectorWithArray:@[@4,@9]];

        NSLog(@"%@ + %@ = %@",vector1,vector2,[vector1 addVector:vector2]);
    }
    return 0;
}
