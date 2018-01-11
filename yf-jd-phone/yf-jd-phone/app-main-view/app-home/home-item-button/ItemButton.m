//
//  ItemButton.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/9.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "ItemButton.h"
#import "ItemModel.h"
#import "AppBarButton.h"

static const int BUTTON_TAG_DEFAULT =1000; //button默认起始值

@interface ItemButton()
@property (nonatomic, strong) NSArray *content_array;
@end
@implementation ItemButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)createButtonWithArray:(NSArray *)array{
    self.content_array = array;
    CGFloat btn_width = VIEW_WIDTH(self) / 4;
    CGFloat btn_height = btn_width;
   
    for (int i = 0; i < array.count; i++) {
        ItemModel *model = array[i];
        AppBarButton * bar_button = [AppBarButton new];
        CGRect bar_button_frame;
        if (i > 3) {
            bar_button_frame = CGRectMake(btn_width * (i - 4), btn_height, btn_width, btn_height);
        }else{
            bar_button_frame = CGRectMake(btn_width * i, 0, btn_width, btn_height);
        }
        bar_button.frame = bar_button_frame;
        bar_button.ItemLabel.text = model.title;
        bar_button.ItemLabel.textColor = [UIColor blackColor];
        
        [bar_button.itemImageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"home-magic"]];
        bar_button.tag = i + BUTTON_TAG_DEFAULT;
        [bar_button addTarget:self action:@selector(barButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bar_button];
    }
    
}

-(void)barButtonAction:(AppBarButton *)sender{
    NSInteger index = sender.tag - BUTTON_TAG_DEFAULT;
 
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
