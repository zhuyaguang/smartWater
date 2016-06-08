//
//  ZYGHtmlPage.h
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/25.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYGHtmlPage : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *html;
@property(nonatomic,copy)NSString *ID;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)htmlPageWithDict:(NSDictionary *)dict;

@end
