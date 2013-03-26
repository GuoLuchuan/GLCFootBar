//
//  RootViewController.m
//  GLCFootBar
//
//  Created by guo luchuan on 13-3-26.
//  Copyright (c) 2013年 yours. All rights reserved.
//

#import "RootViewController.h"
#import "GLCFootBar.h"
#import "GLCFootBarItem.h"

#import "TestViewController1.h"
#import "TestViewController2.h"
#import "TestViewController3.h"
#import "TestViewController4.h"

#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()
{
    UIView *_mainView;
    GLCFootBar *_footBar;
    
    TestViewController1 *_testViewController1;
    TestViewController2 *_testViewController2;
    UINavigationController *_testViewController3;
    TestViewController4 *_testViewController4;
}
@end

@implementation RootViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        
        self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20);
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49)];
        _mainView.backgroundColor = [UIColor grayColor];
        _footBar = [GLCFootBar footBarWithType:FootBarTypeFlip];
        _footBar.frame = CGRectMake(0, _mainView.frame.origin.x + _mainView.frame.size.height, _footBar.frame.size.width, _footBar.frame.size.height);
        
        [((GLCFootBarItem *)[_footBar.footBarItemList objectAtIndex:0]) addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        [((GLCFootBarItem *)[_footBar.footBarItemList objectAtIndex:1]) addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        [((GLCFootBarItem *)[_footBar.footBarItemList objectAtIndex:2]) addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        [((GLCFootBarItem *)[_footBar.footBarItemList objectAtIndex:3]) addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_mainView];
        [self.view addSubview:_footBar];
        
        _testViewController1 = [[TestViewController1 alloc] init];
        _testViewController2 = [[TestViewController2 alloc] init];
        _testViewController3 = [[TestViewController3 alloc] init];
        _testViewController4 = [[TestViewController4 alloc] init];
        
    }
    return self;
}

- (void)test:(UIButton *)sender
{
    NSLog(@"here");
    
    for (UIView *view in [_mainView subviews]) {
        [view removeFromSuperview];
    }
    
    switch (sender.tag) {
        case 0:
            [_mainView addSubview: _testViewController1.view];
            break;
        case 1:
            [_mainView addSubview: _testViewController2.view];
            break;
        case 2:
        {
            _testViewController3.navigationController.title = @"test";
            self.navigationController.title = @"test";
            _testViewController3.title = @"11111";
            
            _testViewController3.navigationItem.title = @"123123";
            
            self.title = @"22222";
            
            [_mainView addSubview: _testViewController3.view];
            
            break;
            
        }
        case 3:
            [_mainView addSubview: _testViewController4.view];
            break;
        default:
            break;
    }
    
//    _mainView = _testViewController3.view;
    
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = .5;
    
    [_mainView.layer addAnimation:transition forKey:@"animationTest"];
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
