//
//  UIView+Kit.h
//  内淘
//
//  Created by yingying on 15/5/4.
//  Copyright (c) 2015年 NeiTao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NT_BORDERCOLOR_DEFAULT RGB(221, 221, 221)

@interface UIView (Kit)


- (void)setBorderWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width;

/*
添加边框
 默认边框颜色: NT_BORDERCOLOR_DEFAULT
 */
- (NSArray<CALayer *> *)setBorderToTop:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/**
 *切圆角边缘
 */
- (void)setCornerRadiusWithCornerRadius:(CGFloat)cornerRadius;



- (void)setShadowColorWithShadowColor:(UIColor *)shadowColor
                         ShadowRadius:(CGFloat)shadowRadius
                        ShadowOpacity:(CGFloat)shadowOpacity
                         shadowOffset:(CGSize)shadowOffset;

@end
