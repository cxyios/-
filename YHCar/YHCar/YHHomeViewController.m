//
//  YHHomeViewController.m
//  YHCar
//
//  Created by 崔小雨 on 16/4/11.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import "YHHomeViewController.h"
#import "ViewController.h"
#import "ConfigDefine.h"
//扫描二维码
#import "ZCZBarViewController.h"
//生成二维码
#import "QRCodeGenerator.h"

@interface YHHomeViewController ()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *downView;

@end

@implementation YHHomeViewController
- (void)viewWillAppear:(BOOL)animated{
//    NSString * card = [[NSUserDefaults standardUserDefaults] objectForKey:@"idCard"];
//    
//    if(card.length==0){
//        ViewController *c1=[[ViewController alloc]init];
//[self presentViewController:c1 animated:YES completion:^{
//    
//}];
//    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self topView];
    [self downView];
    [self createTopViewWithIcon:@"6" withName:@"***" withSex:@"*"];
    [self createDownViewWithResult:@[@"满", @"不满", @"不满", @"不满", @"不满"]];
    
}
// icon 头像 name 姓名 sex 性别
- (void)createTopViewWithIcon:(NSString *)icon withName:(NSString *)name withSex:(NSString *)sex {
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.layer.cornerRadius = 273 / 2 / 2;
    iconView.layer.masksToBounds = YES;
    iconView.image = [UIImage imageNamed:icon];
    [self.topView addSubview:iconView];
    iconView.sd_layout.topSpaceToView(self.topView, 186 / 2).leftSpaceToView(self.topView, 238 / 2).rightSpaceToView(self.topView, 238 / 2).heightIs(273 / 2);
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.topView addSubview:nameLabel];
    nameLabel.sd_layout.topSpaceToView(iconView, 52 / 2).widthIs(kWinSize.width).heightIs(28 / 2);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = [NSString stringWithFormat:@"姓名 ： %@",name];
    nameLabel.font = [UIFont systemFontOfSize:28 /2];
    
    
    UILabel *sexLable = [[UILabel alloc] init];
    [self.topView addSubview:sexLable];
    sexLable.sd_layout.topSpaceToView(nameLabel, 52 / 2).widthIs(kWinSize.width).heightIs(28 / 2);
    sexLable.textAlignment = NSTextAlignmentCenter;
    sexLable.text = [NSString stringWithFormat:@"性别 ： %@", sex];
    sexLable.font = [UIFont systemFontOfSize:28 /2];
}

