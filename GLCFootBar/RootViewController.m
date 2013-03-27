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

#import "BaseNavigationController.h"

#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()
{
    UIView *_mainView;
    GLCFootBar *_footBar;
    
    BaseNavigationController *_testViewController1;
    BaseNavigationController *_testViewController2;
    BaseNavigationController *_testViewController3;
    BaseNavigationController *_testViewController4;
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
        
        _testViewController1 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController1 alloc] init]];
        _testViewController1.navigationBarHidden = YES;

        _testViewController2 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController2 alloc] init]];

        _testViewController3 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController3 alloc] init]];

        _testViewController4 = [[BaseNavigationController alloc] initWithRootViewController:[[TestViewController4 alloc] init]];
        _testViewController4.navigationBarHidden = YES;

        
    }
    return self;
}

- (void)test:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            if ([_testViewController1 isShown]) {
                [_testViewController1 popToRootViewControllerAnimated:YES];
            }
            else
            {
                if ([_testViewController2 isShown]) {
                    [_testViewController2 dismissViewOnSuperView];
                }
                else if ([_testViewController3 isShown])
                {
                    [_testViewController3 dismissViewOnSuperView];
                }
                else if ([_testViewController4 isShown])
                {
                    [_testViewController4 dismissViewOnSuperView];
                }
                
                [_testViewController1 showViewOn:_mainView];
            }
            break;
        }
        case 1:
        {
            if ([_testViewController2 isShown]) {
                [_testViewController2 popToRootViewControllerAnimated:YES];
            }
            else
            {
                if ([_testViewController1 isShown]) {
                    [_testViewController1 dismissViewOnSuperView];
                }
                else if ([_testViewController3 isShown])
                {
                    [_testViewController3 dismissViewOnSuperView];
                }
                else if ([_testViewController4 isShown])
                {
                    [_testViewController4 dismissViewOnSuperView];
                }
                
                [_testViewController2 showViewOn:_mainView];
            }
            break;
        }
        case 2:
        {
            if ([_testViewController3 isShown]) {
                [_testViewController3 popToRootViewControllerAnimated:YES];
            }
            else
            {
                if ([_testViewController2 isShown]) {
                    [_testViewController2 dismissViewOnSuperView];
                }
                else if ([_testViewController1 isShown])
                {
                    [_testViewController1 dismissViewOnSuperView];
                }
                else if ([_testViewController4 isShown])
                {
                    [_testViewController4 dismissViewOnSuperView];
                }
                
                [_testViewController3 showViewOn:_mainView];
            }
            break;
        }
        case 3:
        {
            if ([_testViewController4 isShown]) {
                [_testViewController4 popToRootViewControllerAnimated:YES];
            }
            else
            {
                if ([_testViewController2 isShown]) {
                    [_testViewController2 dismissViewOnSuperView];
                }
                else if ([_testViewController3 isShown])
                {
                    [_testViewController3 dismissViewOnSuperView];
                }
                else if ([_testViewController1 isShown])
                {
                    [_testViewController1 dismissViewOnSuperView];
                }
                
                [_testViewController4 showViewOn:_mainView];
            }
            break;
        }
        default:
            break;
    }

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
