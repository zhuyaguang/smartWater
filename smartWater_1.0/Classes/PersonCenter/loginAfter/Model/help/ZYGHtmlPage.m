//
//  ZYGHtmlPage.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/25.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGHtmlPage.h"

@implementation ZYGHtmlPage
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        
        self.html = dict[@"html"];
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
    }
    return self;
}


+(instancetype)htmlPageWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
