//
//  UIView+NHKit.h
//  NeiHang
//
//  Created by 虾丸 on 15/10/15.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NHKit)

- (void)doPOSTConnect:(HttpReq *)req
                start:(HttpConnectStartBlock)startBlock
              success:(HttpConnectSuccessBlock)successBlock
              failure:(HttpConnectFailureBlock)failureBlock
               finish:(HttpConnectFinishBlock)finishBlock;

@end
