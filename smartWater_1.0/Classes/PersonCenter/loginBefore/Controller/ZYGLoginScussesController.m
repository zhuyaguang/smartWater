//
//  ZYGLoginScussesController.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/11.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGLoginScussesController.h"

@interface ZYGLoginScussesController ()

@end

@implementation ZYGLoginScussesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"欢迎登录";
    
    _label1.text  = @"登录成功23333";
    _label2.text = [NSString stringWithFormat:@"登录账号是%@" ,_str1];
    _label3.text = [NSString stringWithFormat:@"登录密码是%@" ,_str2];
}

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
