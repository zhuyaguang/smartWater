//
//  ZYGSettingItem.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGSettingItem.h"

@implementation ZYGSettingItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title
{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
    }
    return self;
}
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    return [[self alloc] initWithIcon:icon title:title];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass
{
    ZYGSettingItem *item = [self itemWithIcon:icon title:title];
    item.vcClass = vcClass;
    
    return item;
}
@end
