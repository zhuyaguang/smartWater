//
//  ZYGTabBarController.m
//  百思不得姐
//
//  Created by 朱亚光 on 16/5/5.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGTabBarController.h"
#import "ZYGMeViewController.h"
#import "ZYGIndexViewController.h"
#import "ZYGNewsViewController.h"
#import "ZYGTabBar.h"
#import "ZYGNavigationViewController.h"
@interface ZYGTabBarController ()

@end

@implementation ZYGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupChildVc:[[ZYGIndexViewController alloc]init] title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupChildVc:[[ZYGNewsViewController alloc]init] title:@"消息" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[ZYGMeViewController alloc]init ] title:@"个人中心" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];

    [self setValue:[[ZYGTabBar alloc]init] forKey:@"tabBar"];

  }


- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    vc.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0];
    ZYGNavigationViewController *nac = [[ZYGNavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nac];

}


@end
