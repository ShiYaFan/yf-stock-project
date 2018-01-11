//
//  AppHomeViewController.m
//  yf-jd-phone
//
//  Created by yafan on 2018/1/3.
//  Copyright © 2018年 shiyafan. All rights reserved.
//     pod search MJRefresh   pod install

#import "AppHomeViewController.h"
#import "SDCycleScrollView.h"
#import "appNetwork.h"
#import "strategy.h"
#import "ItemModel.h"
#import "BannerModel.h"
#import "ItemButton.h"
static const NSInteger BANNER_HEIGHT = 120;
static const NSInteger HOME_INSTANCE = 10;
@interface AppHomeViewController()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) NSMutableArray *picArray;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) UIScrollView *bcgScrollView;
@property (nonatomic, strong) ItemButton *showItemButton;

@end
@implementation AppHomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"策略炒股通";
    //布局UI
    [self.view addSubview:self.bcgScrollView];
    self.bcgScrollView.contentSize = CGSizeMake(VIEW_WIDTH(self.view), VIEW_HEIGHT(self.view)+100);
   
    [self.bcgScrollView addSubview:self.cycleScrollView];
    [self.bcgScrollView addSubview:self.showItemButton];
    //请求网络
    [self appHomeRequestData];

}

-(void)appHomeRequestData{
    //策略列表数据请求
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"servlet/recommend" forKey:@"url"];
    [dic setObject:@"v2.4" forKey:@"version"];
    __weak typeof(self) weakSelf = self;
    [[appNetwork shareAppNetwork] requestWithURLString:@"/async/getIndexContent" parameters:dic method:@"GET" callBack:^(id resposeObject) {
        if ([resposeObject[@"code"] isEqualToString:@"OK"]) {
            for( id dit in resposeObject[@"data"][@"recommendList"]){
                strategy *_strategy = [strategy mj_objectWithKeyValues:dit];
                [weakSelf.listArray addObject:_strategy];
            }
        }
    }];
    //轮播图
    [[appNetwork shareAppNetwork] requestWithURLString:@"/async/bannerData" parameters:nil method:@"GET" callBack:^(id resposeObject) {
        if ([resposeObject[@"code"] isEqualToString:@"OK"]) {
            NSMutableArray *urlArray = [NSMutableArray new];
            for(id dit in resposeObject[@"data"][@"bannerList"]){
                BannerModel *banner = [BannerModel mj_objectWithKeyValues:dit];
                [weakSelf.picArray addObject:banner];
                [urlArray addObject:banner.picUrl];
            }
              weakSelf.cycleScrollView.imageURLStringsGroup = urlArray;
        }
    }];
    //请求button-show
    [[appNetwork shareAppNetwork] requestWithURLString:@"/source_file/homeConfiguration.json" parameters:nil method:@"GET" callBack:^(id resposeObject) {
        if ([resposeObject[@"code"] isEqualToString:@"OK"]) {
            self.itemArray = [NSMutableArray new];
            for( id dit in resposeObject[@"listData"]){
                ItemModel *_itemModel = [ItemModel mj_objectWithKeyValues:dit];
                [weakSelf.itemArray addObject:_itemModel];
            }
            [weakSelf.showItemButton createButtonWithArray:weakSelf.itemArray];
        }
    }];
}
#pragma mark --cycleScrollDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%@",self.picArray[index]);
}
#pragma mark --懒加载
-(NSMutableArray *)picArray{
    if (!_picArray) {
        _picArray = [NSMutableArray new];
    }
    return _picArray;
}
-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray new];
    }
    return _listArray;
}
-(SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, VIEW_WIDTH(self.view), BANNER_HEIGHT) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    }
    return _cycleScrollView;
}
-(UIScrollView *)bcgScrollView{
    if (!_bcgScrollView) {
        _bcgScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    }
    return _bcgScrollView;
}
-(ItemButton *)showItemButton{
    if (!_showItemButton) {
        _showItemButton = [[ItemButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cycleScrollView.frame)+HOME_INSTANCE, VIEW_WIDTH(self.view),  VIEW_WIDTH(self.view)/2)];
        _showItemButton.backgroundColor = [UIColor whiteColor];
    }
    return _showItemButton;
}
@end
