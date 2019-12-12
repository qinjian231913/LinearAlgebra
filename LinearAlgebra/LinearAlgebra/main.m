//
//  main.m
//  LinearAlgebra
//
//  Created by TING on 11/12/2019.
//  Copyright © 2019 SHENZHEN TITA INTERACTIVE TECHNOLOGY CO.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QJVector.h"
#import "QJMatrix.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        NSMutableArray *mArr1 = [NSMutableArray arrayWithArray:
                                @[@[@1,@2,@4,@2],
                                  @[@3,@4,@4,@3],
                                  @[@3,@8,@3,@8]
                                ]];
        QJMatrix *matrix1 = [QJMatrix matrixWithArray:mArr1];
        

        NSMutableArray *mArr2 = [NSMutableArray arrayWithArray:
                                @[@[@2,@2,@4,@2],
                                  @[@3,@3,@4,@0],
                                  @[@3,@9,@3,@8]
                                ]];
        QJMatrix *matrix2 = [QJMatrix matrixWithArray:mArr2];
        
        NSLog(@"%@",[matrix1 itemInRow:2 colum:1]);
//        NSLog(@"%@",[matrix1 vectorInColum:3]);
//        NSLog(@"%@+%@=%@",matrix1,matrix2,[matrix1 addMatrix:matrix2]);
//        NSLog(@"%@-%@=%@",matrix1,matrix2,[matrix1 minusMatrix:matrix2]);
        
    }
    return 0;
}
