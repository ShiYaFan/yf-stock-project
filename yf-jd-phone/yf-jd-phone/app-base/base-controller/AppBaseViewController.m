//
//  AppBaseViewController.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/3.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "AppBaseViewController.h"

@interface AppBaseViewController ()

@end

@implementation AppBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f7f9"];
   
}
-(void)dealloc{
     NSLog(@"\n*******成功销毁********\n %@ \n%s \n**************\n",self.class,__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
