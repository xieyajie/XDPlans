//
//  XDTodayPlanViewController.m
//  XDPlans
//
//  Created by xie yajie on 13-9-1.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "XDTodayPlanViewController.h"

#import "XDWeatherManager.h"

#import "XDPlanLocalDefault.h"

#define KTODAY_DATA_TITLE @"title"
#define KTODAY_DATA_ICON_NORMAL @"icon_normal"
#define KTODAY_DATA_ICON_SELECTED @"icon_selected"
#define KTODAY_CELL_LAYOUTTYPE @"layoutType"

@interface XDTodayPlanViewController ()
{
    NSMutableArray *_dataSource;
}

@property (nonatomic, strong) UIView *headerView;

@end

@implementation XDTodayPlanViewController

@synthesize headerView = _headerView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"今日工作量指数", KTODAY_DATA_TITLE, @"menu_allPlans.png", KTODAY_DATA_ICON_NORMAL, @"menu_allPlansSelected.png", KTODAY_DATA_ICON_SELECTED, [NSNumber numberWithInteger:0], KTODAY_CELL_LAYOUTTYPE, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"完成信心指数", KTODAY_DATA_TITLE, @"menu_allPlans.png", KTODAY_DATA_ICON_NORMAL, @"menu_allPlansSelected.png", KTODAY_DATA_ICON_SELECTED, [NSNumber numberWithInteger:0], KTODAY_CELL_LAYOUTTYPE, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"今日安排", KTODAY_DATA_TITLE, @"menu_allPlans.png", KTODAY_DATA_ICON_NORMAL, @"menu_allPlansSelected.png", KTODAY_DATA_ICON_SELECTED, [NSNumber numberWithInteger:1], KTODAY_CELL_LAYOUTTYPE, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"今日安排", KTODAY_DATA_TITLE, @"menu_allPlans.png", KTODAY_DATA_ICON_NORMAL, @"menu_allPlansSelected.png", KTODAY_DATA_ICON_SELECTED, [NSNumber numberWithInteger:2], KTODAY_CELL_LAYOUTTYPE, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"今日总结", KTODAY_DATA_TITLE, @"menu_allPlans.png", KTODAY_DATA_ICON_NORMAL, @"menu_allPlansSelected.png", KTODAY_DATA_ICON_SELECTED, [NSNumber numberWithInteger:2], KTODAY_CELL_LAYOUTTYPE, nil]];
        [_dataSource addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"给自己今天的表现打个分吧", KTODAY_DATA_TITLE, @"menu_allPlans.png", KTODAY_DATA_ICON_NORMAL, @"menu_allPlansSelected.png", KTODAY_DATA_ICON_SELECTED, [NSNumber numberWithInteger:0], KTODAY_CELL_LAYOUTTYPE, nil]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.title = @"今日计划";
    self.view.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:221 / 255.0 blue:212 / 255.0 alpha:1.0];
    
    self.tableView.tableHeaderView = self.headerView;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - get

- (UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 80)];
        _headerView.backgroundColor = [UIColor clearColor];
        _headerView.layer.borderWidth = 1.0f;
        _headerView.layer.borderColor = [[UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0] CGColor];
        
        UILabel *ymLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _headerView.frame.size.width, 20)];
        ymLabel.backgroundColor = [UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0];
        ymLabel.font = [UIFont systemFontOfSize:14.0];
        ymLabel.textColor = [UIColor whiteColor];
        ymLabel.text = @"2013 - 09  星期一";
        [_headerView addSubview:ymLabel];
        
        //dateView
        UIView *dateView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 70, 60)];
        dateView.backgroundColor = [UIColor clearColor];
        [_headerView addSubview:dateView];
        
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, dateView.frame.size.width, dateView.frame.size.height)];
        dayLabel.backgroundColor = [UIColor whiteColor];
        dayLabel.textAlignment = KTextAlignmentCenter;
        dayLabel.font = [UIFont boldSystemFontOfSize:35.0];
        dayLabel.textColor = [UIColor colorWithRed:91 / 255.0 green:142 / 255.0 blue:161 / 255.0 alpha:1.0];
        dayLabel.text = @"29";
        [dateView addSubview:dayLabel];
        
        //moodButton
        UIButton *moodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        moodButton.frame = CGRectMake(self.tableView.frame.size.width - 70, 20, 70, 60);
        moodButton.backgroundColor = [UIColor whiteColor];
        [_headerView addSubview:moodButton];
        
        moodButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        moodButton.titleLabel.textAlignment = KTextAlignmentCenter;
        [moodButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [moodButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [moodButton setTitle:@"选个心情呗" forState:UIControlStateNormal];
        [moodButton setTitleEdgeInsets:UIEdgeInsetsMake(moodButton.frame.size.height - 20, 0, 0, 0)];
        
        //weatherButton
        UIView *weatherView = [[UIView alloc] initWithFrame:CGRectMake(dateView.frame.origin.x + dateView
                                                                       .frame.size.width, 20, self.tableView.frame.size.width - dateView.frame.size.width - moodButton.frame.size.width, 60)];
        weatherView.backgroundColor = [UIColor whiteColor];
        [_headerView addSubview:weatherView];
        
        UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, weatherView.frame.size.height)];
        leftLine.backgroundColor = [UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0];
        [weatherView addSubview:leftLine];
        
        UIView *rightLine = [[UIView alloc] initWithFrame:CGRectMake(weatherView.frame.size.width - 1, 0, 1, weatherView.frame.size.height)];
        rightLine.backgroundColor = [UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0];
        [weatherView addSubview:rightLine];
        
        NSDictionary *weatherDic = [[XDWeatherManager shareWeather] weatherInfo];

        UIImageView *weatherImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, weatherView.frame.size.width / 3, weatherView.frame.size.height)];
        weatherImgView.contentMode = UIViewContentModeScaleAspectFit;
        weatherImgView.image = [weatherDic objectForKey:KWEATHER_IMAGE];
        [weatherView addSubview:weatherImgView];
        
        NSString *sweather = [[NSString alloc]initWithFormat:@"%@\n%@~%@",[weatherDic objectForKey:KWEATHER_WEATHER], [weatherDic objectForKey:KWEATHER_TEMP_MIN], [weatherDic objectForKey:KWEATHER_TEMP_MAX]];
        UILabel *weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(weatherImgView.frame.origin.x + weatherImgView.frame.size.width, 0, weatherView.frame.size.width / 3 * 2, weatherView.frame.size.height)];
        weatherLabel.numberOfLines = 0;
        weatherLabel.backgroundColor = [UIColor clearColor];
        weatherLabel.text = sweather;
        [weatherView addSubview:weatherLabel];
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = @"123";
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KTODAY_CELL_HEIGHT_CONTENT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
