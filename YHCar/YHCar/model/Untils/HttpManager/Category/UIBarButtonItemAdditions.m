//
//  UIBarButtonItemAdditions.m
//  CityGuide
//
//  Created by COLD FRONT on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIBarButtonItemAdditions.h"

@implementation UIBarButtonItem(Additions)

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target selector:(SEL)selector {
//    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_left_arrow"] style:UIBarButtonItemStyleBordered target:target action:selector];
    
    UIBarButtonItem *item = [self barButtonItemWithImage:[UIImage imageNamed:@"icon_left_arrow"] target:target selector:selector];
    
    return item;
}

+ (NSArray<UIBarButtonItem *> *)clearItemWithTarget:(id)target
                                           selector:(SEL)selector{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:CGRectMake(0, 0, 50, 44)];
    
    [button setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    UIBarButtonItem *NegativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    NegativeSpacer.width = - 14;
    
    return [NSArray arrayWithObjects:NegativeSpacer,item,nil];;
}

+ (NSArray *)backBarButtonItemsWithTarget:(id)target selector:(SEL)selector {
    
    UIBarButtonItem *backItem = [self backBarButtonItemWithTarget:target selector:selector];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -16;
    
    return @[negativeSpacer,backItem];
}

+ (UIBarButtonItem *)rectBarButtonItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector{
    return [self barButtonItemWithTitle:title
                                  image:nil
                         highlightImage:nil
                                 target:target
                               selector:selector];
}

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                   selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)fixedButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                   selector:(SEL)selector
{
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, YNBarItemWidth, 44.0f);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, YNBarItemWidth, 44.0f)];
    [view addSubview:button];
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
    [imgView sizeToFit];
    CGRect imgRect = imgView.frame;
    imgRect.origin.x = (view.width - imgRect.size.width);
    imgRect.origin.y = (view.height - imgRect.size.height) / 2;
    [imgView setFrame:imgRect];
    [view addSubview:imgView];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

/**
 *  创建 搜索item
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 */
+ (UIBarButtonItem *)searchItemWithTarget:(id)target
                                 Selector:(SEL)selector{

//     UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_search_small"] style:UIBarButtonItemStyleBordered target:target action:selector];
    UIBarButtonItem *item = [UIBarButtonItem fixedButtonItemWithImage:[UIImage imageNamed:@"icon_search_small"] target:target selector:selector];
    
    return item;
}

/**
 *  创建  添加item
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 */
+ (UIBarButtonItem *)addItemWithTarget:(id)target
                              Selector:(SEL)selector{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_add"] style:UIBarButtonItemStyleBordered target:target action:selector];
    
    return item;
}


+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                             highlightImage:(UIImage *)highlightImage
                                     target:(id)target
                                   selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               disableImage:(UIImage *)disableImage
                                     target:(id)target
                                   selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    button.titleLabel.shadowOffset = CGSizeMake(0, -0.2);
    button.titleLabel.shadowColor = [[UIColor alloc] initWithWhite:0 alpha:0.2f];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:disableImage forState:UIControlStateDisabled];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


/**
 *  创建 完成按钮
 */
+ (UIBarButtonItem *)finishItemWithTarget:(id)target
                                 Selector:(SEL)selector{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_determine"] style:UIBarButtonItemStylePlain target:target action:selector];
    return item;
    
}

+ (UIBarButtonItem *)customerServiceItemWithTarget:(id)target
                                          Selector:(SEL)selector{
    
    UIView *talk = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 2, 50, 12)];
    lbl.text = @"联系客服";
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.textColor = NHBaseBlueColor;
    [talk addSubview:lbl];
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(50, -2, 20, 20)];
    iv.image = [UIImage imageNamed:@"icon_customer_service"];
    [talk addSubview:iv];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, -10, 80, 30)];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [talk addSubview:btn];
    UIBarButtonItem *right_btn = [[UIBarButtonItem alloc]initWithCustomView:talk];

    return right_btn;
}

@end
