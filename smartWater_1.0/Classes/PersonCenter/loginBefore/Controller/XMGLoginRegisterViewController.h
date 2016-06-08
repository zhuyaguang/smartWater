//
//  XMGLoginRegisterViewController.h
//  01-百思不得姐
//
//  Created by xiaomage on 15/7/26.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <SMS_SDK/Extend/SMSSDKResultHanderDef.h>
// 定义一个代理传值
@protocol sendValueDelegate <NSObject>

-(void)sendValue:(id)sender1 andValue:(id)sender2;

@end

@interface XMGLoginRegisterViewController : UIViewController

@property(nonatomic,assign)id <sendValueDelegate> delegate;

@end
