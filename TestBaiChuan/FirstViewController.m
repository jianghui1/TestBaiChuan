//
//  FirstViewController.m
//  TestBaiChuan
//
//  Created by ys on 16/6/7.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "FirstViewController.h"

#import "ViewController.h"
#import <ALBBLoginSDK/ALBBLoginSDK.h>

#import "UIDevice+ProcessesAdditions.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 200, 100, 100);
    button1.backgroundColor = [UIColor whiteColor];
    [button1 setTitle:@"清除" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(100, 300, 100, 100);
    button2.backgroundColor = [UIColor whiteColor];
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
//    NSArray * processes = [[UIDevice currentDevice] runningProcesses];
//    for (NSDictionary * dict in processes){
//        NSLog(@"%@ - %@", [dict objectForKey:@"ProcessID"], [dict objectForKey:@"ProcessName"]);
//    }
    
}

- (void)buttonAction
{
    ViewController *vc = [[ViewController alloc] init];
    vc.urlString = @"http://s.click.taobao.com/t?e=m%3D2%26s%3DpY7a302KLl8cQipKwQzePOeEDrYVVa64pRe%2F8jaAHci5VBFTL4hn2ReENXlhpyWFmSMhGfkQJ74tf4IqWdFhpb6l5cZuSjIG2z4G%2BH6xrnZE8AnZx%2B6ZPmb7gD7pyXQQAZnLGvN9kiMQCzGTBCR%2F0iGFCzYOOqAQ&unid=d1f90bbaf56c49dc971400ca60749aba";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)button2Action
{
    ViewController *vc = [[ViewController alloc] init];
    vc.urlString = @"http://s.click.taobao.com/t?e=m%3D2%26s%3D5SLaGHv3WL4cQipKwQzePOeEDrYVVa64qu1K02Mshg63bLqV5UHdqZjYAxCvTvshZW1Lr5j6Dectf4IqWdFhpR%2BWy3a5vlsf9w6PUW7UIOHyCpyaQK2AxoVsG%2FjqJZDnK8VhJc9AWtEC0R9fterxvHMldeGeFUw8GloM8CEaCw6eygl8Q7zCrSAKnHGZygju%2Fro2Nm8gkfLGJe8N%2FwNpGw%3D%3D&unid=91cac976bbec459b8943d4756ab0c280";
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)button1Action
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }

    if ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0 && [[UIDevice currentDevice] systemVersion].floatValue < 8.0) {
           }
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0 && [[UIDevice currentDevice] systemVersion].floatValue < 9.0) {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
    }
    
    // 清除缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    // 阿里百川退出
    id<ALBBLoginService>  loginService = [[ALBBSDK sharedInstance] getService:@protocol(ALBBLoginService)];
    [loginService logout];
}

@end
