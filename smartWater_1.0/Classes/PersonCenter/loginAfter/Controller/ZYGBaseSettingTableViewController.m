//
//  ZYGSettingTableViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGBaseSettingTableViewController.h"
//#import "ViewController.h"
#import "MBProgressHUD+Extend.h"
#import "ZYGPushAndWarningTableViewController.h"
#import "ZYGSettingCell.h"

@implementation ZYGBaseSettingTableViewController

- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    
    return self;
}
- (NSMutableArray *)cellData
{
    if (!_cellData) {
        _cellData = [NSMutableArray array];
    }
    return _cellData;
}


-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.cellData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSArray *group = self.cellData[section];
    
    ZYGSettingGroup *group = self.cellData[section];
    
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
   // NSArray *group = self.cellData[indexPath.section];
    ZYGSettingGroup *group = self.cellData[indexPath.section];
    
    ZYGSettingItem *item = group.items[indexPath.row];
    
    ZYGSettingCell *cell = [ZYGSettingCell cellWithTableView:tableView];
    
    cell.item = item;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSArray *group = self.cellData[indexPath.section];
    ZYGSettingGroup *group = self.cellData[indexPath.section];
    ZYGSettingItem *item = group.items[indexPath.row];
    
    if (item.operation) {
        item.operation();
    }
    if (item.vcClass) {
        id vc = [[item.vcClass alloc]init];
        [vc setTitle:item.title];
        
        UINavigationController *nac = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nac];

        [self.navigationController pushViewController:vc animated:YES];
        
         //[self presentModalViewController:vc animated:YES];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ZYGSettingGroup *group = self.cellData[section];
    return group.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ZYGSettingGroup *group = self.cellData[section];
    return group.footerTitle;
}

@end
