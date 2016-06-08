//
//  ZYGSettingItem.h
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OperationBlock)();

@interface ZYGSettingItem : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subTitle;

@property(nonatomic,copy)Class vcClass;
@property(nonatomic,copy)OperationBlock operation;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass;

@end
