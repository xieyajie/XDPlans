//
//  XDAllPlansCell.h
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDAllPlansCell : UITableViewCell
{
    UILabel *_indexLabel;
    UILabel *_contentLabel;
    UIButton *_actionButton;
}

@property (nonatomic) NSInteger index;
@property (nonatomic, strong) NSString *content;
@property (nonatomic) BOOL action;

@end
