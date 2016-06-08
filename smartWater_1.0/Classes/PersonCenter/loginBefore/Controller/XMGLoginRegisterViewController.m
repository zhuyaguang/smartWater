//
//  XMGLoginRegisterViewController.m
//  01-百思不得姐
//
//  Created by xiaomage on 15/7/26.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGLoginRegisterViewController.h"
#import "XMGTextField.h"
#import "ZYGLoginScussesController.h"
#import "ZYGSettingTableViewController.h"
//#import <SVProgressHUD.h>
#import <SMS_SDK/SMSSDK.h>
#import "MBProgressHUD+Extend.h"
#import "ZYGUserInfomation.h"
//#import <AFNetworking.h>
#import "JKCountDownButton.h"
@interface XMGLoginRegisterViewController ()<UIAlertViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *loginView;

@property (weak, nonatomic) IBOutlet UIView *registerView;
// 登录view

@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;
@property (weak, nonatomic) IBOutlet XMGTextField *loginPhoneFiled;

@property (weak, nonatomic) IBOutlet XMGTextField *loginPasswordField;

// 注册view
@property (weak, nonatomic) IBOutlet XMGTextField *registerPhoneField;

@property (weak, nonatomic) IBOutlet XMGTextField *registerPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
 //验证码框

@property (weak, nonatomic) IBOutlet UILabel *messgeLabel;
@property (weak, nonatomic) IBOutlet XMGTextField *messgeField;
//  发送按钮

@property (weak, nonatomic) IBOutlet JKCountDownButton *sendMessageBtn;


//保存用户信息的model
@property(nonatomic,strong)ZYGUserInfomation *userInformation;
@end

@implementation XMGLoginRegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.registerView.alpha = 0;
    self.messgeField.alpha =0;
    self.messgeLabel.alpha = 0;
    
  
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.loginPhoneFiled) {
        [self.loginPasswordField becomeFirstResponder];
        
    }else if(textField == self.loginPasswordField)
    {
        [self.view endEditing:YES];

    }else if(textField == self.registerPhoneField)
    {
        [self.registerPasswordField becomeFirstResponder];
    }else if (textField == self.registerPasswordField){
        [self.messgeField becomeFirstResponder];
    }else if(textField == self.messgeField){
        [self.view endEditing:YES];
    }
        return YES;
}

- (IBAction)showLoginOrRegister:(UIButton *)button {
    
  
    
    //[UIView animateWithDuration:0.25 animations:^{
        
        if (self.loginView.alpha == 1) {
            [button setTitle:@"已有帐号?" forState:UIControlStateNormal];
                self.loginView.alpha = 0;
                self.registerView.alpha = 1;
                self.messgeField.alpha =1;
                self.messgeLabel.alpha =1;
            
            self.loginView.frame = CGRectMake(21, 155, 354, 185);
            
            
        
        }
        else
        {
             self.loginView.alpha = 1;
             self.registerView.alpha = 0;
             self.messgeField.alpha =0;
             self.messgeLabel.alpha = 0;
           // self.loginView.frame = CGRectMake(0, 96, 600, 200);
            
            
            [button setTitle:@"注册帐号" forState:UIControlStateNormal];
        }
   // }];
    
}

- (IBAction)sendMessageBtn:(id)sender {
    

    
    
 
    
    if (self.registerPhoneField.text.length!=0 && self.registerPasswordField.text.length !=0){
        //sender.enabled = NO;
        self.sendMessageBtn.enabled = NO;
        
        //button type要 设置成custom 否则会闪动
        [sender startCountDownWithSecond:60];
        
        [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
            return title;
        }];
        [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
            
        }];
    }else{
                [MBProgressHUD showError:@"请输入手机号和密码！"];
            }
    
    NSString *phoneNumber = self.registerPhoneField.text;
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneNumber zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"success!!");
            [MBProgressHUD showSuccess:@"发送成功！！"];
        }else{
            NSLog(@"error:%@",error);
        }
    }];
 
}


//登录按钮
- (IBAction)loginBUttonClick:(id)sender {
    if (self.loginPhoneFiled.text.length == 0 || self.loginPasswordField.text.length == 0 ) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"账号/密码不能为空" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
        [alert show];
    }else if (![[NSUserDefaults standardUserDefaults]objectForKey:self.loginPhoneFiled.text]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"账号不存在" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
        self.loginPasswordField.text = @"";
        self.loginPhoneFiled.text = @"";
        
        [alert show];
    } else if (![[[NSUserDefaults standardUserDefaults]objectForKey:self.loginPhoneFiled.text] isEqualToString:self.loginPasswordField.text]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"密码错误" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
        self.loginPasswordField.text = @"";
        
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录成功" message:@"2333333" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        [self Loginsuccess];
        self.loginPasswordField.text = @"";
        self.loginPhoneFiled.text = @"";
        
    }
    

}



-(void)Loginsuccess
{

    
    ZYGSettingTableViewController *settingVc = [[ZYGSettingTableViewController alloc]init ];
    
    UINavigationController *nac = [[UINavigationController alloc]initWithRootViewController:settingVc];
    [self addChildViewController:nac];

    
    [self.navigationController pushViewController:settingVc animated:YES];
  //  [self presentModalViewController:settingVc animated:YES];
    
   
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   
    
    //[self.navigationController pushViewController:login animated:YES];
}

- (IBAction)forgetPasswoedButton:(id)sender {
    
}
// 注册按钮
- (IBAction)registerButtonClick {
    
    if (self.registerPhoneField.text.length ==0||self.registerPhoneField.text.length >11 || self.registerPasswordField.text.length ==0 ) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"请填写完整不超过11位的手机号" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }  else {
            if ([[NSUserDefaults standardUserDefaults]objectForKey:self.registerPhoneField.text]) {
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"该用户已存在" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                
                [alert show];
            } else {
                //  短信验证码判断
                [SMSSDK commitVerificationCode:self.messgeField.text phoneNumber:self.registerPhoneField.text zone:@"86" result:^(NSError *error) {
                    if (!error) {
                        NSLog(@"succcess!!");
                        
                        //用户名判断是否重复
                        [[NSUserDefaults standardUserDefaults]setObject:self.registerPasswordField.text forKey:self.registerPhoneField.text];
                        [[NSUserDefaults standardUserDefaults]synchronize];
                        UIAlertView *alery = [[UIAlertView alloc]initWithTitle:@"注册成功" message:@"23333" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                        
                        
                        
                        [alery show];
                        
                          [self showLoginOrRegister:nil];
                    }else{
                        NSLog(@"error:%@",error);
                        [MBProgressHUD showError:error];
                    }
                }];
                
               
              
                
                //向服务器发送注册信息数据
                //self.userInformation.PhoneNumber = self.registerPhoneField.text;
//                NSDictionary *dict = @{@"u_id":self.registerPhoneField.text,@"u_name":@"张三",@"u_phonenum":self.registerPhoneField.text,@"u_psw":self.registerPasswordField.text,@"u_type":@"1",@"u_power":@"1",@"u_creationtime":[self getCurrentTime],@"u_remainingsum":@"0"};
//                
//                [self.userInformation initWithDict:dict];
//                
//                NSString *URLString =@"http://example.com";
//                
//                [[AFHTTPRequestSerializer serializer]requestWithMethod:@"GET" URLString:URLString parameters:dict error:nil];
//                
//                
//                NSData *data =[NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
                
                
                    }
            }
    
   
    
    
}
//获取当前时间
- (NSString *)getCurrentTime{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    
    return currentTime;
}
/**
 * 让当前控制器对应的状态栏是白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
    
}
@end
