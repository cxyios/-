//
//  NSString+Kit.m
//  Tickets
//
//  Created by Guanyy on 13-11-5.
//  Copyright (c) 2013年 Guan Yayang. All rights reserved.
//

#import "NSString+Kit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Kit)

+ (BOOL)isEmpty:(NSString*)string {
    if([string isEqual:[NSNull null]] || string == nil || [string length] == 0 || [string caseInsensitiveCompare:@"null"] == NSOrderedSame || [string caseInsensitiveCompare:@"nil"] == NSOrderedSame || [string caseInsensitiveCompare:@"<null>"] == NSOrderedSame) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidEmail;
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidMobilePhone {
    if([self length] != 11) {
        return NO;
    }

    return [self isNumberString];
    
}

- (NSString*)MD5 {
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

- (NSInteger)indexOf:(NSString *)text {
    NSRange range = [self rangeOfString:text];
    if (range.location != NSNotFound) {
        return range.location;
    }
    else {
        return -1;
    }
}

- (BOOL)bankCardValidate {
    if([NSString isEmpty:self])
        return NO;
    else {
        char bit = [self bankCardCheckCode:[self substringToIndex:self.length - 1]];
        if(bit == 'N')
            return NO;
        char c = [self characterAtIndex:self.length - 1];
        return c == bit;
    }
}

- (char)bankCardCheckCode:(NSString*)nonCheckCodeCardId {
    if(nonCheckCodeCardId == nil || [nonCheckCodeCardId stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0)
        return 'N';
    
    NSString *phoneRegex = @"\\d+";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    if(![phoneTest evaluateWithObject:nonCheckCodeCardId])
        return 'N';
    
    const char *chs = [nonCheckCodeCardId UTF8String];
    int luhmSum = 0;
    for(int i = (int)strlen(chs) - 1, j = 0; i >= 0; i--, j++) {
        int k = chs[i] - '0';
        if(j % 2 == 0) {
            k *= 2;
            k = k / 10 + k % 10;
        }
        luhmSum += k;
    }
    
    return (luhmSum % 10 == 0) ? '0' : (char)((10 - luhmSum % 10) + '0');
}

- (BOOL)idCardNumberValidate {
    
    NSString* value = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSInteger length = 0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        
        if (length != 15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11", @"12", @"13", @"14", @"15", @"21", @"22", @"23", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"41", @"42", @"43", @"44", @"45", @"46", @"50", @"51", @"52", @"53", @"54", @"61", @"62", @"63", @"64", @"65", @"71", @"81", @"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year = 0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year % 4 ==0 || (year % 100 ==0 && year % 4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];// 测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];// 测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                              options:NSMatchingReportProgress
                                                                range:NSMakeRange(0, value.length)];
            
            if(numberofMatch > 0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year % 4 ==0 || (year % 100 ==0 && year % 4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];// 测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];// 测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                              options:NSMatchingReportProgress
                                                                range:NSMakeRange(0, value.length)];

            
            if(numberofMatch > 0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value  substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S % 11;
                NSString *M = @"F";
                NSString *JYM = @"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)]; // 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}

// 正常号转银行卡号 － 增加4位间的空格
- (NSString *)normalNumToBankNum {
    NSString *tmpStr = [self bankNumToNormalNum];
    
    NSInteger size = (tmpStr.length / 4);
    
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    for (int n = 0;n < size; n++)
    {
        [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(n*4, 4)]];
    }
    
    [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(size*4, (tmpStr.length % 4))]];
    
    tmpStr = [tmpStrArr componentsJoinedByString:@" "];
    
    return tmpStr;
}


- (NSString *)encodeString{
    return [NSString stringWithString:[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

- (NSString *)decodedString{
    return [NSString stringWithString:[[self stringByReplacingOccurrencesOfString:@"+" withString:@" "] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}




//判断是否为整形：
- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)isNumberString{
    if( [self isPureInt] || [self isPureFloat])
    {
        return YES;
    }else{
        return NO;
    }
}

//判断是否有特殊字符
-(BOOL)hasSymbolSpecialChar{
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [self rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€.,?!'-//:;"]];
    if (urgentRange.location == NSNotFound || urgentRange.length == 0)
    {
        return NO;
    }
    //NSLog(@"包含特殊字符");
    return YES;
}


-(BOOL)hasSpace{
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
    return hadSpace;
}

-(NSUInteger) unicodeLength{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < self.length; i++) {
        
        
        unichar uc = [self characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    
    if(asciiLength % 2) {
        unicodeLength++;
    }
    
    return unicodeLength;
}

/**
 Base64编码
 */
- (NSString *)base64StringCode{
    
//    NSString* encodeResult = nil;
//    
//    NSData* originData = [self dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSData* encodeData = [GTMBase64 encodeData:originData];
//    
//    encodeResult = [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
//    
//    return encodeResult;
    
    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
    
    return decodeStr;
}

/**
 Base64解码
 */
- (NSString *)base64StringDeCode{
    
//    NSString* decodeResult = nil;
//    
//    NSData* encodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSData* decodeData = [GTMBase64 decodeData:encodeData];
//    
//    decodeResult = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
//    
//    return decodeResult;
    
    NSData* originData = [self dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    return encodeResult;
    
}

@end
