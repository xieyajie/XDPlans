//
//  XDManagerHelper.h
//  XDPlans
//
//  Created by xieyajie on 13-9-4.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDManagerHelper : NSObject

+ (id)shareHelper;

+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (BOOL)isEmail:(NSString *)email;

@end
