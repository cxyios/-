//
//  UITableViewCell+YNKit.m
//  NeiHang
//
//  Created by 虾丸 on 15/12/3.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "UITableViewCell+YNKit.h"

@implementation UITableViewCell (YNKit)

- (UITableView *)table{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UITableView class]]) {
            return (UITableView*)nextResponder;
        }
    }
    return nil;
}

-(void)clearBg{
    self.backgroundColor = [UIColor clearColor];
    UIView *view_bg = [[UIView alloc]initWithFrame:self.frame];
    view_bg.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = view_bg;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)addNewSelectedBg:(UIView *)view InsertIndex:(NSInteger)index{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(touchBtToSelectedCell) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"bt_selectedBg_style4"]
                      forState:UIControlStateHighlighted];
    //    [view addSubview:button];
    [view insertSubview:button atIndex:index];
    [button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top);
        make.bottom.equalTo(view.mas_bottom);
        make.left.equalTo(view.mas_left);
        make.right.equalTo(view.mas_right);
    }];
}

- (void)addNewSelectedBg:(UIView *)view{
    [self addNewSelectedBg:view InsertIndex:0];
}

- (void)touchBtToSelectedCell{
    if(self.table &&
       self.table.delegate &&
       [self.table.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        [self.table.delegate tableView:self.table didSelectRowAtIndexPath:[self.table indexPathForCell:self]];
    }
}

@end
