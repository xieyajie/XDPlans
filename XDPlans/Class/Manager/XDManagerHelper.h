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

+ (NSInteger)tagCompileWithInteger:(NSInteger)integer;
+ (NSInteger)tagDecompileWithInteger:(NSInteger)integer;

+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;

@end
