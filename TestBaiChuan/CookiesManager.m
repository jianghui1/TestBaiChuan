//
//  CookiesManager.m
//  TestBaiChuan
//
//  Created by ys on 16/6/12.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "CookiesManager.h"

@interface CookiesManager ()
{
    NSArray *_cookies;
}

@end

@implementation CookiesManager

// 单例对象
+ (instancetype)sharedCookiesManager
{
    static CookiesManager *cookiesManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cookiesManager = [[CookiesManager alloc] init];
    });
    return cookiesManager;
}



// 获得cookie值
- (void)addCookies
{
    if (_cookies.count > 0) {
        for (NSHTTPCookie *cookie in _cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}

// 设置cookies值
- (void)setCookiesWithUrlString:(NSString *)urlString
{
    NSHTTPCookieStorage *sharedHTTPCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [sharedHTTPCookieStorage cookiesForURL:[NSURL URLWithString:urlString]];
    _cookies = [NSArray arrayWithArray:cookies];
}


@end
