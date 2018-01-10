//
//  BannerModel.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/9.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [BannerModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"des" : @"description"};
        }];
    }
    return self;
}
@end
