//
//  ZYGAwakeAndWarningPushViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGAwakeAndWarningPushViewController.h"
#import "ZYGSettingGroup.h"
@interface ZYGAwakeAndWarningPushViewController ()

@end

@implementation ZYGAwakeAndWarningPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZYGSettingItem *item1 =[ZYGSettingSwitchItem itemWithIcon:@"nil" title:@"双色球" ];
    
    ZYGSettingItem *item2 = [[ZYGSettingSwitchItem alloc]initWithIcon:@"nil" title:@"大乐透"];
    
    ZYGSettingGroup *group1 = [[ZYGSettingGroup alloc]init];
    group1.headerTitle=@"xxxxxxxxxx";
    group1.items = @[item1,item2];

   // NSArray *group1 = @[item1,item2];
    
    [self.cellData addObject:group1];
}



@end
