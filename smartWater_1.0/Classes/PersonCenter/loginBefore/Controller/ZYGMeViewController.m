//
//  ZYGMeViewController.m
//  百思不得姐
//
//  Created by 朱亚光 on 16/5/5.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGMeViewController.h"
#import "XMGLoginRegisterViewController.h"

@interface ZYGMeViewController ()

@end

@implementation ZYGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的个人中心";
}

- (IBAction)loginButton:(id)sender {
    XMGLoginRegisterViewController *vc = [[XMGLoginRegisterViewController alloc]init];
    
 
    self.navigationController.hidesBottomBarWhenPushed = YES;

   [self.navigationController pushViewController:vc animated:YES];
   }





@end
