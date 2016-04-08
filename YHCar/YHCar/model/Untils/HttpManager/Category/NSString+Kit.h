//
//  NSString+Kit.h
//  Tickets
//
//  Created by Guanyy on 13-11-5.
//  Copyright (c) 2013年 Guan Yayang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"

#define DECODE_STR(STR) ((NSString *)STR).decodedString

@interface NSString (Kit)

+ (BOOL)isEmpty:(NSString*)string;

- (BOOL)isValidEmail;

- (BOOL)isValidMobilePhone;

- (NSString*)MD5;

- (NSInteger)indexOf:(NSString *)text;

- (BOOL)bankCardValidate;

- (BOOL)idCardNumberValidate;

- (NSString *)normalNumToBankNum;

- (NSString *)bankNumToNormalNum;

- (BOOL)isNumberString;//是否为纯数字

- (BOOL)hasSpace;//是否包含空格

- (NSUInteger)unicodeLength;//unicode长度(汉字占2个字符)


//neitao
- (NSURL *)imgUrl;

- (NSString *)encodeString;
- (NSString *)decodedString;

-(BOOL)hasSymbolSpecialChar;


//Base64编码解码

/**
 Base64编码
 */
- (NSString *)base64StringCode;

/**
 Base64解码
 */
- (NSString *)base64StringDeCode;

@end