// result 各科科目结果
- (void)createDownViewWithResult:(NSArray *)result {
    NSArray *title = @[@"科目一学时", @"科目二学时", @"科目三学时", @"科目四学时", @"考试结果"];
    CGFloat height = 4 * (28 + 50) / 2 + 55;
    
    for (int i = 0; i < 5; i++) {
        UILabel *titleLable = [[UILabel alloc] init];
        [self.downView addSubview:titleLable];
        titleLable.sd_layout.topSpaceToView(self.downView, 0 + i * (28 + 50) / 2).leftSpaceToView(self.downView, 110 / 2).rightSpaceToView(self.downView, kWinSize.width / 2).heightIs(28 / 2);
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.text = title[i];
        titleLable.font = [UIFont systemFontOfSize:28 /2];
        
        UILabel *failLable = [[UILabel alloc] init];
        [self.downView addSubview:failLable];
        failLable.sd_layout.topEqualToView(titleLable).widthIs(74 / 2).heightIs(38 / 2).rightSpaceToView(self.downView, 110 / 2);
        failLable.text = @"未通过";
        failLable.font = [UIFont boldSystemFontOfSize:9];
        failLable.textColor = [UIColor whiteColor];
        failLable.textAlignment = NSTextAlignmentCenter;
        
        UILabel *passLable = [[UILabel alloc] init];
        [self.downView addSubview:passLable];
        passLable.sd_layout.topEqualToView(titleLable).widthIs(74 / 2).heightIs(38 / 2).rightSpaceToView(failLable, 0);
        passLable.text = @"通过";
        passLable.font = [UIFont boldSystemFontOfSize:9];
        passLable.textColor = [UIColor whiteColor];
        passLable.textAlignment = NSTextAlignmentCenter;
        if ([result[i] isEqualToString:@"满"]) {
            passLable.backgroundColor = [UIColor colorWithRed:24 / 255.f green:240 / 255.f blue:207 / 255.f alpha:1];
            failLable.backgroundColor = [UIColor colorWithRed:240 / 255.f green:240 / 255.f blue:240 / 255.f alpha:1];
        }
        else {
            passLable.backgroundColor = [UIColor colorWithRed:240 / 255.f green:240 / 255.f blue:240 / 255.f alpha:1];
            failLable.backgroundColor = [UIColor redColor];
            
        }
        
    }
    
    // 扫一扫
    UIView *sweepView = [[UIView alloc] init];
    [self.downView addSubview:sweepView];
    sweepView.sd_layout.topSpaceToView(self.downView, height).leftSpaceToView(self.downView, 110 / 2).rightSpaceToView(self.downView, 110 / 2).heightIs(70 / 2);
    sweepView.backgroundColor = [UIColor colorWithRed:24 / 255.f green:240 / 255.f blue:207 / 255.f alpha:1];
    
    UIImageView *sweepIcon = [[UIImageView alloc] init];
    sweepIcon.image = [UIImage imageNamed:@"Sweep"];
    [sweepView addSubview:sweepIcon];
    sweepIcon.sd_layout.topSpaceToView(sweepView, 0).rightSpaceToView(sweepView, (kWinSize.width - 110) / 2 + 35).heightIs(40).widthIs(60);
    
    UILabel *sweep = [[UILabel alloc] init];
    [sweepView addSubview:sweep];
    sweep.sd_layout.topSpaceToView(sweepView, 0).leftSpaceToView(sweepView, (kWinSize.width - 110) / 2  - 20).rightSpaceToView(sweepView, 0).heightIs(70 / 2);
    sweep.text = @"扫 一 扫";
    sweep.font = [UIFont boldSystemFontOfSize:34 / 2];
    sweep.textColor = [UIColor whiteColor];
    sweep.textAlignment = NSTextAlignmentLeft;
    
    UIButton *saoyisao = [[UIButton alloc]init];
    [sweepView addSubview:saoyisao];
    saoyisao.sd_layout.leftSpaceToView(sweepView,0).topSpaceToView(sweepView,0).rightSpaceToView(sweepView,0).bottomSpaceToView(sweepView,0);
    [saoyisao addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
   
    UIButton * loginout = [[UIButton alloc]init];
    [self.downView addSubview:loginout];
    loginout.sd_layout.topSpaceToView(sweepView, 10).leftSpaceToView(self.downView, 110 / 2).rightSpaceToView(self.downView, 110 / 2).heightIs(70 / 2);
    [loginout addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
    [loginout setTitle:@"退出登录" forState:UIControlStateNormal];
    [loginout setBackgroundColor:[UIColor colorWithRed:24 / 255.f green:240 / 255.f blue:207 / 255.f alpha:1]];
}

-(void)buttonClick{
    ZCZBarViewController*vc=[[ZCZBarViewController alloc]initWithBlock:^(NSString *str, BOOL isSucceed) {
        
        if (isSucceed) {
            [AFMInfoBanner showWithText:@"扫描成功" style:1 andHideAfter:2];
            
            //提交用户信息（加密）
            [self postStudentInfo];
            NSLog(@"%@",str);
            
        }else{
            [AFMInfoBanner showWithText:@"扫描失败" style:1 andHideAfter:2];
            
            NSLog(@"扫描失败");
            
        }
    }];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}
#pragma mark - 提交用户信息
- (void)postStudentInfo{
    
}
#pragma mark - 退出登录
- (void)loginOut{
    NSString * card = [[NSUserDefaults standardUserDefaults] objectForKey:@"idCard"];
    card = nil;
    [[NSUserDefaults standardUserDefaults] setObject:card forKey:@"idCard"];
    ViewController *c1=[[ViewController alloc]init];
    [self presentViewController:c1 animated:YES completion:^{
    }];
}

#pragma mark ========== 懒加载 ==========
- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWinSize.width, 684 / 2)];
        [self.view addSubview:_topView];
    }
    return _topView;
}
- (UIView *)downView {
    if (_downView == nil) {
        _downView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.topView.frame), kWinSize.width, kWinSize.height - CGRectGetHeight(self.topView.frame))];
        [self.view addSubview:_downView];
    }
    return _downView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
