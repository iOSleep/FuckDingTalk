//
//  DingtalkPluginConfig.m
//  DingTalkFuckDylib
//
//  Created by 马旭 on 2017/10/31.
//  Copyright © 2017年 马旭. All rights reserved.
//

#import "DingtalkPluginConfig.h"
#import <CaptainHook/CaptainHook.h>

@implementation DingtalkPluginConfig
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static DingtalkPluginConfig *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _location = CLLocationCoordinate2DMake(39.950506, 116.33732);
        _open = NO;
    }
    return self;
}

@end
