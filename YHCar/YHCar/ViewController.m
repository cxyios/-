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
#import "ConfigDefine.h"
#import "HttpManager.h"
#import "HttpReq.h"
#import "NHAPI.h"
#import "AFNetworking.h"
@interface ViewController ()
{
    
    UITextField *IdCard;
    UITextField *password;
}
@end

@implementation ViewController
//登录页面

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUI];
}
/**
 *  创建页面UI
 */
- (void)createUI{
    UIView *IdCard_view = [[UIView alloc]init];
    IdCard_view.layer.borderWidth = 1;
    IdCard_view.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]CGColor];
    [self.view addSubview:IdCard_view];
    IdCard_view.sd_layout.topSpaceToView(self.view,80).leftSpaceToView(self.view,-1).rightSpaceToView(self.view,-1).heightIs(40);
    
    UIView *password_view = [[UIView alloc]init];
    password_view.layer.borderWidth = 1;
    password_view.layer.borderColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]CGColor];
    [self.view addSubview:password_view];
    password_view.sd_layout.topSpaceToView(IdCard_view,-1).leftSpaceToView(self.view,-1).rightSpaceToView(self.view,-1).heightIs(40);
    
    IdCard = [[UITextField alloc]init];
    [IdCard_view addSubview:IdCard];
    IdCard.placeholder = @"  身份证号";
    IdCard.font = [UIFont systemFontOfSize:15];
    IdCard.sd_layout.topSpaceToView(IdCard_view,1).rightSpaceToView(IdCard_view,0).leftSpaceToView(IdCard_view,3).heightIs(40);
    
    password = [[UITextField alloc]initWithFrame:CGRectMake(-1,69, kWinSize.width+2, 50)];
    [password_view addSubview:password];
    password.placeholder = @"  默认密码为身份证后六位";
    password.sd_layout.topSpaceToView(password_view,1).rightSpaceToView(password_view,0).leftSpaceToView(password_view,3).heightIs(40);
    password.font = [UIFont systemFontOfSize:15];
    [password setSecureTextEntry:YES];
    //登录按钮
    UIButton *login = [[UIButton alloc]init];
    [self.view addSubview:login];
    login.sd_layout.topSpaceToView(password_view,20).leftSpaceToView(self.view,20).rightSpaceToView(self.view,20).heightIs(40);
    [login setTitle:@"登录" forState:UIControlStateNormal];
    login.backgroundColor = [UIColor colorWithRed:24/255.0 green:240/255.0 blue:207/255.0 alpha:1];
    login.titleLabel.textColor = [UIColor whiteColor];
    [login addTarget:self action:@selector(loginIn:)  forControlEvents:UIControlEventTouchUpInside];
   
   }
/**
 *  登录按钮点击事件
 *
 *  @param sender 按钮
 */
- (void)loginIn:(UIButton *)sender{
    HttpReq *req = [[HttpReq alloc]initWithApi:API_Login params:@{@"idCard":IdCard.text,@"passwd":password.text}];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // post请求
    [manager POST:req.api parameters:req.params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
     //   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        //登录成功以后操作 先拿key 再dismiss
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
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
