//
//  XDTodayPlanViewController.m
//  XDPlans
//
//  Created by xie yajie on 13-9-1.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDTodayPlanViewController.h"

@interface XDTodayPlanViewController ()

@end

@implementation XDTodayPlanViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:36 / 255.0 green:99 / 255.0 blue:109 / 255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithRed:36 / 255.0 green:99 / 255.0 blue:109 / 255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
