//
//  NHAPI.h
//  NeiHang
//
//  Created by 虾丸 on 15/10/12.
//  Copyright © 2015年 TaiDu. All rights reserved.
//  API 记录工具
#import "UIImageView+WebCache.h"

#define NH_MAIN_URL @"http://www.youniu.in"
#define URL_COMMON  [NSString stringWithFormat:@"%@/api/",NH_MAIN_URL]


#define API_VERSION_BASE @"1.0"

#pragma mark - NATIVE API

#define API_Login @"login"  //登录

#define API_ModifyPasswd @"modifyPasswd"  //修改密码

#define API_GetStudentInfo @"getStudentInfo"  //获取学员信息

#define API_SaveQRCodeInfo @"saveQRCodeInfo"  //上传学员信息

