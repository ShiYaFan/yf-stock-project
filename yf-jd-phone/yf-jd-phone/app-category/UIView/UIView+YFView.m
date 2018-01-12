//
//  UIView+YFView.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/12.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "UIView+YFView.h"

@implementation UIView (YFView)
+(UIView *)productLineViewWithWidth:(CGRect)frame{
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor colorWithHexString:@"#e5eaec"];
    return view;
}
@end
