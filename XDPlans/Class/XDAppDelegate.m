//
//  XDAppDelegate.m
//  XDPlans
//
//  Created by xie yajie on 13-8-31.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDAppDelegate.h"

#import "JASidePanelController.h"
#import "XDMenuViewController.h"
#import "XDTodayPlanViewController.h"

#import "UIColor+Category.h"
#import "XDPlanLocalDefault.h"

#define KSIDE 0

@implementation XDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = YES;
    self.viewController.leftGapPercentage = KSIDESLIP_PERCENT;
    self.viewController.allowRightSwipe = NO;

    XDMenuViewController *menuVC = [[XDMenuViewController alloc] initWithStyle:UITableViewStylePlain selectedIndex:2];
    self.viewController.leftPanel = menuVC;
    self.viewController.centerPanel = [menuVC navigationForIndex:2];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
