//
//  ZYGEquipmentInformation.h
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/24.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYGEquipmentInformation : NSObject
@property(nonatomic,copy)NSString *eqId;
@property(nonatomic,copy)NSString *eqUnitprice;
@property(nonatomic,copy)NSString *eqLocationArea;
@property(nonatomic,copy)NSString *eqLocationDetail;
@property(nonatomic,copy)NSString *eqPortcount;
@property(nonatomic,copy)NSString *eqIdentifyCode;
@property(nonatomic,copy)NSString *eqStateIng;
@property(nonatomic,copy)NSString *eqStateLastime;
@property(nonatomic,copy)NSString *eqDeliveryTime;
@property(nonatomic,copy)NSString *eqInstallationTime;
@property(nonatomic,copy)NSString *eqLastmodifyTime;



-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)equipmentWithDict:(NSDictionary *)dict;
@end
