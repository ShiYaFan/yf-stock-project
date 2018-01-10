//
//  AppTabbarView.h
//  yf-jd-phone
//
//  Created by yafan on 2018/1/4.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppTabbarView;
@protocol AppTabbarViewDelegate<NSObject>
@optional
-(void)appTabbarView:(AppTabbarView *)appTabbarView from:(NSInteger)from to:(NSInteger)to;
@end
@interface AppTabbarView : UIView
@property (nonatomic, weak) id<AppTabbarViewDelegate>appTabbarDelegate;
@property (nonatomic, assign) Boolean isCenterButton; //中间button是否存在
@property (nonatomic, strong) UIColor *titleNormalColor; //未被选中标题颜色
@property (nonatomic, strong) UIColor *titleSelectedColor; //选中状态标题颜色
@property (nonatomic, assign) NSInteger defaultSelectedButton; //默认选中第几个button 必须先设置了defaultSelectedButton属性才能生效
@property (nonatomic, strong) NSArray *tabbarModelArray; //多少个button
@end
