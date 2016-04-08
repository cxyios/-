//
//  UITableView+NHKit.m
//  NeiHang
//
//  Created by 虾丸 on 15/10/10.
//  Copyright © 2015年 TaiDu. All rights reserved.
//

#import "UITableView+NHKit.h"

@implementation UITableView (NHKit)

- (NSInteger)nextPageWithDataCount:(NSInteger)dataCount{
    
    return [self nextPageWithDataCount:dataCount PageSize:NHPageSize];
    
}

- (NSInteger)nextPageWithDataCount:(NSInteger)dataCount PageSize:(NSInteger)size{
    NSInteger pindex = dataCount /size;
    
    //如果有余数, 则在上方除10的时候把余数丢掉.下方进行判断, 如果有余数, 则+1处理
    if (dataCount % size) {
        pindex += 1;
    }
    return pindex + 1;
}

@end
