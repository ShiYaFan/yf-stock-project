//
//  BaseTabBarViewController.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/3.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "BaseTabBarController.h"
#import "AppHomeViewController.h"
#import "AppInterfaceViewController.h"
#import "AppSubscibeViewController.h"
#import "AppMineViewController.h"
#import "AppTabbarModel.h"
#import "AppLoginViewController.h"
@interface BaseTabBarController()

@property (nonatomic, strong) AppHomeViewController *homeController;
@property (nonatomic, strong) AppInterfaceViewController *interfaceController;
@property (nonatomic, strong) AppSubscibeViewController *subscribeController;
@property (nonatomic, strong) AppMineViewController *mineController;

@end
@implementation BaseTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.homeController = [AppHomeViewController new];
    self.interfaceController = [AppInterfaceViewController new];
    self.subscribeController = [AppSubscibeViewController new];
    self.mineController = [AppMineViewController new];
    
    BaseNavigationController *v1 = [[BaseNavigationController alloc]initWithRootViewController:self.homeController];
    BaseNavigationController *v2 = [[BaseNavigationController alloc]initWithRootViewController:self.interfaceController];
    BaseNavigationController *v3 = [[BaseNavigationController alloc]initWithRootViewController:self.subscribeController];
    BaseNavigationController *v4 = [[BaseNavigationController alloc]initWithRootViewController:self.mineController];
    self.viewControllers = @[v1,v2,v3,v4];
    self.selectedIndex = 0;
    
    NSLog(@"tabBar-->%@",NSStringFromCGRect(self.tabBar.frame));
    NSLog(@"myTabbarView-->%@",NSStringFromCGRect(self.myTabbarView.frame));
    [self.tabBar addSubview:self.myTabbarView];
    
    
}

#pragma mark -myTabbarView  --get
-(AppTabbarView *) myTabbarView{
    if(!_myTabbarView){
        _myTabbarView = [[AppTabbarView alloc]initWithFrame:CGRectMake(0,0,CGRectGetWidth(self.view.bounds),BAR_HEIGHT)];
        _myTabbarView.titleNormalColor = [UIColor colorWithHexString:@"808080"];
        _myTabbarView.titleSelectedColor = [UIColor colorWithHexString:@"14a9e0"];
        _myTabbarView.appTabbarDelegate = self;
//        @[@"tab_home_select",@"tab_stage_select",@"tab_subscribe_select",@"tab_mine_select"];
        AppTabbarModel *m1 = [self createTabbarModelWithTitle:@"首页" normal:@"tab_home" selected:@"tab_home_select"];
        AppTabbarModel *m2 = [self createTabbarModelWithTitle:@"互动" normal:@"tab_stage" selected:@"tab_stage_select"];
        AppTabbarModel *m3 = [self createTabbarModelWithTitle:@"订阅" normal:@"tab_subscribe" selected:@"tab_subscribe_select"];
        AppTabbarModel *m4 = [self createTabbarModelWithTitle:@"我的" normal:@"tab_mine" selected:@"tab_mine_select"];
        NSArray *array = @[m1,m2,m3,m4];
        _myTabbarView.tabbarModelArray = array;
    }
    return _myTabbarView;
}
#pragma mark --创建model
-(AppTabbarModel *)createTabbarModelWithTitle:(NSString *)title normal:(NSString *)normal selected:(NSString *)selected{
    AppTabbarModel *model = [AppTabbarModel new];
    model.tabbarTitle = title;
    model.normalImageString = normal;
    model.selectedImageString = selected;
    return model;
}

#pragma mark --APPTabbarView的delegate实现
-(void)appTabbarView:(AppTabbarView *)appTabbarView from:(NSInteger)from to:(NSInteger)to{
    switch (to) {
        case 0:
            self.selectedIndex = 0;
            break;
        case 1:
            self.selectedIndex = 1;
            break;
        case 2:
           self.selectedIndex = 2;
            break;
        case 3:
            self.selectedIndex = 3;
            break;
        case 4:
            [self handleCenterViewPush:from];
            break;
        default:
            break;
    }
}
-(void)handleCenterViewPush:(NSInteger)from{
        self.tabBar.hidden = YES;
        switch (from) {
            case 0:
                [UserLoginMessage shareUserLoginMessage].isLogin?NULL:[self.homeController.navigationController pushViewController:[AppLoginViewController new] animated:YES];
                break;
            case 1:
                [UserLoginMessage shareUserLoginMessage].isLogin?NULL:[self.interfaceController.navigationController pushViewController:[AppLoginViewController new] animated:YES];
                break;
            case 2:
                [UserLoginMessage shareUserLoginMessage].isLogin?NULL:[self.subscribeController.navigationController pushViewController:[AppLoginViewController new] animated:YES];
                break;
            case 3:
                [UserLoginMessage shareUserLoginMessage].isLogin?NULL:[self.mineController.navigationController pushViewController:[AppLoginViewController new] animated:YES ];
                break;
            default:
                break;
        }
}

@end
