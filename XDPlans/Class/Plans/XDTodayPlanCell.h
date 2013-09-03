//
//  XDTodayPlanCell.h
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDTodayPlanCell : UITableViewCell
{
    UILabel *_titleLabel;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;

//心情
- (void)configurationMood;
//工作量指数
- (void)configurationWordload;
//完成信心指数
- (void)configurationFinishFaith;
//今日安排
- (void)configurationPlan;
//今日总结
- (void)configurationSummary;
//评价表现
- (void)configurationGrand;

@end
