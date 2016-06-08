//
//  ZYGShareViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/26.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGShareViewController.h"
#import <MessageUI/MessageUI.h>
@interface ZYGShareViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation ZYGShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYGSettingItem *item1 =[ZYGSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    ZYGSettingItem *item2 =[ZYGSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    
   // __weak ZYGShareViewController *selVc = self;
    __weak typeof(self) selVc = self;
    item2.operation = ^{
       // [MBProgressHUD showMessage:@"正在检查版本更新。。。"];
        if (![MFMessageComposeViewController canSendText]) {
            return ;
        }
        MFMessageComposeViewController *msgVc = [[MFMessageComposeViewController alloc]init];
        
        msgVc.recipients = @[@"10086",@"10010"];
        
        [selVc presentViewController:msgVc animated:YES completion:nil];
        
         };
    ZYGSettingItem *item3 =[ZYGSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    
    item3.operation = ^ {
       // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://39608856@qq.com"]];
        MFMailComposeViewController *mailVc = [[MFMailComposeViewController alloc]init];
        
        mailVc.mailComposeDelegate  = self;
        [mailVc setToRecipients:@[@"123@qq.com",@"345@qq.com"]];
        
        [mailVc setCcRecipients:@[@"123@qq.com",@"345@qq.com"]];
        
        [mailVc setMessageBody:@"恭喜中奖" isHTML:NO];
        
        [selVc presentViewController:mailVc animated:YES completion:nil];
        
        
    };
    ZYGSettingGroup *group1 =[[ZYGSettingGroup alloc]init];
    group1.items = @[item1,item2,item3];
    // NSArray *group1 = @[item1,item2,item3,item4];
    [self.cellData addObject:group1];

}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
