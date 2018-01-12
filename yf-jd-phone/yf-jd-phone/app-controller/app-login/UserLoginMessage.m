//
//  UserLoginMessage.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/12.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "UserLoginMessage.h"

@implementation UserLoginMessage
+(instancetype)shareUserLoginMessage{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

@end
