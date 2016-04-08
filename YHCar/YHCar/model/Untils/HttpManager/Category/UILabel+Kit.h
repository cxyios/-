//
//  UILabel+Kit.h
//  NeiTao
//
//  Created by yingying on 15/3/16.
//  Copyright (c) 2015年 NeiTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Kit)

- (CAGradientLayer *)shadowAsInverseToContacts;//人脉圈封面label用的渐变色

- (CGSize)contentSizeWithWidth:(CGFloat)width;
- (CGSize)contentSizeWithHeight:(CGFloat)height;
- (CGSize)contentSize;
- (CGSize)contentSizeWithWidth:(CGFloat)width Height:(CGFloat)height;
@end
