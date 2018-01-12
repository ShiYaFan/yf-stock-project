//
//  UserLoginMessage.h
//  yf-jd-phone
//
//  Created by yafan on 2018/1/12.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLoginMessage : NSObject
+(instancetype)shareUserLoginMessage;

@property (nonatomic, strong) NSString *user_name;
@property (nonatomic, strong) NSString *user_header_img;
@property (nonatomic, strong) NSString *user_signature;
@property (nonatomic, assign) BOOL isLogin;

@end
