//
//  ItemModel.h
//  yf-jd-phone
//
//  Created by yafan on 2018/1/9.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *webUrl;
@end
