//
//  XDCutImageViewController.m
//  XDPlans
//
//  Created by xie yajie on 13-9-4.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDCutImageViewController.h"

#import "XDPlanLocalDefault.h"

@interface XDCutImageViewController ()
{
    UIImage *_originalImage;
    UIImageView *_imageView;
    UIView *_boundView;
}

@end

@implementation XDCutImageViewController

- (id)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        // Custom initialization
        _originalImage = image;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.e
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.contentMode = UIViewContentModeScaleAspectFit;
    bgView.image = _originalImage;
    [self.view addSubview:bgView];
    
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    shadowView.backgroundColor = [UIColor grayColor];
    shadowView.alpha = 0.5;
    [self.view addSubview:shadowView];
    
    _boundView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - KUSER_HEADERIMAGE_WIDTH) / 2, (self.view.frame.size.height - KUSER_HEADERIMAGE_HEIGHT) / 2, KUSER_HEADERIMAGE_WIDTH, KUSER_HEADERIMAGE_HEIGHT)];
//    _boundView.backgroundColor = [UIColor redColor];
    [shadowView addSubview:_boundView];
    
    _imageView = [[UIImageView alloc] initWithImage:_originalImage];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    CGRect rect = [_imageView convertRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) toView:_boundView];
    _imageView.frame = rect;
    [_boundView addSubview:_imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
