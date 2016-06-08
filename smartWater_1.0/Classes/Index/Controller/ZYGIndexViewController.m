//
//  ZYGIndexViewController.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/5.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGIndexViewController.h"

@interface ZYGIndexViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ZYGIndexViewController

- (UIScrollView *)scrollview
{
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(12.5, 70, 300, 130)];
        _scrollview.backgroundColor = [UIColor redColor];
        [self.view addSubview:_scrollview];
        
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.showsVerticalScrollIndicator = NO;
        _scrollview.pagingEnabled = YES;
        self.scrollview.contentSize = CGSizeMake(5 * _scrollview.bounds.size.width, 0);
        
        _scrollview.delegate = self;
    }
    return _scrollview;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = 5;
        CGSize size =[_pageControl sizeForNumberOfPages:5];
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.view.center.x, 190);
        
        _pageControl.pageIndicatorTintColor = [UIColor blackColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
        [self.view addSubview:_pageControl];
        
        [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (void)pageChange:(UIPageControl *)page
{
    // NSLog(@"%d",page.currentPage);
    CGFloat x = page.currentPage * self.scrollview.bounds.size.width;
    [self.scrollview setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
   
    int colums =3;
    CGFloat viewWidth = self.view.frame.size.width;
    
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 30;
    CGFloat maginX = (viewWidth - colums*appW)/ (colums+1);
    CGFloat maginY = maginX;
    NSArray *btnTitle = @[@"保修",@"投诉建议",@"通知",@"大家庭",@"生活导航",@"常用电话"];
    for (int i=0;i<6;i++)
    {
        int colIdx = i % colums;
        int rowIdx = i / colums;
        CGFloat appX = maginX+ colIdx *(appW +maginX);
        CGFloat appY = marginTop +rowIdx *(appH +maginY)+180;
        UIButton *btn  = [[UIButton alloc]init];
        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
        btn.tag = i+1;
        [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(appX, appY, appW, appH);
        
        [self.view addSubview:btn];
        
    }
    
//    UIButton *btn2  = [[UIButton alloc]init];
//    btn2.frame = CGRectMake(10, 160, 70, 70);
//    btn2.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:btn2];
    
    
    for(int i= 0;i<5;i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i+1];
        UIImage *image =[UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.scrollview.bounds];
        imageView.image = image;
        [self.scrollview addSubview:imageView];
        
    }
    
    [self.scrollview.subviews enumerateObjectsUsingBlock:^(UIImageView *imageview, NSUInteger idx, BOOL *stop) {
        CGRect frame = imageview.frame;
        frame.origin.x = idx * frame.size.width;
        imageview.frame = frame;
    }];
    
    self.pageControl.currentPage = 0;
    
    [self startTimer];
    
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateTimer)  userInfo:nil  repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
- (void)updateTimer
{
    int page = (self.pageControl.currentPage+1)%5;
    self.pageControl.currentPage = page;
    [self pageChange:self.pageControl];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    self.pageControl.currentPage =page;
}
//抓住图片停止时钟 放下开始
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self startTimer];
}



@end
