//
//  ZYGSettingCell.h
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYGSettingItem;
@interface ZYGSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong)ZYGSettingItem *item;

@end
