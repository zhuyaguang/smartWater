//
//  ZYGAwardAnimationViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGAwardAnimationViewController.h"

@interface ZYGAwardAnimationViewController ()

@end

@implementation ZYGAwardAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYGSettingItem *item1 =[ZYGSettingSwitchItem itemWithIcon:@"nil" title:@"中奖动画" ];
    
    
    ZYGSettingGroup *group1 = [[ZYGSettingGroup alloc]init];
    group1.headerTitle=@"xxxxxxxxxx";
    group1.items = @[item1];
    
    [self.cellData addObject:group1];
    
}



@end
