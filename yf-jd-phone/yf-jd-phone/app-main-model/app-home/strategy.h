//
//  strategy.h
//  yf-jd-phone
//
//  Created by yafan on 2018/1/9.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface strategy : NSObject
@property (nonatomic, strong) NSString *creator;
@property (nonatomic, assign) NSInteger followNum;
@property (nonatomic, assign) NSInteger handyScore;
@property (nonatomic, strong) NSString *monthReturn;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *permiId;
@property (nonatomic, assign) NSInteger returnScore;
@property (nonatomic, assign) NSInteger safeScore;
@property (nonatomic, assign) NSInteger sid;
@property (nonatomic, assign) NSInteger stableScore;

@end
