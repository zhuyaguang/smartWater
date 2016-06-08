//
//  ZYGHelpViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/25.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGHelpViewController.h"
#import "ZYGHtmlPage.h"
#import "ZYGHelpViewController.h"
#import "ZYGWebViewViewController.h"
@interface ZYGHelpViewController ()

@property(nonatomic,strong)NSArray *htmls;
@end


@implementation ZYGHelpViewController

-(NSArray *)htmls
{
    if (!_htmls) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSArray *helpArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *htmlsM = [NSMutableArray array];
        
        for (NSDictionary *dict  in helpArray) {
            ZYGHtmlPage *htmlPage =[ZYGHtmlPage htmlPageWithDict:dict];
            [htmlsM addObject:htmlPage];
        }
        
        _htmls = htmlsM;
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    ZYGSettingGroup *group = [[ZYGSettingGroup alloc]init];
    NSMutableArray *items = [NSMutableArray array];
    
    for (ZYGHtmlPage *htmlPage in self.htmls) {
        ZYGSettingArrowItem *item = [ZYGSettingArrowItem itemWithIcon:nil title:htmlPage.title ];
        //vcClass:[ZYGHelpViewController class]
        [items addObject:item];
    }
    
    group.items = items;
    
    
    
    [self.cellData addObject:group];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYGWebViewViewController *webVc = [[ZYGWebViewViewController alloc]init];
    
    webVc.htmlPage = self.htmls[indexPath.row];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:webVc];
    
    
    [self presentViewController:nav animated:YES completion:nil];
    
}



@end
