//
//  GLCBaseNavigationController.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-27.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "GLCBaseNavigationController.h"

@interface GLCBaseNavigationController ()

@property (nonatomic, readwrite) BOOL isShown;

@end

@implementation GLCBaseNavigationController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _isShown = NO;
    }
    return self;
}

- (void)showViewOn:(UIView *)superView
{
    self.view.frame = superView.bounds;
    
    [superView addSubview:self.view];
    
    _isShown = YES;
}

- (void)dismissViewOnSuperView
{
    [self.view removeFromSuperview];
    
    _isShown = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
