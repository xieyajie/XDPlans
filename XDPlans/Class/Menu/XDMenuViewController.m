//
//  XDMenuViewController.m
//  XDPlans
//
//  Created by xie yajie on 13-9-1.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDMenuViewController.h"

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
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"所有计划", KMENU_TITLE, @"menu_allPlans.png", KMENU_NORMOLICON, @"menu_allPlansSelected.png", KMENU_SELECTEDICON, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"活跃计划", KMENU_TITLE, @"menu_actionPlan.png", KMENU_NORMOLICON, @"menu_actionPlanSelected.png", KMENU_SELECTEDICON, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"账号", KMENU_TITLE, @"menu_allPlans.png", KMENU_NORMOLICON, @"", KMENU_SELECTEDICON, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"设置", KMENU_TITLE, @"menu_setting.png", KMENU_NORMOLICON, @"menu_settingSelected.png", KMENU_SELECTEDICON, nil]];
        
        _selectedRow = 1;
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
    self.tableView.backgroundColor = [UIColor colorWithRed:37 / 255.0 green:41 / 255.0 blue:49 / 255.0 alpha:1.0];
    self.tableView.separatorColor = [UIColor colorWithRed:55 / 255.0 green:59 / 255.0 blue:67 / 255.0 alpha:1.0];
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
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((_headerView.frame.size.width * 0.8 - 80) / 2, 30, 80, 80)];
        imgView.image = [UIImage imageNamed:@"menu_headerImageDefault.png"];
        [_headerView addSubview:imgView];
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.backgroundColor = [UIColor clearColor];
    }
    
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    if (dic != nil && [dic count] > 0) {
        if (_selectedRow == indexPath.row) {
            cell.contentView.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:32 / 255.0 blue:39 / 255.0 alpha:1.0];
            cell.imageView.image = [UIImage imageNamed:[dic objectForKey:KMENU_SELECTEDICON]];
            cell.textLabel.textColor = [UIColor whiteColor];
        }
        else{
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.imageView.image = [UIImage imageNamed:[dic objectForKey:KMENU_NORMOLICON]];
            cell.textLabel.textColor = [UIColor colorWithRed:121 / 255.0 green:126 / 255.0 blue:134 / 255.0 alpha:1.0];
        }
        
        cell.textLabel.text = [dic objectForKey:KMENU_TITLE];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *oldDic = [_dataSource objectAtIndex:_selectedRow];
    UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedRow inSection:0]];
    if (oldDic != nil && [oldDic count] > 0 && oldCell) {
        oldCell.contentView.backgroundColor = [UIColor clearColor];
        oldCell.imageView.image = [UIImage imageNamed:[oldDic objectForKey:KMENU_NORMOLICON]];
        oldCell.textLabel.textColor = [UIColor colorWithRed:121 / 255.0 green:126 / 255.0 blue:134 / 255.0 alpha:1.0];
    }
    
    _selectedRow = indexPath.row;
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (dic != nil && [dic count] > 0) {
        cell.contentView.backgroundColor = [UIColor colorWithRed:28 / 255.0 green:32 / 255.0 blue:39 / 255.0 alpha:1.0];
        cell.imageView.image = [UIImage imageNamed:[dic objectForKey:KMENU_SELECTEDICON]];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
}

@end
