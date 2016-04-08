//
//  UIView+NHKit.m
//  NeiHang
//
//  Created by 虾丸 on 15/10/15.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "UIView+NHKit.h"

static void *VcHTTPClient_;

@implementation UIView (NHKit)

- (void)doPOSTConnect:(HttpReq *)req
                start:(HttpConnectStartBlock)startBlock
              success:(HttpConnectSuccessBlock)successBlock
              failure:(HttpConnectFailureBlock)failureBlock
               finish:(HttpConnectFinishBlock)finishBlock
{
    [self.HTTPClient doHTTPPost:req
                          start:^(HttpReq *req) {
                              if (req.loadingMsg) {
                              }
                              if (startBlock) {
                                  startBlock(req);
                              }
                          }
                        success:^(HttpReq *req, HttpResp *resp) {
                            if (successBlock) {
                                successBlock(req,resp);
                            }
                        }
                        failure:^(HttpReq *req, NSError *error) {
                            
                            if (error.code == -1001) {
                                [AFMInfoBanner showAndHideWithText:ErrorMsg_Server style:AFMInfoBannerStyleError];
                            }else{
                                [AFMInfoBanner showAndHideWithText:ErrorMsg_Network style:AFMInfoBannerStyleError];
                            }
                            
                            if (failureBlock) {
                                failureBlock(req,error);
                            }
                        }
                         finish:^(HttpReq *req, BOOL success) {
                             if (finishBlock) {
                                 finishBlock(req,success);
                             }
                         }];
}

- (void)setHTTPClient:(HttpClient *)HTTPClient {
    objc_setAssociatedObject(self, &VcHTTPClient_, HTTPClient, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HttpClient *)HTTPClient {
    if (!VcHTTPClient_) {
        self.HTTPClient = [[HttpClient alloc] init];
    }
    return objc_getAssociatedObject(self, &VcHTTPClient_);
}

@end
