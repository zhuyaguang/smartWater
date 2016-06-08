//
//  ZYGTransationDetail.h
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/24.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYGTransationDetail : NSObject

@property(nonatomic,copy)NSString *transationId;
@property(nonatomic,copy)NSString *PhoneNumber;
@property(nonatomic,copy)NSString *transationTime;
@property(nonatomic,copy)NSString *eqId;
@property(nonatomic,copy)NSString *transationPort;
@property(nonatomic,copy)NSString *transationMoney;
@property(nonatomic,copy)NSString *transationAmount;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)transationWithDict:(NSDictionary *)dict;
@end
