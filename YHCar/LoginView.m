//
//  LoginView.m
//  YHCar
//
//  Created by 崔小雨 on 16/4/11.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import "LoginView.h"
#import "UIView+SDAutoLayout.h"
#import "ConfigDefine.h"
@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype )initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    UITextField *IdCard = [[UITextField alloc]initWithFrame:CGRectMake(-1, 20, kWinSize.width+2, 50)];
    [self addSubview:IdCard];
    IdCard.placeholder = @"  身份证号";
    IdCard.layer.borderWidth = 1;
    IdCard.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]CGColor];
    IdCard.font = [UIFont systemFontOfSize:15];

    
    UITextField *password = [[UITextField alloc]initWithFrame:CGRectMake(-1,69, kWinSize.width+2, 50)];
    [self addSubview:password];
    password.placeholder = @"  默认密码为身份证后六位";
    password.layer.borderWidth = 1;
    password.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]CGColor];
    password.font = [UIFont systemFontOfSize:15];

}
@end
