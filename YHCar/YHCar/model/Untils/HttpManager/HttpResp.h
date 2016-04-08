//
//  NTHttpResp.h
//  NTMokredit
//
//  Created by Guanyy on 14/9/9.
//  Copyright (c) 2014年 NT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface HttpResp : NSObject

@property (nonatomic, assign) int resultcode;

@property (nonatomic, strong) NSString *resultMsg;

@property (nonatomic, strong) NSDictionary* dictionary;

@property (nonatomic, strong) NSArray* array;

@property (nonatomic, copy) NSString* singleResult;

@property (nonatomic, strong) AFHTTPRequestOperation *opertaion;



- (instancetype)initWithData:(id)data;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (BOOL)hasError;

@end
