//
//  UIBarButtonItem+YNKit.m
//  NeiHang
//
//  Created by 虾丸 on 15/12/3.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "UIBarButtonItem+YNKit.h"
#import "NavBarCitySelectItemView.h"
#import "NavBarSearchItemView.h"

@implementation UIBarButtonItem (YNKit)

/**
 *  城市选择Item
 */
+ (instancetype)CityItem{
    return [[UIBarButtonItem alloc]initWithCustomView:[NavBarCitySelectItemView ynCreate]];
}

/**
 *  搜索Item
 */
+ (instancetype)SearchItem{
    return [[UIBarButtonItem alloc]initWithCustomView:[NavBarSearchItemView ynCreate]];
}

@end
