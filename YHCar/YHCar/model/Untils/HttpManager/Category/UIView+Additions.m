//
//  UIView+Additions.m
//  NeiTao
//
//  Created by truestyle on 14/12/10.
//  Copyright (c) 2014年 NeiTao. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView(Additions)


- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (NHBaseViewController *)NHViewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[NHBaseViewController class]]) {
            return (NHBaseViewController *)nextResponder;
        }
    }
    return nil;
}

- (NHBaseTableViewController *)NHTableViewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[NHBaseTableViewController class]]) {
            return (NHBaseTableViewController *)nextResponder;
        }
    }
    return nil;
}

@end
