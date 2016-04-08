//
//  UIViewController+Kit.m
//  NeiHang
//
//  Created by 虾丸 on 15/9/26.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "UIViewController+Kit.h"
#import "UIBarButtonItemAdditions.h"
#import "UIColor+Kit.h"

static void *VcHTTPClient_;

@implementation UIViewController (Kit)

- (void)viewDefaults {
    
    [self.view setBackgroundColor:[UIColor colorWithHex:@"f4f4f4"]];
    
    if (self.navigationController) {
        if ([self.navigationController.viewControllers count] > 1) {
            [self addBackBarButton:YES];
        } else {
            [self addBackBarButton:NO];
        }
    }
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
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


- (void)addBackBarButton:(BOOL)add {
    [self.navigationItem setHidesBackButton:YES];
    if (add) {

        self.navigationItem.leftBarButtonItems = [UIBarButtonItem backBarButtonItemsWithTarget:self selector:@selector(backAction)];
        
    } else {
        self.navigationItem.leftBarButtonItems = nil;
    }
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}


+ (UIViewController *)ViewControllerWithStoryName:(NSString *)storyName
                                           vcName:(NSString *)vcName{
    UIStoryboard* story;
    
    if([storyName length] == 0)
        return nil;
    else
        story = [UIStoryboard storyboardWithName:storyName bundle:nil];
    
    UIViewController* vc;
    
    if([vcName length] == 0)
        vc = [story instantiateInitialViewController];
    else
        vc = [story instantiateViewControllerWithIdentifier:vcName];
    
    return vc;
}

- (UIViewController *)ViewControllerWithStoryName:(NSString *)storyName vcName:(NSString *)vcName{
    
    UIStoryboard* story;
    
    if([storyName length] == 0)
        story = self.storyboard;
    else
        story = [UIStoryboard storyboardWithName:storyName bundle:nil];
    
    UIViewController* vc;
    
    if([vcName length] == 0)
        vc = [story instantiateInitialViewController];
    else
        vc = [story instantiateViewControllerWithIdentifier:vcName];
    
    return vc;
    
}

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

-(void)removeSelfWithNavViewControllers{
    NSMutableArray<UIViewController *> *arr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    [arr removeObject:self];
    [self.navigationController setViewControllers:arr];
}


@end
