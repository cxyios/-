//
//  UITableView+NHKit.h
//  NeiHang
//
//  Created by 虾丸 on 15/10/10.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NHRefresh.h"

@interface UITableView (NHKit)

/**
 *  根据当前数据量计算下一页页码数(默认每页数据量为默认数据量)
 *
 *  @param dataCount 数据量
 *
 *  @return 下一页页码数
 */
- (NSInteger)nextPageWithDataCount:(NSInteger)dataCount;


/**
 *  根据当前数据量计算下一页页码数(默认每页数据量为默认数据量)
 *
 *  @param dataCount 数据量
 *  @param size 每页的数据量
 *
 *  @return 下一页页码数
 */
- (NSInteger)nextPageWithDataCount:(NSInteger)dataCount PageSize:(NSInteger)size;

@end
