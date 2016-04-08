//
//  UIBarButtonItemAdditions.h
//  CityGuide
//
//  Created by COLD FRONT on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem(Additions)


#pragma mark - Base Item

/**
 *  根据图片大小生成对应大小的barItem
 *
 *  @param image    图片
 *  @param target   关联对象
 *  @param selector 关联方法
 *
 *  @return item
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                     target:(id)target
                                   selector:(SEL)selector;


/**
 *  生成固定大小(50*44)的barItem
 *
 *  @param image    图片
 *  @param target   关联对象
 *  @param selector 关联方法
 *
 *  @return item
 */
+ (UIBarButtonItem *)fixedButtonItemWithImage:(UIImage *)image
                                       target:(id)target
                                     selector:(SEL)selector;


#pragma mark - Application Item


/**
 *  创建一个返回item
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 *
 *  @return 返回item
 */
+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target
                                        selector:(SEL)selector;

/**
 *  创建一个包含调整过间距的itemArray (item / space)
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 *
 *  @return 返回 itemArray (item / space)
 */
+ (NSArray *)backBarButtonItemsWithTarget:(id)target
                                 selector:(SEL)selector;

/**
 *  创建 完成item
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 */
+ (UIBarButtonItem *)finishItemWithTarget:(id)target
                                 Selector:(SEL)selector;


/**
 *  创建 搜索item
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 */
+ (UIBarButtonItem *)searchItemWithTarget:(id)target
                                 Selector:(SEL)selector;

/**
 *  创建  添加item
 *
 *  @param target   关联对象
 *  @param selector 关联方法
 */
+ (UIBarButtonItem *)addItemWithTarget:(id)target
                              Selector:(SEL)selector;


/**
 *  联系客服
 */
+ (UIBarButtonItem *)customerServiceItemWithTarget:(id)target
                                          Selector:(SEL)selector;




#pragma mark - Rubbish Item

+ (NSArray<UIBarButtonItem *> *)clearItemWithTarget:(id)target
                                           selector:(SEL)selector;

+ (UIBarButtonItem *)rectBarButtonItemWithTitle:(NSString *)title
                                         target:(id)target
                                       selector:(SEL)selector;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                             highlightImage:(UIImage *)highlightImage
                                     target:(id)target
                                   selector:(SEL)selector;
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                               disableImage:(UIImage *)disableImage
                                     target:(id)target
                                   selector:(SEL)selector;


@end
