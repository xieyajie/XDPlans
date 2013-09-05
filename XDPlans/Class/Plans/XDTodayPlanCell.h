//
//  XDTodayPlanCell.h
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RichTextEditor.h"

@interface XDTodayPlanCell : UITableViewCell

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;

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
