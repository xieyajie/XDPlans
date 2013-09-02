//
//  XDMenuViewController.m
//  XDPlans
//
//  Created by xie yajie on 13-9-1.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "XDMenuViewController.h"

#import "XDMenuCell.h"

#import "XDPlanLocalDefault.h"

#define KMENU_TITLE @"title"
#define KMENU_NORMOLICON @"icon_normal"
#define KMENU_SELECTEDICON @"icon_selected"

@interface XDMenuViewController ()
{
    NSMutableArray *_dataSource;
    UIView *_headerView;
    
    NSInteger _selectedRow;
}

@property (nonatomic, strong) UIView *headerView;

@end

@implementation XDMenuViewController

@synthesize headerView = _headerView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _dataSource = [[NSMutableArray alloc] init];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"想做的事", KMENU_TITLE, @"menu_allPlans.png", KMENU_NORMOLICON, @"menu_allPlansSelected.png", KMENU_SELECTEDICON, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"正在进行", KMENU_TITLE, @"menu_actionPlan.png", KMENU_NORMOLICON, @"menu_actionPlanSelected.png", KMENU_SELECTEDICON, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"今日计划", KMENU_TITLE, @"menu_todayPlan.png", KMENU_NORMOLICON, @"menu_todayPlanSelected.png", KMENU_SELECTEDICON, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"设置", KMENU_TITLE, @"menu_setting.png", KMENU_NORMOLICON, @"menu_settingSelected.png", KMENU_SELECTEDICON, nil]];
        
        _selectedRow = 2;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    [self.tableView setTableHeaderView:self.headerView];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    self.tableView.backgroundColor = [UIColor colorWithRed:99 / 255.0 green:102 / 255.0 blue:110 / 255.0 alpha:1.0];
//    self.tableView.separatorColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mrk - get

- (UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 150)];
        _headerView.backgroundColor = [UIColor clearColor];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((_headerView.frame.size.width * KSIDESLIP_PERCENT - 80) / 2, 20, 80, 80)];
        imgView.contentMode = UIViewContentModeCenter | UIViewContentModeScaleToFill;
        imgView.image = [UIImage imageNamed:@"userLogout.png"];
        imgView.layer.cornerRadius = 80 / 2;
        imgView.layer.masksToBounds = YES;
        imgView.layer.borderWidth = 2.0f;
        imgView.layer.borderColor = [[UIColor colorWithRed:139 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0] CGColor];
        [_headerView addSubview:imgView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, imgView.frame.origin.y + 80 + 15, _headerView.frame.size.width * KSIDESLIP_PERCENT - 10, 20)];
        nameLabel.textAlignment = KTextAlignmentCenter;
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.textColor = [UIColor colorWithRed:139 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0];
        nameLabel.text = @"未登录";
        [_headerView addSubview:nameLabel];
    }
    
    return _headerView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuCell";
    XDMenuCell *cell = (XDMenuCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[XDMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.availableSize = CGSizeMake(self.tableView.frame.size.width * KSIDESLIP_PERCENT, KSIDESLIP_CELL_HEIGHT);
    }
    
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    if (dic != nil && [dic count] > 0) {
//        if (_selectedRow == indexPath.row) {
//            cell.contentView.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:32 / 255.0 blue:39 / 255.0 alpha:1.0];
//            cell.imageView.image = [UIImage imageNamed:[dic objectForKey:KMENU_SELECTEDICON]];
//            cell.textLabel.textColor = [UIColor whiteColor];
//        }
//        else{
//            cell.contentView.backgroundColor = [UIColor clearColor];
//            cell.imageView.image = [UIImage imageNamed:[dic objectForKey:KMENU_NORMOLICON]];
//            cell.textLabel.textColor = [UIColor colorWithRed:121 / 255.0 green:126 / 255.0 blue:134 / 255.0 alpha:1.0];
//        }
//        
//        cell.textLabel.text = [dic objectForKey:KMENU_TITLE];
        
        cell.normalIcon = [UIImage imageNamed:[dic objectForKey:KMENU_NORMOLICON]];
        cell.highlightedIcon = [UIImage imageNamed:[dic objectForKey:KMENU_SELECTEDICON]];
        cell.titleLabel.text = [dic objectForKey:KMENU_TITLE];
        
        if (_selectedRow == indexPath.row) {
            [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KSIDESLIP_CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *oldDic = [_dataSource objectAtIndex:_selectedRow];
//    UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedRow inSection:0]];
//    if (oldDic != nil && [oldDic count] > 0 && oldCell) {
//        oldCell.contentView.backgroundColor = [UIColor clearColor];
//        oldCell.imageView.image = [UIImage imageNamed:[oldDic objectForKey:KMENU_NORMOLICON]];
//        oldCell.textLabel.textColor = [UIColor colorWithRed:121 / 255.0 green:126 / 255.0 blue:134 / 255.0 alpha:1.0];
//    }
//    
//    _selectedRow = indexPath.row;
//    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    if (dic != nil && [dic count] > 0) {
//        cell.contentView.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:32 / 255.0 blue:39 / 255.0 alpha:1.0];
//        cell.imageView.image = [UIImage imageNamed:[dic objectForKey:KMENU_SELECTEDICON]];
//        cell.textLabel.textColor = [UIColor whiteColor];
//    }
}

@end
