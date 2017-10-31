//
//  DingtalkPluginConfig.h
//  DingTalkFuckDylib
//
//  Created by 马旭 on 2017/10/31.
//  Copyright © 2017年 马旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DingtalkPluginConfig : NSObject

+(DingtalkPluginConfig*)sharedInstance;
/**
 经纬度
 */
@property(nonatomic, assign) CLLocationCoordinate2D location;
@property(nonatomic, assign) BOOL open;
@end
