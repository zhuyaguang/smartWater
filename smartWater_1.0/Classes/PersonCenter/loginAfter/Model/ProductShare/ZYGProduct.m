//
//  ZYGProduct.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/26.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGProduct.h"

@implementation ZYGProduct

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.identifier = dict[@"id"];
        self.schemes = dict[@"customUrl"];
        self.appUrl = dict[@"url"];
    }
    
    return self;
}
+(instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
