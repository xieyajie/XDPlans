//
//  XDAllPlansCell.m
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDAllPlansCell.h"

#import "XDPlanLocalDefault.h"

@implementation XDAllPlansCell

@synthesize index;
@synthesize content;
@synthesize action;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        _indexLabel.layer.borderWidth = 3.0f;
        _indexLabel.layer.cornerRadius = 20 / 2;
        _indexLabel.layer.masksToBounds = YES;
        _indexLabel.textAlignment = KTextAlignmentCenter;
        _indexLabel.font = [UIFont boldSystemFontOfSize:14.0];
        [self.contentView addSubview:_indexLabel];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(_indexLabel.frame.origin.x + _indexLabel.frame.size.width + 10, 5, 320 - 90, 40)];
        _contentLabel.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0];
        _contentLabel.textColor = [UIColor colorWithRed:237 / 255.0 green:231 / 255.0 blue:231 / 255.0 alpha:1.0];
        [self.contentView addSubview:_contentLabel];
        
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.frame = CGRectMake(_contentLabel.frame.origin.x + _contentLabel.frame.size.width + 10, 5, 20, _contentLabel.frame.size.height);
        _actionButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_actionButton];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - set

- (void)setIndex:(NSInteger)aIndex
{
    _indexLabel.text = [NSString stringWithFormat:@"%i",aIndex];
}

- (void)setContent:(NSString *)aContent
{
    _contentLabel.text = aContent;
}

- (void)setAction:(BOOL)aAction
{
    if (aAction) {
        _indexLabel.layer.borderColor = [[UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0] CGColor];
        _indexLabel.backgroundColor = [UIColor whiteColor];
        _indexLabel.textColor = [UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0];
        
        [_actionButton setImage:[UIImage imageNamed:@"menu_actionPlan.png"] forState:UIControlStateNormal];
    }
    else{
        _indexLabel.layer.borderColor = [[UIColor whiteColor] CGColor];
        _indexLabel.backgroundColor = [UIColor colorWithRed:115 / 255.0 green:166 / 255.0 blue:184 / 255.0 alpha:1.0];
        _indexLabel.textColor = [UIColor whiteColor];
        
        [_actionButton setImage:[UIImage imageNamed:@"plans_unaction.png"] forState:UIControlStateNormal];
    }
}

@end
