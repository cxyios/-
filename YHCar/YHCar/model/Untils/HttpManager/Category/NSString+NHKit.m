//
//  NSString+NHKit.m
//  NeiHang
//
//  Created by 虾丸 on 15/10/10.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "NSString+NHKit.h"
#import "NSString+Kit.h"

@implementation NSString (NHKit)

- (BOOL)isValidNick{
    if([self length] == 0) {
        return NO;
    }
    
    NSString *firstString = [self substringToIndex:1];
    
    BOOL isFirstNumStr = [firstString isNumberString];
    
    BOOL hadSpace = NO;
    NSRange range = [self rangeOfString:@" "];//判断字符串是否包含空格
    
    //if (range.location ==NSNotFound)//不包含
    if (range.length >0)//包含
    {
        hadSpace = YES;
    }
    else//不包含
    {
        hadSpace = NO;
    }
    
    
    return !(isFirstNumStr || hadSpace);
}

@end
