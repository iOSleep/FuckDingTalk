//
//  WrappedHUDHelper.h
//  DingTalkFuckDylib
//
//  Created by 马旭 on 2017/11/1.
//  Copyright © 2017年 马旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WrappedHUDHelper : NSObject
+ (id)sharedHelper;
- (void)showHUDOnFrontWithSuccessTitle:(id)arg1 duration:(unsigned long long)arg2 blockUI:(_Bool)arg3;
- (void)showHUDOnFrontWithTitle:(id)arg1 duration:(unsigned long long)arg2;
@end
