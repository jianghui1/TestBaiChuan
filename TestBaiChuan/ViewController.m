//
//  ViewController.m
//  TestBaiChuan
//
//  Created by ys on 16/6/7.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#import <WebKit/WKWebView.h>

#import <ALBBSDK/ALBBSDK.h>
#import <ALBBSDK/ALBBWebViewService.h>

#import "CookiesManager.h"


@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [[[ALBBSDK sharedInstance] getService:@protocol(ALBBWebViewService)] prepareService];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.webView];
    _webView.backgroundColor = [UIColor redColor];
    _webView.delegate = self;
    [[[ALBBSDK sharedInstance] getService:@protocol(ALBBWebViewService)] bindLoginService:_webView sourceViewController:self];
    
    
//    [[CookiesManager sharedCookiesManager] addCookies];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(100, 100, 100, 100);
//    button.backgroundColor = [UIColor whiteColor];
//    [button setTitle:@"返回" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    

}

//- (void)buttonAction
//{
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://s.click.taobao.com/t?e=m%3D2%26s%3DpY7a302KLl8cQipKwQzePOeEDrYVVa64pRe%2F8jaAHci5VBFTL4hn2ReENXlhpyWFmSMhGfkQJ74tf4IqWdFhpb6l5cZuSjIG2z4G%2BH6xrnZE8AnZx%2B6ZPmb7gD7pyXQQAZnLGvN9kiMQCzGTBCR%2F0iGFCzYOOqAQ&unid=d1f90bbaf56c49dc971400ca60749aba"]]];
//}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // 释放淘宝登录授权服务
    [[[ALBBSDK sharedInstance] getService:@protocol(ALBBWebViewService)] releaseService];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
//    NSString *urlString = request.URL.absoluteString;
//    if ([urlString rangeOfString:@"buy.m.tmall.com"].length > 0) {        [[CookiesManager sharedCookiesManager] setCookiesWithUrlString:urlString];
//        
//    }
    
    return YES;
}

@end
