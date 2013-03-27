//
//  RootViewController.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-26.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "RootViewController.h"

#import "TestViewController1.h"
#import "TestViewController2.h"
#import "TestViewController3.h"
#import "TestViewController4.h"

#import "BaseNavigationController.h"

#import <QuartzCore/QuartzCore.h>

#import "GLCFootbarController.h"

@interface RootViewController ()
{
    BaseNavigationController *_testViewController1;
    BaseNavigationController *_testViewController2;
    BaseNavigationController *_testViewController3;
    BaseNavigationController *_testViewController4;
    
    GLCFootbarController *_footBarController;
}
@end

@implementation RootViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        
        self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20);
        
        _testViewController1 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController1 alloc] init]];
        _testViewController1.navigationBarHidden = YES;

        _testViewController2 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController2 alloc] init]];

        _testViewController3 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController3 alloc] init]];

        _testViewController4 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController4 alloc] init]];
        _testViewController4.navigationBarHidden = YES;
        
        NSMutableArray *footbarArray = [[NSMutableArray alloc] initWithObjects:_testViewController1,_testViewController2,_testViewController3,_testViewController4, nil];
        
        _footBarController = [[GLCFootbarController alloc] initWithFootBarArray:footbarArray];
        
        NSAssert([_footBarController.footbarArray count] == 4, @"GLCFootBar is only support 4 items , Maybe will support another count items in futhure . 2013.03.27");
        
        [self.view addSubview: _footBarController.view];
        
    }
    return self;
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
