//
//  AppBarButton.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/4.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "AppBarButton.h"

@implementation AppBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%s",__func__);
    self.itemImageView.frame = CGRectMake(0, 0, self.itemImageView.image.size.width,self.itemImageView.image.size.height);
    self.itemImageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.itemImageView.bounds)+5);
    self.ItemLabel.frame = CGRectMake(0, CGRectGetMaxY(self.itemImageView.frame)+3, CGRectGetWidth(self.bounds), 18);
}

#pragma mark --懒加载
-(UILabel *)ItemLabel{
    if(!_ItemLabel){
        _ItemLabel = [UILabel new];
//        _ItemLabel.backgroundColor = [UIColor greenColor];
        _ItemLabel.textAlignment = NSTextAlignmentCenter;
        _ItemLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_ItemLabel];
    }
    return _ItemLabel;
}

-(UIImageView *)itemImageView{
    if(!_itemImageView){
        _itemImageView = [UIImageView new];
//        _itemImageView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_itemImageView];
    }
    return _itemImageView;
}

@end
