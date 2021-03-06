//
//  HttpReq.h
//  YHCar
//
//  Created by 崔小雨 on 16/4/9.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HttpMethodTypePost  @"POST"
#define HttpMethodTypeGet   @"GET"

typedef NSString* Api;
typedef NSString* ApiVersion;

@interface HttpReq : NSObject

@property (nonatomic, copy) Api api;
@property (nonatomic, copy) ApiVersion apiVersion;

@property (nonatomic, copy) NSString* type;

@property (nonatomic, strong) NSMutableDictionary* params;

@property (nonatomic, assign) BOOL toastError;

@property (nonatomic, copy) NSString *loadingMsg; //Set nil if no need loadingView

@property (nonatomic, copy) NSString* tokenInCookie;

- (instancetype)initWithApi:(Api)api;
- (instancetype)initWithApi:(Api)api params:(NSDictionary*)params;
- (instancetype)initWithApi:(Api)api version:(ApiVersion)apiVersion params:(NSDictionary *)params;

- (void)addParam:(NSString*)value forKey:(NSString*)key;


@end
