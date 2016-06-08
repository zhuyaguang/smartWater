//
//  ZYGUserInfomation.h
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/24.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYGUserInfomation : NSObject

@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *PhoneNumber;
@property(nonatomic,copy)NSString *password;
@property(nonatomic,copy)NSString *userType;
@property(nonatomic,copy)NSString *userPower;
@property(nonatomic,copy)NSString *userCreationTime;
@property(nonatomic,copy)NSString *userRemainingsum;



-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)userWithDict:(NSDictionary *)dict;
@end
