//
//  ZYGProductCell.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/26.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGProductCell.h"
#import "ZYGProduct.h"
@interface ZYGProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation ZYGProductCell

- (void)awakeFromNib {
    // Initialization code
    self.imgView.layer.cornerRadius = 15;
    self.imgView.layer.masksToBounds = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

-(void)setProduct:(ZYGProduct *)product
{
    _product = self.product;
    
    self.imgView.image = [UIImage imageNamed:product.icon];
    self.nameLabel.text = product.title;
}
@end
