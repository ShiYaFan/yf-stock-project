//
//  AppTabbarView.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/4.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "AppTabbarView.h"
#import "AppBarButton.h"
#import "AppTabbarModel.h"

static const int BUTTON_TAG_DEFAULT =1000; //button默认起始值

@interface AppTabbarView()
{
    AppBarButton* _previousBtn;
}
@end
@implementation AppTabbarView
#pragma mark --初始化
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
//        self.backgroundColor = [UIColor redColor];
        
        [self initDefault];
    }
    return self;
}
#pragma mark -- 初始化一些值
-(void)initDefault{
    self.isCenterButton = YES;
    self.defaultSelectedButton = 0;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    /*直接调用setLayoutSubviews
    addSubview的时候。
    当view的frame发生改变的时候。
    滑动UIScrollView的时候*/
    NSLog(@"%s",__func__);
}
#pragma mark --懒加载
-(AppBarButton *)tabCenterPlus{
    if (!_tabCenterPlus) {
        _tabCenterPlus = [AppBarButton new];
        _tabCenterPlus.itemImageView.image = [UIImage imageNamed:@"tab_center_plus"];
//        _tabCenterPlus.backgroundColor = [UIColor whiteColor];
        _tabCenterPlus.ItemLabel.text = @"创建";
        _tabCenterPlus.ItemLabel.textColor = self.titleNormalColor;
        _tabCenterPlus.frame = CGRectMake(VIEW_WIDTH(self)/5 * 2, -BAR_HEIGHT/2,VIEW_WIDTH(self)/5, BAR_HEIGHT*3/2);

        [_tabCenterPlus addTarget:self action:@selector(centerAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tabCenterPlus;
}
#pragma mark --setter方法
-(void)setDefaultSelectedButton:(NSInteger)defaultSelectedButton{
    defaultSelectedButton = defaultSelectedButton;
    NSLog(@"调用了setter方法");
}
-(void)setTabbarModelArray:(NSArray *)tabbarModelArray{
    tabbarModelArray = tabbarModelArray;
    for (int i =0; i < tabbarModelArray.count; i++) {
        AppTabbarModel *obj = tabbarModelArray[i];
        [self createButtonWithNormalName:obj.normalImageString addSelectedName:obj.selectedImageString andTitle:obj.tabbarTitle andIndex:i];
    }
    
    AppBarButton *button = self.subviews[self.defaultSelectedButton];
    [self barButtonAction:button];
   //添加tabbar 横线
    UIView *lineView = [UIView productLineViewWithWidth:CGRectMake(0, 0, VIEW_WIDTH(self), 1)];
    [self addSubview:lineView];
    //添加中间加号按钮
     [self addSubview:self.tabCenterPlus];
}
#pragma mark --创建button工厂
-(void)createButtonWithNormalName:(NSString *)normal addSelectedName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index{
    AppBarButton *barButton = [AppBarButton new];
    NSInteger num = 4;
    CGFloat b_width,b_height;
    CGRect frame;
    if(self.isCenterButton){
        num = 5;
        b_width = SCREEN_WIDTH /num;
        b_height = BAR_HEIGHT;
        CGFloat x;
        if(index >= 2){
            x = (index + 1) * b_width;
        }else{
            x = index * b_width;
        }
          frame = CGRectMake(x, 0, b_width, b_height);
    }else{
        b_width = SCREEN_WIDTH / num;
        b_height = BAR_HEIGHT;
        frame = CGRectMake(index * b_width, 0, b_width, b_height);
    }
    barButton.frame = frame;
    barButton.itemImageView.image = [UIImage imageNamed:normal];
    barButton.itemImageView.highlightedImage = [UIImage imageNamed:selected];
    barButton.ItemLabel.text = title;
    barButton.ItemLabel.textColor = self.titleNormalColor;
    barButton.ItemLabel.highlightedTextColor = self.titleSelectedColor;
    barButton.tag = index + BUTTON_TAG_DEFAULT;
    [barButton addTarget:self action:@selector(barButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:barButton];
}
#pragma mark --切换按钮的点击事件
-(void)centerAction{
    if([self.appTabbarDelegate respondsToSelector:@selector(appTabbarView:from:to:)]){
        NSInteger from;
        if (!_previousBtn) {
            from = 0;
        }else{
            from =_previousBtn.tag-BUTTON_TAG_DEFAULT;
        }
          NSLog(@"%ld",from);
        [self.appTabbarDelegate appTabbarView:self from:from to:4];
    }
}
-(void)barButtonAction:(AppBarButton *)sender{
    sender.enabled = NO;
    _previousBtn.itemImageView.highlighted = NO;
    _previousBtn.ItemLabel.highlighted = NO;
    NSInteger selected = sender.tag - BUTTON_TAG_DEFAULT;
    NSLog(@"----sender---");
    if(_previousBtn != sender){
        _previousBtn.enabled = YES;
        sender.itemImageView.highlighted = YES;
        sender.ItemLabel.highlighted = YES;
    }
    if([self.appTabbarDelegate respondsToSelector:@selector(appTabbarView:from:to:)]){
        [self.appTabbarDelegate appTabbarView:self from:_previousBtn.tag-BUTTON_TAG_DEFAULT to:selected];
    }
     _previousBtn = sender;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        // 转换坐标系
        CGPoint newPoint = [self.tabCenterPlus convertPoint:point fromView:self];
        // 判断触摸点是否在button上
        if (CGRectContainsPoint(self.tabCenterPlus.bounds, newPoint)) {
            view = self.tabCenterPlus;
        }
    }
    return view;
}
@end
