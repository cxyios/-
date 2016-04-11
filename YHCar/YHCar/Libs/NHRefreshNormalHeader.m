//
//  NHRefreshNormalHeader.m
//  NeiHang
//
//  Created by 虾丸 on 15/10/10.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "NHRefreshNormalHeader.h"

@implementation NHRefreshNormalHeader

- (void)prepare
{
    [super prepare];
    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    [self setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    // 隐藏状态
    self.stateLabel.hidden = NO;
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    self.automaticallyChangeAlpha = YES;

   }

@end
