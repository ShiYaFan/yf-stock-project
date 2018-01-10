//
//  appNetwork.h
//  yf-jd-phone
//
//  Created by yafan on 2018/1/4.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface appNetwork : AFHTTPSessionManager
+(instancetype)shareAppNetwork;
-(void)requestWithURLString: (NSString *)URLString parameters:(NSDictionary *)parameters method:(NSString *)method callBack:(void(^)(id resposeObject))callback;
@end
