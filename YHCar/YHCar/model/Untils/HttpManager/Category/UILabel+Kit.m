//
//  UILabel+Kit.m
//  NeiTao
//
//  Created by yingying on 15/3/16.
//  Copyright (c) 2015年 NeiTao. All rights reserved.
//

#import "UILabel+Kit.h"
#import <QuartzCore/QuartzCore.h>

@implementation UILabel (Kit)

- (CAGradientLayer *)shadowAsInverseToContacts
{
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    CGRect newGradientLayerFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    gradientLayer.frame = newGradientLayerFrame;
    
    //添加渐变的颜色组合
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor clearColor] CGColor],
                            (id)[[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor],
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.1],
                               [NSNumber numberWithFloat:1],
                               nil];
    
    gradientLayer.startPoint = CGPointMake(0,0);
    gradientLayer.endPoint = CGPointMake(0,1);
    
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    return gradientLayer;
}


- (CGSize)contentSizeWithWidth:(CGFloat)width{
    
    return [self contentSizeWithWidth:width Height:CGFLOAT_MAX];

}

- (CGSize)contentSizeWithHeight:(CGFloat)height{
    return [self contentSizeWithWidth:self.frame.size.width Height:height];
}

- (CGSize)contentSize {
    
    
   return [self contentSizeWithWidth:self.frame.size.width Height:CGFLOAT_MAX];
    
    /*
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;
    
    NSDictionary * attributes = @{NSFontAttributeName : self.font,
                                  NSParagraphStyleAttributeName : paragraphStyle};
    
    CGSize contentSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              attributes:attributes
                                                 context:nil].size;
    return contentSize;
     */
    
}

- (CGSize)contentSizeWithWidth:(CGFloat)width Height:(CGFloat)height{
    
    float contentH;
    //        CGRect txtFrame = textView.frame;
    float textViewContentHeight  =[self.text
                                   boundingRectWithSize:CGSizeMake(width, height)
                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                   attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil] context:nil].size.height;
    contentH = textViewContentHeight;
    
    CGSize size = CGSizeMake(width, contentH);
    return size;

}

@end
