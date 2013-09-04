//
//  XDMenuViewController.m
//  XDPlans
//
//  Created by xie yajie on 13-9-1.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "XDMenuViewController.h"

#import "JASidePanelController.h"
#import "XDAccountLoginViewController.h"
#import "XDTodayPlanViewController.h"
#import "XDAllPlansViewController.h"
#import "XDMenuCell.h"

#import "XDPlanLocalDefault.h"

#define KMENU_TITLE @"title"
#define KMENU_NORMOLICON @"icon_normal"
#define KMENU_SELECTEDICON @"icon_selected"

@interface XDMenuViewController ()
{
    NSMutableArray *_dataSource;
    UIView *_headerView;
    UIButton *_headerButton;
    UILabel *_nameLabel;
    
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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSucceed:) name:KNOTIFICATION_LOGIN object:nil];
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
        
        _headerButton = [[UIButton alloc] initWithFrame:CGRectMake((_headerView.frame.size.width * KSIDESLIP_PERCENT - 80) / 2, 20, 80, 80)];
        [_headerButton addTarget:self action:@selector(tapHeaderView:) forControlEvents:UIControlEventTouchUpInside];
        [_headerButton setImage:[UIImage imageNamed:@"userLogoutDefault.png"] forState:UIControlStateNormal];
        _headerButton.layer.cornerRadius = 80 / 2;
        _headerButton.layer.masksToBounds = YES;
        _headerButton.layer.borderWidth = 2.0f;
        _headerButton.layer.borderColor = [[UIColor colorWithRed:139 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0] CGColor];
        [_headerView addSubview:_headerButton];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, _headerButton.frame.origin.y + 80 + 15, _headerView.frame.size.width * KSIDESLIP_PERCENT - 10, 20)];
        _nameLabel.textAlignment = KTextAlignmentCenter;
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor colorWithRed:139 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0];
        _nameLabel.text = @"未登录";
        [_headerView addSubview:_nameLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeaderView:)];
        [_headerView addGestureRecognizer:tap];
    }
    
    return _headerView;
}

#pragma mark - notification

- (void)loginSucceed:(NSNotification *)notification
{
    id object = notification.object;
    if ([object isKindOfClass:[UIImage class]]) {
        UIImage *image = (UIImage *)object;
        if (image == nil) {
            image = [UIImage imageNamed:@"userLoginDefault.png"];
        }
        [_headerButton setImage:image forState:UIControlStateNormal];
    }
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
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.availableSize = CGSizeMake(self.tableView.frame.size.width * KSIDESLIP_PERCENT, KSIDESLIP_CELL_HEIGHT);
    }
    
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.row];
    if (dic != nil && [dic count] > 0) {
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
    if (_selectedRow != indexPath.row) {
        _selectedRow = indexPath.row;
        
        NSString *title = [[_dataSource objectAtIndex:indexPath.row] objectForKey:KMENU_TITLE];
        if ([title isEqualToString:@"想做的事"]) {
            XDAllPlansViewController *allPlansVC = [[XDAllPlansViewController alloc] init];
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:allPlansVC];
        }
        else if([title isEqualToString:@"正在进行"])
        {
            
        }
        else if ([title isEqualToString:@"今日计划"])
        {
            XDTodayPlanViewController *todayPlanVC = [[XDTodayPlanViewController alloc] initWithStyle:UITableViewStylePlain];
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:todayPlanVC];
        }
        else if ([title isEqualToString:@"设置"])
        {
            
        }
        
        UINavigationController *navigation = (UINavigationController *)self.sidePanelController.centerPanel;
        navigation.navigationBar.tintColor = [UIColor colorWithRed:143 / 255.0 green:183 / 255.0 blue:198 / 255.0 alpha:1.0];
    }
}

#pragma mark - GestureRecognizer

- (void)tapHeaderView:(UITapGestureRecognizer *)tap
{
    XDAccountLoginViewController *accountVC = [[XDAccountLoginViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:accountVC];
    navigation.navigationBar.tintColor = [UIColor colorWithRed:143 / 255.0 green:183 / 255.0 blue:198 / 255.0 alpha:1.0];
    self.sidePanelController.centerPanel = navigation;
}

@end
