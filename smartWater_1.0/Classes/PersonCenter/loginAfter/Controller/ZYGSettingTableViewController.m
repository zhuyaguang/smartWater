//
//  ZYGSettingTableViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGSettingTableViewController.h"
#import "ZYGSettingItem.h"
#import "ZYGSettingSwitchItem.h"
#import "ZYGSettingArrowItem.h"
#import "ZYGSettingCell.h"
//#import "ViewController.h"
#import "MBProgressHUD+Extend.h"
#import "ZYGPushAndWarningTableViewController.h"
#import "ZYGHelpViewController.h"
#import "ZYGProductShareViewController.h"
#import "ZYGShareViewController.h"
#import "ZYGAboutViewController.h"
#import "ZYGBuyWaterViewController.h"
#import "MTBBarcodeScanner.h"
#import "XMGLoginRegisterViewController.h"

@implementation ZYGSettingTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    ZYGSettingItem *item1 =[ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"买水" vcClass:[ZYGBuyWaterViewController class]];

    ZYGSettingItem *item2 = [[ZYGSettingArrowItem alloc]initWithIcon:@"handShake" title:@"充值"];


    ZYGSettingGroup *group1 =[[ZYGSettingGroup alloc]init];
     group1.items =  @[item1,item2];
    
    [self.cellData addObject:group1];
    
    ZYGSettingItem *item4 = [ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"检查版本更新" vcClass:[ZYGHelpViewController class]];
    item4.operation = ^()
    {
        [MBProgressHUD showMessage:@"正在检查版本更新。。。"];
        
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [MBProgressHUD hideHUD];
           [MBProgressHUD showSuccess:@"已经是最新版本了"];
       });
    };
     ZYGSettingItem *item5 =[ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"帮助" vcClass:[ZYGHelpViewController class]];
    
   ZYGSettingItem *item6 =[ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"分享" vcClass:[ZYGShareViewController class]];
   
    ZYGSettingItem *item7 = [[ZYGSettingLabelItem alloc]initWithIcon:@"handShake" title:@"查看消息"];
   
    ZYGSettingItem *item8 =[ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"游戏" vcClass:[ZYGProductShareViewController class]];
     ZYGSettingItem *item9 =[ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"关于" vcClass:[ZYGAboutViewController class]];
   
  
    ZYGSettingGroup *group2 = [[ZYGSettingGroup alloc]init];
    group2.items = @[item4,item5,item6,item7,item8,item9];
    [self.cellData addObject:group2];
    
//     ZYGSettingItem *item10 =[ZYGSettingArrowItem itemWithIcon:@"handShake" title:@"退出登录" vcClass:[XMGLoginRegisterViewController class]];
//    
//     ZYGSettingGroup *group3 = [[ZYGSettingGroup alloc]init];
//    group3.items = @[item10];
//    [self.cellData addObject:group3];
    
}





@end
