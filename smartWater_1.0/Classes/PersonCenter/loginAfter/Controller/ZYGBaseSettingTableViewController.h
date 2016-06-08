//
//  ZYGBaseSettingTableViewController.h
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYGSettingItem.h"
#import "ZYGSettingSwitchItem.h"
#import "ZYGSettingArrowItem.h"
#import "ZYGSettingGroup.h"
#import "ZYGSettingLabelItem.h"
@interface ZYGBaseSettingTableViewController : UITableViewController

@property(nonatomic,copy)NSMutableArray *cellData;

@end
