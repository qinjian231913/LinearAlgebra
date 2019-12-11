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
        
        QJVector *vector = [[QJVector alloc] initWithArray:@[@4]];

        NSLog(@"%@",vector);
    }
    return 0;
}
