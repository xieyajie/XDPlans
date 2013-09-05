//
//  XDTodayPlanCell.m
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDTodayPlanCell.h"

#import "XDPlanLocalDefault.h"

@interface XDTodayPlanCell()

@property (nonatomic, strong) UITextField *moodField;
@property (nonatomic, strong) RichTextEditor *textEditor;

@end

@implementation XDTodayPlanCell

@synthesize moodField = _moodField;
@synthesize textEditor = _textEditor;

//public
@synthesize textField = _textField;
@synthesize textView = _textView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - set

#pragma mark - get

- (RichTextEditor *)textEditor
{
    if (_textEditor == nil) {
        _textEditor = [[RichTextEditor alloc] init];
        _textEditor.backgroundColor = [UIColor clearColor];
    }
    
    return _textEditor;
}

- (UITextField *)textField
{
    return _moodField;
}

- (UITextView *)textView
{
    return _textEditor;
}

#pragma mark - public

- (void)configurationMood
{
    UIButton *moodButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moodButton.frame = CGRectMake(10, 10, 40, KTODAY_CELL_HEIGHT_NORMAL - 20);
    [moodButton setImage:[UIImage imageNamed:@"MY_ICON_001.png"] forState:UIControlStateNormal];
    moodButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    moodButton.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    moodButton.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:moodButton];
    
    _moodField = [[UITextField alloc] initWithFrame:CGRectMake(moodButton.frame.origin.x + moodButton.frame.size.width + 10, (KTODAY_CELL_HEIGHT_NORMAL - 37 - 20) / 2, self.frame.size.width - (moodButton.frame.origin.x + moodButton.frame.size.width + 30), 37)];
    _moodField.borderStyle = UITextBorderStyleBezel;
    _moodField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    _moodField.placeholder = @"心情怎么样？";
    [self.contentView addSubview:_moodField];
}

//工作量指数
- (void)configurationWordload
{
    
}

//完成信心指数
- (void)configurationFinishFaith
{
    
}

//今日安排
- (void)configurationPlan
{
    
}

//今日总结
- (void)configurationSummary
{
    self.textEditor.frame = CGRectMake(10, 10, self.frame.size.width - 20, KTODAY_CELL_HEIGHT_CONTENT - 20);
    [self.contentView addSubview:self.textEditor];
}

//评价表现
- (void)configurationGrand
{
    
}

@end
