//
//  BaseNavigationController.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/3.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    
}
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated{
    id controller = [super popViewControllerAnimated:animated];
    return controller;
}
@end
