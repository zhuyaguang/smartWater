//
//  ZYGWebViewViewController.m
//  我的网易新闻
//
//  Created by 朱亚光 on 16/4/25.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGWebViewViewController.h"
#import "ZYGHtmlPage.h"
@interface ZYGWebViewViewController ()<UIWebViewDelegate>

@property(nonatomic,weak)UIWebView *webView;
@end

@implementation ZYGWebViewViewController

-(void)loadView
{
    UIWebView *webview = [[UIWebView alloc]init];
    webview.delegate = self;
    self.view = webview;
    self.webView = webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"网页控制器";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    
    //NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/"];
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.htmlPage.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (!self.htmlPage.ID) return;
    
    
    //执行javascript
    
    NSString *jsStr = [NSString stringWithFormat:@"window.location.href = '#%@'",self.htmlPage.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:jsStr];
    
}
-(void)btnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
