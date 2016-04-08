//
//  UITableViewCell+YNKit.h
//  NeiHang
//
//  Created by 虾丸 on 15/12/3.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Kit.h"

@interface UITableViewCell (YNKit)

/**
 *  获取所在的TableView
 *
 *  @return tableview
 */
- (UITableView *)table;

/**
 *  清除当前Cell的选中效果
 */
- (void)clearBg;

/**
 *  为某subView添加点击效果
 *
 *  @param view  subView
 *  @param index 图层位置
 */
- (void)addNewSelectedBg:(UIView *)view InsertIndex:(NSInteger)index;

/**
 *  为某subView添加点击效果
 *
 *  @param view subView
 */
- (void)addNewSelectedBg:(UIView *)view;

/**
 *  调用 TableView 的 didSelectRowAtIndexPath:indexPathForCell: 方法
 */
- (void)touchBtToSelectedCell;

@end
