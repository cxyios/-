//
//  UIImage+Kit.h
//  NeiTao
//
//  Created by ChenJian on 12/23/14.
//  Copyright (c) 2014 NeiTao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCompressedValue 0.5

@interface UIImage(category)

- (UIImage *)compressedImage;

/**
 *  imageView 的Base64编码
 *
 *  @return 64位字符流
 */
- (NSString *)imageBase64EncodeString;

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

- (UIImage *)fixOrientation; //旋转并且重新绘制图片至其他设备正常方向状态

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
@end
