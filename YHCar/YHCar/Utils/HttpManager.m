//
//  HttpManager.m
//  YHCar
//
//  Created by 崔小雨 on 16/4/9.
//  Copyright © 2016年 崔小雨. All rights reserved.
//

#import "HttpManager.h"
static NSTimeInterval timeoutInterval = 180;

@implementation HttpManager
- (AFHTTPSessionManager *)doHTTPPost:(HttpReq *)req
                                 start:(HttpConnectStartBlock)startBlock
                               success:(HttpConnectSuccessBlock)successBlock
                               failure:(HttpConnectFailureBlock)failureBlock
                                finish:(HttpConnectFinishBlock)finishBlock
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:req.api parameters:req.params success:^(NSURLSessionDataTask *task, id responseObject) {
        if(successBlock){
            successBlock(task,responseObject);
        }
        NSLog(@"成功");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
        if(failureBlock){
            failureBlock(task,error);
        }
    }];
    
    
   
    if (startBlock) {
        startBlock(req);
    }
    return session;
}

@end
