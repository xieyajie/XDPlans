//
//  XDAccountLoginViewControllers.m
//  XDPlans
//
//  Created by xieyajie on 13-9-3.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#define KACCOUNT_TAG_USERNAME 100
#define KACCOUNT_TAG_PASSWORD 99
#define KACCOUNT_TAG_EMAIL 98

#import "XDAccountLoginViewController.h"

#import "XDPlanLocalDefault.h"

@interface XDAccountLoginViewController ()
{
    UIButton *_headerButton;
    
    UITextField *_nameField;
    UITextField *_emailField;
    UITextField *_passwordField;
}

@end

@implementation XDAccountLoginViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"注册 / 登陆";
    self.view.backgroundColor = [UIColor colorWithRed:223 / 255.0 green:221 / 255.0 blue:212 / 255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //tableHeaderView
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    _headerButton = [[UIButton alloc] initWithFrame:CGRectMake((headerView.frame.size.width - 80) / 2, (headerView.frame.size.height - 80) / 2, 80.0, 80.0)];
    [_headerButton setImage:[UIImage imageNamed:@"userLogout.png"] forState:UIControlStateNormal];
    _headerButton.layer.cornerRadius = 80 / 2;
    _headerButton.layer.masksToBounds = YES;
    _headerButton.layer.borderWidth = 2.0f;
    _headerButton.layer.borderColor = [[UIColor colorWithRed:139 / 255.0 green:142 / 255.0 blue:147 / 255.0 alpha:1.0] CGColor];
    [_headerButton addTarget:self action:@selector(chooseHeaderImage:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_headerButton];
    [self.tableView setTableHeaderView:headerView];
    
    //tableFootView
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake((160 - 100) / 2, 10, 100, 40);
    registerButton.layer.cornerRadius = 10.0;
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.borderWidth = 2.0f;
    registerButton.layer.borderColor = [[UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0] CGColor];
    registerButton.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [footView addSubview:registerButton];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(160 + 60 / 2, 10, 100, 40);
    loginButton.layer.cornerRadius = 10.0;
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.borderWidth = 2.0f;
    loginButton.layer.borderColor = [[UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0] CGColor];
    loginButton.backgroundColor = [UIColor colorWithRed:123 / 255.0 green:171 / 255.0 blue:188 / 255.0 alpha:1.0];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [footView addSubview:loginButton];
    
    UILabel *footLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, footView.frame.size.width, 40)];
    footLabel.backgroundColor = [UIColor clearColor];
    footLabel.font = [UIFont boldSystemFontOfSize:12.0];
    footLabel.textAlignment = KTextAlignmentCenter;
    footLabel.textColor = [UIColor grayColor];
    footLabel.text = @"欢迎使用 XDPlans ,该产品由XDStudio出品";
    [footView addSubview:footLabel];
    
    [self.tableView setTableFooterView:footView];
    
    [self initTextField];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            [view removeFromSuperview];
    
            break;
        }
    }
    
    switch (100 - indexPath.row) {
        case KACCOUNT_TAG_USERNAME:
            [cell.contentView addSubview:_nameField];
            break;
        case KACCOUNT_TAG_EMAIL:
            [cell.contentView addSubview:_emailField];
            break;
        case KACCOUNT_TAG_PASSWORD:
            [cell.contentView addSubview:_passwordField];
            break;
            
        default:
            break;
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
    
}

#pragma mark - UIScrollView delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

#pragma mark - button/item action

- (void)chooseHeaderImage:(id)sender
{
    
}

#pragma mark - private

- (void)initTextField
{
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, self.tableView.frame.size.width - 40, 40)];
    _nameField.tag = KACCOUNT_TAG_USERNAME;
    _nameField.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0];
    _nameField.borderStyle = UITextBorderStyleRoundedRect;
    _nameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _nameField.leftViewMode = UITextFieldViewModeAlways;
    _nameField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account_contacts.png"]];
    
    _emailField = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, self.tableView.frame.size.width - 40, 40)];
    _emailField.tag = KACCOUNT_TAG_EMAIL;
    _emailField.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0];
    _emailField.borderStyle = UITextBorderStyleRoundedRect;
    _emailField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _emailField.leftViewMode = UITextFieldViewModeAlways;
    _emailField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account_email.png"]];
    
    _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, self.tableView.frame.size.width - 40, 40)];
    _passwordField.tag = KACCOUNT_TAG_PASSWORD;
    _passwordField.secureTextEntry = YES;
    _passwordField.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1.0];
    _passwordField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passwordField.leftViewMode = UITextFieldViewModeAlways;
    _passwordField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account_password.png"]];
}

@end
