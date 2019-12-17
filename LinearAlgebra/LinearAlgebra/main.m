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

// 矩阵点乘向量测试
void matrixDotMultVectorTest(){
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:
                            @[@[@2,@3,@1,@-1],
                              @[@1,@-1,@2,@-3],
                              @[@5,@-2,@1,@1],
                              @[@3,@1,@-3,@2]
                            ]];
    QJMatrix *matrix = [QJMatrix matrixWithArray:mArr];
    
    QJVector *vector = [QJVector vectorWithArray:@[@3,@5,@2,@4]];
    
    NSLog(@"%@",[matrix dotMultiplyVector:vector]);
}

// 矩阵点乘矩阵测试
void matrixDotMultMatrixTest(){
    NSMutableArray *mArr1 = [NSMutableArray arrayWithArray:
                            @[@[@2,@3,@1],
                              @[@1,@-1,@2]
                            ]];
    QJMatrix *matrix1 = [QJMatrix matrixWithArray:mArr1];
    
    NSMutableArray *mArr2 = [NSMutableArray arrayWithArray:
                            @[@[@2,@3,@1],
                              @[@1,@-1,@2],
                              @[@1,@-1,@2]
                            ]];
    QJMatrix *matrix2 = [QJMatrix matrixWithArray:mArr2];
    
    
    NSLog(@"%@",[matrix1 dotMultiplyMatrix:matrix2]);
}

// 单位矩阵测试
void unitMatrixTest(){
    QJMatrix *unitM = [QJMatrix unitMatrixWithCount:3];
    NSLog(@"%@",unitM);
    
    NSMutableArray *mArr2 = [NSMutableArray arrayWithArray:
                               @[@[@2,@3],
                                 @[@1,@-1],
                                 @[@1,@-1]
                               ]];
    QJMatrix *matrix2 = [QJMatrix matrixWithArray:mArr2];
    NSLog(@"%@",[unitM dotMultiplyMatrix:matrix2]);
}

// 交换矩阵两行测试
void swapRowTest(){
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:
                            @[@[@2,@3,@1,@-1],
                              @[@1,@-1,@2,@-3],
                              @[@5,@-2,@1,@1],
                              @[@3,@1,@-3,@2]
                            ]];
    QJMatrix *matrix = [QJMatrix matrixWithArray:mArr];
    
    NSLog(@"%@",matrix);
    [matrix swapRow1:1 andRow2:3];
    NSLog(@"%@",matrix);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

//        NSMutableArray *mArr1 = [NSMutableArray arrayWithArray:
//                                @[@[@1,@2,@4,@2],
//                                  @[@3,@4,@4,@3],
//                                  @[@3,@8,@3,@8]
//                                ]];
//        QJMatrix *matrix1 = [QJMatrix matrixWithArray:mArr1];
//
//
//        NSMutableArray *mArr2 = [NSMutableArray arrayWithArray:
//                                @[@[@2,@2,@4,@2],
//                                  @[@3,@3,@4,@0],
//                                  @[@3,@9,@3,@8]
//                                ]];
//        QJMatrix *matrix2 = [QJMatrix matrixWithArray:mArr2];
//
//        NSLog(@"%@\n%@",matrix1,[matrix1 transposition]);
//        NSLog(@"%@",[matrix1 vectorInColum:3]);
//        NSLog(@"%@+%@=%@",matrix1,matrix2,[matrix1 addMatrix:matrix2]);
//        NSLog(@"%@-%@=%@",matrix1,matrix2,[matrix1 minusMatrix:matrix2]);
        
        swapRowTest();
    }
    return 0;
}



