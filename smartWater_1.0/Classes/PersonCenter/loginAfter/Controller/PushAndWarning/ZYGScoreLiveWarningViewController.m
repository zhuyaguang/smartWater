//
//  ZYGScoreLiveWarningViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGScoreLiveWarningViewController.h"
#import "ZYGSettingLabelItem.h"
@interface ZYGScoreLiveWarningViewController ()

@end

@implementation ZYGScoreLiveWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYGSettingItem *item1 =[ZYGSettingSwitchItem itemWithIcon:@"nil" title:@"提醒我关注的比赛" ];
    ZYGSettingGroup *group1 = [[ZYGSettingGroup alloc]init];
    group1.headerTitle=@"xxxxxxxxxx";
    group1.items = @[item1];
    
    [self.cellData addObject:group1];
    
    
    ZYGSettingItem *item2 =[ZYGSettingLabelItem itemWithIcon:@"nil" title:@"起始时间" ];
    ZYGSettingGroup *group2 = [[ZYGSettingGroup alloc]init];
    group2.headerTitle=@"xxxxxxxxxx";
    group2.items = @[item2];
    
    [self.cellData addObject:group2];
    
    ZYGSettingItem *item3 =[ZYGSettingLabelItem itemWithIcon:@"nil" title:@"结束时间" ];
    ZYGSettingGroup *group3 = [[ZYGSettingGroup alloc]init];
    group3.items = @[item3];
    
    [self.cellData addObject:group3];
}



@end
