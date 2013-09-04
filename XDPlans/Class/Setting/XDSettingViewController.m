//
//  XDSettingViewController.m
//  XDPlans
//
//  Created by xieyajie on 13-9-4.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDSettingViewController.h"

#define KSETTING_SECTION_TITLE @"headerTitle"
#define KSETTING_SECTION_SOURCE @"source"
#define KSETTING_CELL_TITLE @"title"
#define KSETTING_CELL_SELECTOR @"selector"

@interface XDSettingViewController ()
{
    NSDictionary *_dataSource;
}

@end

@implementation XDSettingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self configationData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.title = @"设置";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:221 / 255.0 blue:212 / 255.0 alpha:1.0];
    self.tableView.separatorColor = [UIColor colorWithRed:209 / 255.0 green:207 / 255.0 blue:199 / 255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [NSString stringWithFormat:@"%i", section];
    return [[[_dataSource objectForKey:key] objectForKey:KSETTING_SECTION_SOURCE] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [NSString stringWithFormat:@"%i", section];
    return [[_dataSource objectForKey:key] objectForKey:KSETTING_SECTION_TITLE];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0];
    }
    
    NSString *sectionKey = [NSString stringWithFormat:@"%i",indexPath.section];
    NSString *rowKey = [NSString stringWithFormat:@"%i", indexPath.row];
    NSDictionary *rowDic = [[[_dataSource objectForKey:sectionKey] objectForKey:KSETTING_SECTION_SOURCE] objectForKey:rowKey];
    if (rowDic != nil) {
        cell.textLabel.text = [rowDic objectForKey:KSETTING_CELL_TITLE];
    }
    
    return cell;
}

#pragma mark - Table view delegate


#pragma mark - data source

- (void)configationData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"XDSetting" ofType:@"plist"];
    _dataSource = [NSDictionary dictionaryWithContentsOfFile:path];
}

@end
