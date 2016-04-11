//
//  NHRefreshBackNormalFooter.m
//  NeiHang
//
//  Created by 虾丸 on 15/10/10.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "NHRefreshBackNormalFooter.h"

@implementation NHRefreshBackNormalFooter

- (void)prepare
{
    [super prepare];
    
    [self setTitle:@"正在载入..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"没有更多内容了..." forState:MJRefreshStateNoMoreData];
    
    self.stateLabel.textColor = [UIColor blackColor];
    
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    self.automaticallyChangeAlpha = YES;
}


@end
