//
//  XDTodayPlanCell.m
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDTodayPlanCell.h"

#import "XDPlanLocalDefault.h"

@implementation XDTodayPlanCell

@synthesize title = _title;
@synthesize titleColor = _titleColor;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIFont *font = [UIFont systemFontOfSize:16.0];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = font;
        _titleLabel.textColor = [UIColor colorWithRed:224 / 255.0 green:222 / 255.0 blue:214 / 255.0 alpha:1.0];
        _titleLabel.textAlignment = KTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - set

- (void)setTitle:(NSString *)str
{
    _title = str;
    
    UIFont *font = [UIFont systemFontOfSize:16.0];
    CGSize size = [_title sizeWithFont:font constrainedToSize:CGSizeMake(320, 20)];
    _titleLabel.frame = CGRectMake(320 - (size.width + 40), 0, size.width + 20, 20);
    _titleLabel.text = _title;
}

- (void)setTitleColor:(UIColor *)color
{
    _titleLabel.backgroundColor = color;
}


#pragma mark - public

- (void)configurationMood
{
    UIButton *moodButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moodButton.frame = CGRectMake(20, 20, 40, KTODAY_CELL_HEIGHT_NORMAL - 20);
    [moodButton setImage:[UIImage imageNamed:@"MY_ICON_001.png"] forState:UIControlStateNormal];
    moodButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    moodButton.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    moodButton.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:moodButton];
    
    UITextField *moodField = [[UITextField alloc] initWithFrame:CGRectMake(moodButton.frame.origin.x + moodButton.frame.size.width + 10, (KTODAY_CELL_HEIGHT_NORMAL - 37 - 20) / 2 + 20, self.frame.size.width - (moodButton.frame.origin.x + moodButton.frame.size.width + 30), 37)];
    moodField.borderStyle = UITextBorderStyleBezel;
    moodField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    moodField.placeholder = @"心情怎么样？";
    [self.contentView addSubview:moodField];
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
    
}

//评价表现
- (void)configurationGrand
{
    
}

@end
