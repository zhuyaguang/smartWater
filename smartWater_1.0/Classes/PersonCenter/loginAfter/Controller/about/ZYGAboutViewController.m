//
//  ZYGAboutViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/26.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGAboutViewController.h"

@interface ZYGAboutViewController ()

@end

@implementation ZYGAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZYGSettingItem *item1 =[ZYGSettingArrowItem itemWithIcon:@"nil" title:@"评分支持"];
    
    item1.operation= ^
    {
        NSLog(@"去App Store 评分");
    };
    ZYGSettingItem *item2 =[ZYGSettingArrowItem itemWithIcon:@"nil" title:@"客户电话"];
    item2.subTitle = @"10086";
    item2.operation = ^ {
        NSURL *url = [NSURL URLWithString:@"tel://10010"];
        [[UIApplication  sharedApplication] openURL:url];
    };
    
    ZYGSettingGroup *group1 =[[ZYGSettingGroup alloc]init];
    group1.items = @[item1,item2];
    // NSArray *group1 = @[item1,item2,item3,item4];
    [self.cellData addObject:group1];

}

@end
