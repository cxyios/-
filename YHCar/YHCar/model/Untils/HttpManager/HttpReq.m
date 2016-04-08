//
//  NTHttpReq.m
//  NTMokredit
//
//  Created by Guanyy on 14/9/9.
//  Copyright (c) 2014年 NT. All rights reserved.
//

#import "HttpReq.h"
#import "NHAPI.h"

@implementation HttpReq

- (instancetype)initWithApi:(Api)api {
    self = [super init];

    if(self) {
        self.api = api;
        self.apiVersion = API_VERSION_BASE;
        self.params = [NSMutableDictionary dictionaryWithDictionary:@{}];
        self.toastError = YES;
    }
    
    return self;
}

- (instancetype)initWithApi:(Api)api params:(NSDictionary *)params {
    self = [super init];
    
    if(self) {
        self.api = api;
        self.apiVersion = API_VERSION_BASE;
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
