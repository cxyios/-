//
//  HttpReq.m
//  YHCar
//
//  Created by 崔小雨 on 16/4/9.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import "HttpReq.h"

@implementation HttpReq
- (instancetype)initWithApi:(Api)api {
    self = [super init];
    
    if(self) {
        self.api = api;
     //   self.apiVersion = API_VERSION_BASE;
        self.params = [NSMutableDictionary dictionaryWithDictionary:@{}];
        self.toastError = YES;
    }
    
    return self;
}

- (instancetype)initWithApi:(Api)api params:(NSDictionary *)params {
    self = [super init];
    
    if(self) {
        self.api = api;
     //   self.apiVersion = API_VERSION_BASE;
        self.params = [NSMutableDictionary dictionaryWithDictionary:params];
        self.toastError = YES;
    }
    
    return self;
}


- (instancetype)initWithApi:(Api)api version:(ApiVersion)apiVersion params:(NSDictionary *)params {
    self = [super init];
    
    if(self) {
        self.api = api;
        self.apiVersion = apiVersion;
        self.params = [NSMutableDictionary dictionaryWithDictionary:params];
        self.toastError = YES;
    }
    
    return self;
}


- (void)addParam:(NSString *)value forKey:(NSString *)key {
    if(value == nil || key == nil)
        return;
    if(self.params == nil)
        self.params = [NSMutableDictionary new];
    [self.params setObject:value forKey:key];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@",self.params];
}

-(Api)api{
    if (![_api hasSuffix:@".ashx"]) {
        _api =  [NSString stringWithFormat:@"%@.ashx",_api];
    }
    return _api;
}

-(void)setApiVersion:(ApiVersion)apiVersion{
    _apiVersion = [NSString stringWithFormat:@"v%@/",apiVersion];
}

@end
