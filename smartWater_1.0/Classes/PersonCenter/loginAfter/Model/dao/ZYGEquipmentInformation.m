//
//  ZYGEquipmentInformation.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/24.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGEquipmentInformation.h"

@implementation ZYGEquipmentInformation

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self =[super init]) {
        self.eqId = dict[@"eq_uuid"];
        self.eqUnitprice = dict[@"eq_unitprice"];
        self.eqLocationArea = dict[@"eq_loction_area"];
        self.eqLocationDetail = dict[@"eq_location_detail"];
        self.eqPortcount = dict[@"eq_portcount"];
        self.eqIdentifyCode = dict[@"eq_Identifycode"];
        self.eqStateIng = dict[@"eq_coordinates_Ing"];
        self.eqStateLastime = dict[@"eq_coordinates_Iat"];
        self.eqDeliveryTime = dict[@"eq_Deliverytime"];
        self.eqInstallationTime = dict[@"eq_installationtime"];
        self.eqLastmodifyTime = dict[@"eq_lastmodify"];

    }
    return self;
}

+(instancetype)equipmentWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
