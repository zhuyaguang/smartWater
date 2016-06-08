//
//  ZYGSettingCell.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGSettingCell.h"
#import "ZYGSettingItem.h"
#import "ZYGSettingSwitchItem.h"
#import "ZYGSettingArrowItem.h"
#import "ZYGSettingLabelItem.h"
@interface ZYGSettingCell()

@property(nonatomic,strong)UIImageView *mArrow;

@property(nonatomic,strong)UISwitch *mSwitch;

@property(nonatomic,strong)UILabel *mLabel;


@end
@implementation ZYGSettingCell

-(UIImageView *)mArrow
{
    if (!_mArrow) {
        _mArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    
    return _mArrow;
}

-(UISwitch *)mSwitch
{
    if (!_mSwitch) {
        _mSwitch = [[UISwitch alloc]init];
        
        [_mSwitch addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return _mSwitch;
}

-(void)valueChange:(UISwitch *)mSwitch
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:mSwitch.isOn forKey:self.item.title];
    
    [defaults synchronize];
}


-(UILabel *)mLabel
{
    if (!_mLabel) {
        UILabel *label =[[UILabel alloc]init];
        
        label.bounds =CGRectMake(0, 0, 80, 44);
        label.text =@"00:00";
        
    }
    
    return _mLabel;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *ID = @"SettingCell";
    ZYGSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[ZYGSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }

    return cell;
}

- (void)setItem:(ZYGSettingItem *)item
{
    _item = item;
    if (item.icon) {
        self.imageView.image =  [UIImage imageNamed:item.icon];
    }
    
    self.detailTextLabel.text = item.subTitle;
    self.textLabel.text = item.title;
    
    if ([item isKindOfClass:[ZYGSettingArrowItem class]]) {
        self.accessoryView = self.mArrow;
    }else if([item isKindOfClass:[ZYGSettingSwitchItem class]])
    {
        self.mSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:item.title];
        self.accessoryView = self.mSwitch;
        
    }else if([item isKindOfClass:[ZYGSettingLabelItem class]])
              {
                 
                  self.accessoryView = self.mLabel;
              }

}

@end
