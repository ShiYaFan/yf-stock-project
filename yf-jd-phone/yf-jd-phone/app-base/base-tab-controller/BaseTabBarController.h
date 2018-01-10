//
//  BaseTabBarViewController.h
//  yf-jd-phone
//
//  Created by yafan on 2018/1/3.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppTabbarView.h"
@interface BaseTabBarController : UITabBarController<AppTabbarViewDelegate>
@property (nonatomic, strong) AppTabbarView *myTabbarView;
@end
