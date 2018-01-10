//
//  appNetwork.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/4.
//  Copyright © 2018年 shiyafan. All rights reserved.
//

#import "appNetwork.h"

#define BASEURL @"https://hpage.celuechaogu.com"

@implementation appNetwork
+(instancetype)shareAppNetwork{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:nil];
    });
    return instance;
}
-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 5;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}
-(void)requestWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters method:(NSString *)method callBack:(void (^)(id))callback{
    NSString *url = [NSString stringWithFormat:@"%@%@",BASEURL,URLString];
    //加密参数
    if([method isEqualToString:@"GET"]){
        [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@---%@",url,parameters);
            NSLog(@"%@",responseObject);
            callback(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@---请求失败---%@",url,error);
        }];
    }
}
//处理参数加密
@end
