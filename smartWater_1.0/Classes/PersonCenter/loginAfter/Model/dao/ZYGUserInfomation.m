//
//  ZYGUserInfomation.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/24.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGUserInfomation.h"

@implementation ZYGUserInfomation
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.userId = dict[@"u_id"];
        self.userName = dict[@"u_name"];
        self.PhoneNumber = dict[@"u_phonenum"];
        self.password = dict[@"u_psw"];
        self.userType = dict[@"u_type"];
        self.userPower = dict[@"u_power"];
        self.userCreationTime = dict[@"u_creationtime"];
        self.userRemainingsum = dict[@"u_remainingsum"];
    }
    
    return self;
}

+ (instancetype)userWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}
@end
