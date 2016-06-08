//
//  ZYGTransationDetail.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/24.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGTransationDetail.h"

@implementation ZYGTransationDetail
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.transationId = dict[@"tr_uuid"];
        self.PhoneNumber = dict[@"u_phonenum"];
        self.transationId = dict[@"tr_time"];
        self.transationId = dict[@"eq_uuid"];
        self.transationId = dict[@"tr_port"];
        self.transationId = dict[@"tr_money"];
        self.transationId = dict[@"tr_amount"];

    }
    
    return self;
}

+(instancetype)transationWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
