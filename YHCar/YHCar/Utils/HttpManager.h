//
//  HttpManager.h
//  YHCar
//
//  Created by 崔小雨 on 16/4/9.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpReq.h"
#import "AFNetworking.h"

typedef void (^HttpConnectStartBlock)(HttpReq* req);
typedef void (^HttpConnectFinishBlock)(HttpReq* req, BOOL success);
typedef void (^HttpConnectSuccessBlock)(NSURLSessionDataTask *task,id responseObject);
typedef void (^HttpConnectFailureBlock)(NSURLSessionDataTask *task, NSError *error);


@interface HttpManager : AFHTTPRequestOperationManager
-(AFHTTPSessionManager *)doHTTPPost:(HttpReq*)req
start:(HttpConnectStartBlock)startBlock
success:(HttpConnectSuccessBlock)successBlock
failure:(HttpConnectFailureBlock)failureBlock
finish:(HttpConnectFinishBlock)finishBlock;


@end
