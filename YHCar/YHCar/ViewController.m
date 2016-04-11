//
//  ViewController.m
//  YHCar
//
//  Created by 崔小雨 on 16/4/8.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import "ViewController.h"
#import "HttpReq.h"
#import "HttpManager.h"
#import "LoginView.h"
#import "UIView+SDAutoLayout.h"
#import "ConfigDefine.h"
@interface ViewController ()

@end

@implementation ViewController
//登录页面
- (void)viewWillAppear:(BOOL)animated{
    //判断是否已经登录
    if(self.idCard.length!= 0){
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    LoginView *view = [[LoginView alloc ]initWithFrame:CGRectMake(0, 60, kWinSize.width, kWinSize.height)];
    [self.view addSubview:view];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - 取值赋值函数
- (void)setEkey:(NSString *)ekey{
    [[NSUserDefaults standardUserDefaults] setObject:ekey forKey:@"ekey"];
}

- (NSString *)ekey{
    NSString * key = [[NSUserDefaults standardUserDefaults] objectForKey:@"ekey"];
    return key;
}
- (void)setIdCard:(NSString *)idCard{
    [[NSUserDefaults standardUserDefaults] setObject:idCard forKey:@"idCard"];

}
- (NSString *)idCard{
    NSString * card = [[NSUserDefaults standardUserDefaults] objectForKey:@"idCard"];
    return card;
}
@end
