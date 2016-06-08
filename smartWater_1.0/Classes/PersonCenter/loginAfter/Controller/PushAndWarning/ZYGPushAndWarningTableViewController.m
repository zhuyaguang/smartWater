//
//  ZYGSettingTableViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGPushAndWarningTableViewController.h"
#import "ZYGSettingItem.h"
#import "ZYGSettingSwitchItem.h"
#import "ZYGSettingArrowItem.h"
#import "ZYGSettingCell.h"
//#import "ViewController.h"
#import "MBProgressHUD+Extend.h"
#import "ZYGAwakeAndWarningPushViewController.h"
#import "ZYGAwardAnimationViewController.h"
#import "ZYGScoreLiveWarningViewController.h"

@implementation ZYGPushAndWarningTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ZYGSettingItem *item1 = [ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"推送和提醒" vcClass];
    ZYGSettingItem *item1 =[ZYGSettingArrowItem itemWithIcon:@"nil" title:@"开奖号码推送" vcClass:[ZYGAwakeAndWarningPushViewController class]];
    ZYGSettingItem *item2 =[ZYGSettingArrowItem itemWithIcon:@"nil" title:@"中奖动画" vcClass:[ZYGAwardAnimationViewController class]];
    ZYGSettingItem *item3 =[ZYGSettingArrowItem itemWithIcon:@"nil" title:@"比分直播提醒" vcClass:[ZYGScoreLiveWarningViewController class]];
    ZYGSettingItem *item4 =[ZYGSettingArrowItem itemWithIcon:@"nil" title:@"购彩定时提醒" vcClass:[ZYGScoreLiveWarningViewController class]];
    
    ZYGSettingGroup *group1 =[[ZYGSettingGroup alloc]init];
    group1.items = @[item1,item2,item3,item4];
      // NSArray *group1 = @[item1,item2,item3,item4];
    [self.cellData addObject:group1];
    
 
   
    
    
}




@end
