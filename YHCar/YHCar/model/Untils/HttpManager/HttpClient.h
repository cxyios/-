//
//  NTHttp.h
//  NTHttp
//
//  Created by Guanyy on 14/9/10.
//  Copyright (c) 2014年 moKredit Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "HttpReq.h"
#import "HttpResp.h"


typedef void (^HttpConnectStartBlock)(HttpReq* req);
typedef void (^HttpConnectFinishBlock)(HttpReq* req, BOOL success);
typedef void (^HttpConnectSuccessBlock)(HttpReq* req, HttpResp* resp);
typedef void (^HttpConnectFailureBlock)(HttpReq* req, NSError* error);

@interface HttpClient : AFHTTPRequestOperationManager

/*
- (AFHTTPRequestOperation *)doAsyncPost:(HttpReq *)req
                                  start:(HttpConnectStartBlock)startBlock
                                success:(HttpConnectSuccessBlock)successBlock
                                failure:(HttpConnectFailureBlock)failureBlock
                                 finish:(HttpConnectFinishBlock)finishBlock;
 */

- (AFHTTPRequestOperation *)doHTTPPost:(HttpReq*)req
                                 start:(HttpConnectStartBlock)startBlock
                               success:(HttpConnectSuccessBlock)successBlock
                               failure:(HttpConnectFailureBlock)failureBlock
                                finish:(HttpConnectFinishBlock)finishBlock;



- (void)saveCookieWithUrl:(NSURL *)url;

- (void)saveUserIdCookie;

- (void)cancelAllHTTPOperations;

- (void)cancelAllHTTPOperationsWithMethod:(NSString *)method path:(NSString *)path;

@end
