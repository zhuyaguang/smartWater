//
//  ZYGProductShareViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/26.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGProductShareViewController.h"
#import "ZYGProduct.h"
#import "ZYGProductCell.h"
@interface ZYGProductShareViewController ()

@property(nonatomic,strong)NSArray *products;

@end

@implementation ZYGProductShareViewController

-(NSArray *)products
{
    if (!_products) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"products.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        NSArray *productArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *productsM = [NSMutableArray array];
        
        for (NSDictionary *dict  in productArray) {
             ZYGProduct *product =[ZYGProduct productWithDict:dict];
            [productsM addObject:product];
        }
        
        _products = productsM;
    }
    return _products;

}
static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    if (self = [super
        initWithCollectionViewLayout:flowLayout]) {
        
        flowLayout.itemSize = CGSizeMake(100, 100);
        
        flowLayout.minimumLineSpacing = 30;
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerNib:[UINib nibWithNibName:@"ZYGProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
   
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZYGProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    cell.product = self.products[indexPath.row];
    // Configure the cell
    
    return cell;
}



@end
