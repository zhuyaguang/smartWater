//
//  ZYGSettingGroup.h
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/22.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYGSettingGroup : NSObject
@property(nonatomic,copy)NSString *headerTitle;
@property(nonatomic,copy)NSString *footerTitle;
@property(nonatomic,strong)NSArray *items;

@end
