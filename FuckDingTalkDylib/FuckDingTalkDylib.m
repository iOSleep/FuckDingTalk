//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  FuckDingTalkDylib.m
//  FuckDingTalkDylib
//
//  Created by 马旭 on 2017/11/1.
//  Copyright (c) 2017年 马旭. All rights reserved.
//

#import "FuckDingTalkDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import "DingtalkPluginConfig.h"
#import "DingtalkPluginConfig.h"
#import "WrappedHUDHelper.h"


CHDeclareClass(CLLocation);

CHOptimizedMethod0(self, CLLocationCoordinate2D, CLLocation, coordinate){
    CLLocationCoordinate2D coordinate = CHSuper(0, CLLocation, coordinate);
    if([DingtalkPluginConfig sharedInstance].open){
        CLLocationDegrees latitude = [DingtalkPluginConfig sharedInstance].location.latitude - (arc4random()%100) / 1000000.0;
        CLLocationDegrees longitude = [DingtalkPluginConfig sharedInstance].location.longitude - (arc4random()%100) / 1000000.0;
        coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    }
    return coordinate;
}
CHConstructor{
    CHLoadLateClass(CLLocation);
    CHClassHook(0, CLLocation, coordinate);
}

CHDeclareClass(DTAboutDingController);
CHOptimizedMethod0(self, void, DTAboutDingController, copyright) {
    [DingtalkPluginConfig sharedInstance].open = ![DingtalkPluginConfig sharedInstance].open;
    NSString *str = [DingtalkPluginConfig sharedInstance].open ? @"FakeGPS" : @"Good Boy";
    [(WrappedHUDHelper *)[NSClassFromString(@"WrappedHUDHelper") sharedHelper] showHUDOnFrontWithTitle:str duration:1];
}
CHConstructor{
    CHLoadLateClass(DTAboutDingController);
    CHClassHook(0, DTAboutDingController,copyright);
}

CHDeclareClass(AMapGeoFenceManager);
CHMethod(0, BOOL,AMapGeoFenceManager,detectRiskOfFakeLocation){
    
    return NO;
}
CHMethod(0, BOOL,AMapGeoFenceManager,pausesLocationUpdatesAutomatically){
    
    return NO;
}
CHConstructor{
    CHLoadLateClass(AMapGeoFenceManager);
    CHClassHook(0, AMapGeoFenceManager,detectRiskOfFakeLocation);
    CHClassHook(0, AMapGeoFenceManager,pausesLocationUpdatesAutomatically);
}


CHDeclareClass(AMapLocationManager);
CHMethod(0, BOOL,AMapLocationManager,detectRiskOfFakeLocation){
    return NO;
}
CHMethod(0, BOOL,AMapLocationManager,pausesLocationUpdatesAutomatically){
    
    return NO;
}
CHConstructor{
    CHLoadLateClass(AMapLocationManager);
    CHClassHook(0, AMapLocationManager,detectRiskOfFakeLocation);
    CHClassHook(0, AMapLocationManager,pausesLocationUpdatesAutomatically);
}


CHDeclareClass(DTALocationManager);
CHMethod(0, BOOL,DTALocationManager,detectRiskOfFakeLocation){
    return NO;
}
CHMethod(0, BOOL,DTALocationManager,dt_pausesLocationUpdatesAutomatically){
    return NO;
}
CHConstructor{
    CHLoadLateClass(DTALocationManager);
    CHClassHook(0, DTALocationManager,detectRiskOfFakeLocation);
    CHClassHook(0, DTALocationManager,dt_pausesLocationUpdatesAutomatically);
}

