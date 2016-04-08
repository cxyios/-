//
//  UIView+Additions.h
//  NeiTao
//
//  Created by truestyle on 14/12/10.
//  Copyright (c) 2014年 NeiTao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NHBaseViewController.h"
#import "NHBaseTableViewController.h"

@interface UIView (Additions)

- (UIViewController *)viewController;

- (NHBaseViewController *)NHViewController;

- (NHBaseTableViewController *)NHTableViewController;

@end
