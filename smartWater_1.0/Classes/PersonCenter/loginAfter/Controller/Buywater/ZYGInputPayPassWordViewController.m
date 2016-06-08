//
//  ZYGInputPayPassWordViewController.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/13.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGInputPayPassWordViewController.h"
#import "MBProgressHUD+Extend.h"
#import "ZYGIndexViewController.h"


@interface ZYGInputPayPassWordViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *passwordFeild1;
@property (weak, nonatomic) IBOutlet UITextField *passwordFeild2;
@property (weak, nonatomic) IBOutlet UITextField *passwordFeild3;
@property (weak, nonatomic) IBOutlet UITextField *passwordFeild4;
@property (weak, nonatomic) IBOutlet UITextField *passwordFeild5;

@end

@implementation ZYGInputPayPassWordViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}




- (IBAction)payMoney:(id)sender {
    
    //调用微信支付
    
//    //使用的是微信测试数据 开发需要真实数据
//    NSString *urlString   = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
//    //解析服务端返回json数据
//    NSError *error;
//    //加载一个NSURL对象
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//    //将请求的url数据放到NSData对象中
//    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    if ( response != nil) {
//        NSMutableDictionary *dict = NULL;
//        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
//        dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
//       
//        NSLog(@"url:%@",urlString);
//        if(dict != nil){
//            NSMutableString *retcode = [dict objectForKey:@"retcode"];
//            if (retcode.intValue == 0){
//                NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
//                //调起微信支付
//                PayReq* req             = [[PayReq alloc] init];
//                req.partnerId           = [dict objectForKey:@"partnerid"];
//                req.prepayId            = [dict objectForKey:@"prepayid"];
//                req.nonceStr            = [dict objectForKey:@"noncestr"];
//                req.timeStamp           = stamp.intValue;
//                req.package             = [dict objectForKey:@"package"];
//                req.sign                = [dict objectForKey:@"sign"];
//                [WXApi sendReq:req];
//                //日志输出
//                NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
//            }else
//            {
//                
//            }
//        }else
//        {
//            
//        }
//    }else
//    {
//        
//    }
    
    
    
    [MBProgressHUD showMessage:@"支付成功。正在出水，注意安全！"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"出水完毕，谢谢使用！"];
    });
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    
//    [[WXPayClient shareInstance] payProduct];

    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.passwordFeild1) {
        [self.passwordFeild2 becomeFirstResponder];
    } else if(textField == self.passwordFeild2){
        [self.passwordFeild3 becomeFirstResponder];
    }else if(textField == self.passwordFeild3){
        [self.passwordFeild4 becomeFirstResponder];
    }else if(textField == self.passwordFeild4){
       [self.passwordFeild4 becomeFirstResponder];
    }else if(textField == self.passwordFeild5){
        [self.view endEditing:YES];
    }
    return YES;
}

@end
