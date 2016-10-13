//
//  CookiesManager.h
//  TestBaiChuan
//
//  Created by ys on 16/6/12.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookiesManager : NSObject

// 单例对象
+ (instancetype)sharedCookiesManager;

// 获得cookies值
- (void)addCookies;

// 设置cookies值
- (void)setCookiesWithUrlString:(NSString *)urlString;

@end
