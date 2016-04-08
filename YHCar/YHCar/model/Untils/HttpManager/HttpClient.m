//
//  NTHttp.m
//  NTHttp
//
//  Created by Guanyy on 14/9/10.
//  Copyright (c) 2014年 moKredit Inc. All rights reserved.
//

#import "HttpClient.h"
#import "AFNetworking.h"
#import "NSDictionary+QueryString.h"

//#import "NSDictionary+QueryString.h"

static NSTimeInterval timeoutInterval = 180;

@interface HttpClient ()


@end

@implementation HttpClient

- (id)init {
    return [self initWithBaseURL:[NSURL URLWithString:URL_COMMON]];
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];

        [self.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        //self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];

    }
    return self;
}

/*
- (AFHTTPRequestOperation *)doAsyncPost:(HttpReq *)req
                                  start:(HttpConnectStartBlock)startBlock
                                success:(HttpConnectSuccessBlock)successBlock
                                failure:(HttpConnectFailureBlock)failureBlock
                                 finish:(HttpConnectFinishBlock)finishBlock{
    
    AFHTTPRequestOperationManager *manager =
    [AFHTTPRequestOperationManager manager];
    
    AFHTTPResponseSerializer *responseSerializer =
    [AFHTTPResponseSerializer serializer];
    
    responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"application/atom+xml", nil];
    manager.responseSerializer = responseSerializer;
    
    req.type = HttpMethodTypePost;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:req.type
                                                                                 URLString:[NSString stringWithFormat:@"%@%@%@",self.baseURL,req.apiVersion,req.api]
                                                                                parameters:req.params
                                                                                     error:nil];
//    [self setCookieToUrl:request.URL];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        HttpResp *resp = [[HttpResp alloc]initWithDictionary:responseObject];
        resp.opertaion = operation;
        if (successBlock) {
            successBlock(req,resp);
        }
        if (finishBlock) {
            finishBlock(req,YES);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [SVProgressHUD showErrorWithStatus:ErrorMsg_Network completion:^(BOOL finished) {
//            if (failureBlock) {
//                failureBlock(req,error);
//            }
//            if (finishBlock) {
//                finishBlock(req,NO);
//            }
//        }];

    }];
    
    [manager.operationQueue addOperation:operation];
    
    return operation;
}
*/

- (AFHTTPRequestOperation *)doHTTPPost:(HttpReq *)req
                                 start:(HttpConnectStartBlock)startBlock
                               success:(HttpConnectSuccessBlock)successBlock
                               failure:(HttpConnectFailureBlock)failureBlock
                                finish:(HttpConnectFinishBlock)finishBlock
{
    req.type = HttpMethodTypePost;
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:req.type
                                                                                 URLString:[NSString stringWithFormat:@"%@%@%@",self.baseURL,req.apiVersion,req.api]
                                                                                parameters:req.params
                                                                                     error:nil];
    request.timeoutInterval = timeoutInterval;
    [self setCookieToUrl:request.URL];
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request
                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                                                                          NSLog(@"response:%@",responseObject);
                                                                          HttpResp *resp = [[HttpResp alloc]initWithDictionary:responseObject];
                                                                          resp.opertaion = operation;
                                                                          if (successBlock) {
                                                                              successBlock(req,resp);
                                                                          }
                                                                          if (finishBlock) {
                                                                              finishBlock(req,YES);
                                                                          }
                                                                          
                                                                      }
                                                                      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                          //未知错误
                                                                          if (failureBlock) {
                                                                              failureBlock(req,error);
                                                                          }
                                                                          if (finishBlock) {
                                                                              finishBlock(req,NO);
                                                                          }
                                                                      }];
    [self.operationQueue addOperation:operation];
    if (startBlock) {
        startBlock(req);
    }
    return operation;
}



- (void)cancelAllHTTPOperations {
    [self.operationQueue cancelAllOperations];
}

- (void)cancelAllHTTPOperationsWithMethod:(NSString *)method path:(NSString *)path {
    for (NSOperation *operation in [self.operationQueue operations]) {
        if (![operation isKindOfClass:[AFHTTPRequestOperation class]]) {
            continue;
        }
        
        if ((!method || [method isEqualToString:[[(AFHTTPRequestOperation *)operation request] HTTPMethod]]) && [path isEqualToString:[[[(AFHTTPRequestOperation *)operation request] URL] path]]) {
            [operation cancel];
        }
    }
}

#pragma mark ---- private methods ----
- (void)setCookieToUrl:(NSURL *)url {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:@"APPNeiTaoAUTOAUTH4"]||[cookie.name isEqualToString:@"ASP.NET_SessionId"]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
    if ([UserDefaultUtils sharedInstance].userIdCookie.length>0 && [UserDefaultUtils sharedInstance].token.length>0) {
        
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 [url host], NSHTTPCookieDomain,
                                 [url path], NSHTTPCookiePath,
                                 @"APPNeiTaoAUTOAUTH4",  NSHTTPCookieName,
                                 [NSString stringWithFormat:@"userid=%@",[UserDefaultUtils sharedInstance].userIdCookie],NSHTTPCookieValue, nil]];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        
//        cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
//        Log(@"set cookies:%@ \n url:%@",cookies,url);
        
    }
    if ([UserDefaultUtils sharedInstance].sessionId.length>0) {
        NSHTTPCookie *sessiondId = [NSHTTPCookie cookieWithProperties:
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     [url host], NSHTTPCookieDomain,
                                     [url path], NSHTTPCookiePath,
                                     @"ASP.NET_SessionId",  NSHTTPCookieName,
                                     [UserDefaultUtils sharedInstance].sessionId, NSHTTPCookieValue, nil]];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:sessiondId];

    }
    
    
}

- (void)saveCookieWithUrl:(NSURL *)url //保存用户token
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
    Log(@"save cookies:%@ \n url:%@",cookies,url);
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:@"APPNeiTaoAUTOAUTH4"]) {
            [UserDefaultUtils sharedInstance].token = cookie.value;
            
            NSDictionary *par = [NSDictionary dictionaryWithQueryString:cookie.value];
            [UserDefaultUtils sharedInstance].userIdCookie = par[@"userid"];
            
        }
        if ([cookie.name isEqualToString:@"ASP.NET_SessionId"]) {
            [UserDefaultUtils sharedInstance].sessionId = cookie.value;
        }
        
    }
}

- (void)saveUserIdCookie{
    NSString *useridCookie = [UserDefaultUtils sharedInstance].userIdCookie;
    if (useridCookie == nil  || useridCookie.length == 0) {
        NSDictionary *par = [NSDictionary dictionaryWithQueryString:[UserDefaultUtils sharedInstance].token];
        [UserDefaultUtils sharedInstance].userIdCookie = par[@"userid"];
    }
}
@end
