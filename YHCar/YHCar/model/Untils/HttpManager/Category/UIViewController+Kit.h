//
//  UIViewController+Kit.h
//  NeiHang
//
//  Created by 虾丸 on 15/9/26.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpClient.h"

@interface UIViewController (Kit)<UIGestureRecognizerDelegate>

@property (nonatomic, strong) HttpClient *HTTPClient;


+ (UIViewController *)ViewControllerWithStoryName:(NSString *)storyName
                                           vcName:(NSString *)vcName;

/**
 *  配置页面基本信息(背景色, 返回按钮)
 */
- (void)viewDefaults;

/**
 *  默认返回处理方法
 */
- (void)backAction;


- (UIViewController *)ViewControllerWithStoryName:(NSString *)storyName
                                           vcName:(NSString *)vcName;


- (void)doPOSTConnect:(HttpReq *)req
                start:(HttpConnectStartBlock)startBlock
              success:(HttpConnectSuccessBlock)successBlock
              failure:(HttpConnectFailureBlock)failureBlock
               finish:(HttpConnectFinishBlock)finishBlock;

/**
 *  从navigationController的viewControllers中移除当前viewcontroller;
 */
-(void)removeSelfWithNavViewControllers;

@end
