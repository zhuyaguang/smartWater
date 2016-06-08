//
//  ZYGNavigationViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGNavigationViewController.h"

@interface ZYGNavigationViewController ()

@end

@implementation ZYGNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

+(void)initialize
{
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    UINavigationBar *navBar = [UINavigationBar appearance];
//    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    
//    NSDictionary *titleAttr = @{NSForegroundColorAttributeName:[UIColor whiteColor],
//                                NSFontAttributeName:[UIFont systemFontOfSize:24]
//                                };
//    [navBar setTitleTextAttributes:titleAttr];
//    
//    navBar.tintColor = [UIColor whiteColor];
//    UIBarButtonItem *navItem = [UIBarButtonItem appearance];
//    [navItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} forState:UIControlStateNormal];
    
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = NO;
    return [super pushViewController:viewController animated:animated];
}

@end
