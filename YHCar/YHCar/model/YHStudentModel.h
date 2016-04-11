//
//  YHStudentModel.h
//  YHCar
//
//  Created by 崔小雨 on 16/4/11.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHStudentModel : NSObject
//sname:’学员姓名’,snbr:’学员学号’,idcard:’身份证号’,item1:’科目一满或未满’,item2:’科目二满或未满’,item3:’科目三满或未满’,test:’通过或未通过

@property (nonatomic,strong)NSString *sname;
@property (nonatomic,strong)NSString *snbr;
@property (nonatomic,strong)NSString *idcard;
@property (nonatomic,strong)NSString *item1;
@property (nonatomic,strong)NSString *item2;
@property (nonatomic,strong)NSString *item3;
@property (nonatomic,strong)NSString *test;
@end
